# -*- coding: utf-8 -*-

import webapp2
from webapp2 import Route
from webapp2 import WSGIApplication
from webapp2_extras.routes import RedirectRoute

from handlers import sbc

class MainHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write('Hello world!!')

app = WSGIApplication([
    Route('/', MainHandler, name='home'),
    Route('/silverbulletcookbook', sbc.Index, name='sbc-index'),
    Route('/silverbulletcookbook/download', sbc.Download, name='sbc-download'),
], debug=True)
