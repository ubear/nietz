#!/usr/bin/env python
# encoding: utf-8
import tornado.ioloop
import tornado.web

from handler import GameListHandler


settings = {}
application = tornado.web.Application([
    (r"/", GameListHandler),
    ], debug=True, **settings)


if __name__ == '__main__':
    application.listen(8888)
    tornado.ioloop.IOLoop.current().start()
