#!/usr/bin/python3

"""Init file that modularize flask server using blueprints"""
from flask import Blueprint

app_views = Blueprint("app_views", __name__, url_prefix="/api/v1")
from api.v1.views.orders import *
from api.v1.views.authentication import *
from api.v1.views.users import *
