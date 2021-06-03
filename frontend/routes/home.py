from flask import render_template, jsonify, request, session, redirect
from . import routes
import requests

@routes.route('/home', methods=['POST', 'GET'])
def home():
    
    return render_template('home.html')
