# -*- coding: utf-8 -*-

from google.appengine.ext import ndb

from handlers.base import BaseHandler


TEMPLATE_FOLDER = 'projects'


class Index(BaseHandler):

    def get(self):
        template_values = {
            'page': 'projects'
        }
        self.render_template(TEMPLATE_FOLDER, 'index.html', template_values)