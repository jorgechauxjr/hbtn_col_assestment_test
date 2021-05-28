from flask import render_template, jsonify, request
from . import routes
import requests

@routes.route('/')
def home():
    return render_template('index.html')

@routes.route('/signup')
def signup():
    return render_template('signup.html')
