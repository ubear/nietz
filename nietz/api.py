#!/usr/bin/env python
# encoding: utf-8
import os
import time
import json
import hashlib
import pylibmc
import logging

os.environ['DJANGO_SETTINGS_MODULE'] = 'nietz.settings'

import tornado.web
import tornado.ioloop
import tornado.httpserver

from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger

from app.models import Game
from nietz import settings

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
path = os.path.dirname(os.path.abspath(__file__)) + "/logs/tornado_api.log"
handler = logging.FileHandler(path)
handler.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)


class CacheMixin(object):

    def prepare(self):
        super(CacheMixin, self).prepare()
        self._cache_key = self._generate_cache_key()
        if settings.Enable_mc and (not self.is_update_cache):
            content = self.page_cache.get(self._cache_key)
            if isinstance(content, dict) and content.has_key(settings.expire_s_key):
                if content.get(settings.expire_s_key) > int(time.time()):
                    logger.info("Do   hit: " + self._cache_key)
                    self.write_cache(content)
                    self.finish()
                else:
                    self.content = content
                    logger.info("Soft exp: " + self._cache_key)
            else:
                logger.debug("No   hit: " + self._cache_key)
        else:
            logger.debug("Is not update.")

    def write_cache(self, chunk):
        json_data = json.dumps(chunk)
        super(CacheMixin, self).write(json_data)

    def initialize(self, page_cache):
        self._cache_key = None
        self._result_buffer = []
        self.page_cache = page_cache


    def _generate_cache_key(self):
        sorted_keys = sorted(self.request.arguments.items(), key=lambda x: x[0])
        params = []
        for item in sorted_keys:
            params.append(item[0] + "=" + item[1][0])
        hash_url = "{}?{}".format(self.request.path, "&".join(params))
        hash_code = hashlib.md5(hash_url).hexdigest()[8:24]
        return hash_code

    @property
    def is_update_cache(self):
        return False # get some arguments from self.request.headers

    def write(self, chunk):
        logger.info("First ac: " + self._cache_key)
        content = chunk
        soft_expire = int(time.time() + settings.expire_1M)
        content.update({settings.expire_s_key: soft_expire})
        real_expire = soft_expire + settings.expire_1H
        self.page_cache.set(self._cache_key, content, real_expire)
        logger.info("Set  key: " + self._cache_key)
        super(CacheMixin, self).write(json.dumps(content))


class GamelistHandler(CacheMixin, tornado.web.RequestHandler):
    # @tornado.web.asynchronous
    def get(self):
        page = self.get_argument("page", 1)
        page_num = self.get_argument("num", getattr(settings, 'PAGE_MAX_NUM', 10))
        games = Game.objects.all().order_by('-active', '-ctime')
        paginator = Paginator(games, page_num)
        try:
            games = paginator.page(page)
        except PageNotAnInteger:
            games = paginator.page(1)
        except EmptyPage:
            games = paginator.page(paginator.num_pages)

        rotations = []
        others = []
        for g in games:
            entry = {"id": g.id, "name": g.name, "download": g.download,
                     "logo": g.logo.url, "rotation": g.rotation.url, "active": g.active,
                     "ctime": g.ctime.strftime("%Y-%m-%d %H:%M:%S")}
            if g.active:
                rotations.append(entry)
            else:
                others.append(entry)
        games = {"others": others}
        if rotations:
            games.update({"rotations": rotations})
        self.write(games)
        # self.finish()


def make_tornado_app():
    page_cache = pylibmc.Client(['127.0.0.1'], binary=True,
        behaviors={"tcp_nodelay": True, "ketama": True})
    application = tornado.web.Application([
        (r"/api/", GamelistHandler, dict(page_cache=page_cache)), ], debug=True)
    return application


if __name__ == "__main__":
    app = make_tornado_app()
    http_server = tornado.httpserver.HTTPServer(app)
    http_server.listen(8888)
    tornado.ioloop.IOLoop.instance().start()
