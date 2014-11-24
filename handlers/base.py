# -*- coding: utf-8 -*-

from os import path

from webapp2 import RequestHandler

import jinja2

def get_environment(folder):
    root = path.join(path.dirname(path.dirname(__file__)), 'templates')
    paths = [path.join(root, folder),
             path.join(root, 'shared')]
    return jinja2.Environment(
        loader=jinja2.FileSystemLoader(paths),
        extensions=['jinja2.ext.autoescape'],
        autoescape=True)

class BaseHandler(RequestHandler):

    def render_template(self, folder, file, template_values={ }):
        env = get_environment(folder)
        template = env.get_template(file)
        template_values['handler'] = self
        self.response.write(template.render(template_values))