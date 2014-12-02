# -*- coding: utf-8 -*-

import webapp2
from webapp2 import Route
from webapp2 import WSGIApplication
from webapp2_extras.routes import RedirectRoute

from handlers import home, projects, sbc

app = WSGIApplication([
    RedirectRoute('/', redirect_to_name='projects-index'),
    Route('/projects/', projects.Index, name='projects-index'),
    RedirectRoute('/projects', redirect_to_name='projects-index'),
    Route('/projects/guid/', projects.Guid, name='projects-guid'),
    Route('/silverbulletcookbook/', sbc.Index, name='sbc-index'),
    RedirectRoute('/silverbulletcookbook', redirect_to_name='sbc-index'),
    Route('/silverbulletcookbook/features', sbc.Features, name='sbc-features'),
    Route('/silverbulletcookbook/download', sbc.Download, name='sbc-download'),
], debug=False)
