# -*- coding: utf-8 -*-

from google.appengine.ext import ndb

from handlers.base import BaseHandler


TEMPLATE_FOLDER = 'sbc'


class Index(BaseHandler):

    def get(self):
        template_values = {
            'page': 'index'
        }
        self.render_template(TEMPLATE_FOLDER, 'index.html', template_values)


class Features(BaseHandler):

    def get(self):
        template_values = {
            'page': 'features'
        }
        self.render_template(TEMPLATE_FOLDER, 'features.html', template_values)


class Download(BaseHandler):

    def get(self):
        template_values = {
            'page': 'download'
        }
        self.render_template(TEMPLATE_FOLDER, 'download.html', template_values)