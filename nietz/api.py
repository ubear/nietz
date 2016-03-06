#!/usr/bin/env python
# encoding: utf-8
import os
import json
# from collections import namedtuple
os.environ['DJANGO_SETTINGS_MODULE'] = 'nietz.settings'

import tornado.web
import tornado.ioloop
from django.core import serializers
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from app.models import Game
# Entry = namedtuple('Entry', ['ied', 'name', 'download', 'logo', 'rotation', 'active', 'ctime'])

class GamelistHandler(tornado.web.RequestHandler):
    # @tornado.web.asynchronous
    def get(self):
        page = self.get_argument("page", 1)
        page_num = getattr(settings, 'PAGE_MAX_NUM', 5)
        games = Game.objects.all().order_by('-active', '-ctime') # get all the data just once
        paginator = Paginator(games, page_num)
        try:
            games = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            games = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
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


settings = {}
application = tornado.web.Application([
    (r"/", GamelistHandler), ], debug=True, **settings)


if __name__ == "__main__":
    application.listen(8888)
    tornado.ioloop.IOLoop.current().start()
