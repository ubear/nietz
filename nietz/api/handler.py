#!/usr/bin/env python
# encoding: utf-8
import tornado.web

from django.conf import settings


mysql_settings = {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'nietz',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
settings.configure(debug=True, **mysql_settings)

import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'nietz.settings'

from nietz.app.models import Game
print Game.objects.all()

class GameListHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, my first tornado app.")
