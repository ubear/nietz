#!/usr/bin/env python
# encoding: utf-8
import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'nietz.settings'

import tornado.web
import tornado.ioloop
from django.core import serializers

from app.models import Game


class GamelistHandler(tornado.web.RequestHandler):
    # @tornado.web.asynchronous
    def get(self):
        games = Game.objects.all() # get all the data just once
        games = serializers.serialize('json', games)
        self.set_header('Content-Type', 'text/javascript')
        self.write(games)
        # self.finish()


settings = {}
application = tornado.web.Application([
    (r"/", GamelistHandler), ], debug=True, **settings)


if __name__ == "__main__":
    application.listen(8888)
    tornado.ioloop.IOLoop.current().start()
