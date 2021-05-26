#!/usr/bin/python3

"""Flask server module"""

from api.v1.views import app_views
from flask import Flask, jsonify
# from flask_cors import CORS
from flask_mysqldb import MySQL

#Initialization
app = Flask(__name__)

# cors = CORS(app, origins="0.0.0.0")
# app.url_map.strict_slashes = False

# Registering Blueprints
# app_views variable created in api.v1.views __init__
app.register_blueprint(app_views)

# Mysql Connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'companydb'
mysql = MySQL(app)

# settings or sesion
# app.secret_key = 'mysecretkey'

@app.errorhandler(404)
def invalid_route(e):
    """Handle 404 error with json response 404"""
    return jsonify(error="Not found"), 404

if __name__ == '__main__':
    # import os
    # app.config['ENV'] = 'development'
    # host = os.getenv("HBNB_API_HOST", '0.0.0.0')
    # port = os.getenv("HBNB_API_PORT", '5000')
    # debug = os.getenv("HBNB_DEBUG", False)
    app.run(port=5000, threaded=True, debug=True)

