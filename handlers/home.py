# -*- coding: utf-8 -*-

from google.appengine.ext import ndb

from handlers.base import BaseHandler


TEMPLATE_FOLDER = 'home'


class Index(BaseHandler):

    def get(self):
        template_values = {
            'page': 'home'
        }
        self.render_template(TEMPLATE_FOLDER, 'index.html', template_values)