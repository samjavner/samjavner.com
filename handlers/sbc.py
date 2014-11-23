# -*- coding: utf-8 -*-

from google.appengine.ext import ndb

from handlers.base import BaseHandler


TEMPLATE_FOLDER = 'sbc'


class Index(BaseHandler):

    def get(self):
        self.render_template(TEMPLATE_FOLDER, 'index.html')

class Download(BaseHandler):

	def get(self):
		self.render_template(TEMPLATE_FOLDER, 'download.html')