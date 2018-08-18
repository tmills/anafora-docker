#!/usr/bin/python
import os, sys


if '/anafora/src/' not in sys.path:
    sys.path.append('/anafora/src/')

#print sys.path

os.environ['DJANGO_SETTINGS_MODULE'] = 'web.settings'
# import django.core.handlers.wsgi
# application = django.core.handlers.wsgi.WSGIHandler()
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()