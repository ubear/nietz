#!/usr/bin/env python
# encoding: utf-8
import os
import json

os.environ['DJANGO_SETTINGS_MODULE'] = 'nietz.settings'

import tornado.web
import tornado.ioloop
import tornado.httpserver

from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger

from app.models import Game
from nietz import settings


class GamelistHandler(tornado.web.RequestHandler):
    # @tornado.web.asynchronous
    def get(self):
        page = self.get_argument("page", 1)
        page_num = self.get_argument("num", getattr(settings, 'PAGE_MAX_NUM', 10))
        games = Game.objects.all().order_by('-active', '-ctime') # get all the data just once
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
        self.write(json.dumps(games))
        # self.finish()


application = tornado.web.Application([
    (r"/api/", GamelistHandler), ], debug=True)


if __name__ == "__main__":
    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(8888)
    tornado.ioloop.IOLoop.instance().start()
