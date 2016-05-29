# -*- coding: utf-8 -*-

import os
import urllib

import jinja2
import webapp2
from webapp2 import Route
from webapp2 import WSGIApplication
from webapp2_extras.routes import RedirectRoute


JINJA_ENVIRONMENT = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
    extensions=['jinja2.ext.autoescape'],
    autoescape=True)


class BaseHandler(webapp2.RequestHandler):

    def render_template(self, page, sbc=False):
        template = JINJA_ENVIRONMENT.get_template('templates/layout.html')
        template_values = {
            'page': page,
            'sbc': sbc
        }
        self.response.write(template.render(template_values))


class Home(BaseHandler):

    def get(self):
        self.render_template('Home')


class AboutThisSite(BaseHandler):

    def get(self):
        self.render_template('AboutThisSite')


class Projects(BaseHandler):
    
    def get(self):
        self.render_template('Projects')


class SilverBulletCookbook(BaseHandler):
    
    def get(self):
        self.render_template('SilverBulletCookbook', True)


class SilverBulletCookbookDownload(BaseHandler):
    
    def get(self):
        self.render_template('SilverBulletCookbookDownload', True)


app = WSGIApplication([
    RedirectRoute('/', Home, name='Home'),
    RedirectRoute('/about-this-site', AboutThisSite, name='AboutThisSite'),
    Route('/projects/', Projects, name='Projects'),
    RedirectRoute('/projects', redirect_to_name='Projects'),
    Route('/silverbulletcookbook/', SilverBulletCookbook, name='SilverBulletCookbook'),
    RedirectRoute('/silverbulletcookbook', redirect_to_name='SilverBulletCookbook'),
    Route('/silverbulletcookbook/download', SilverBulletCookbookDownload, name='SilverBulletCookbookDownload'),
], debug=False)