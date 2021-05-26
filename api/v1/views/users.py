from flask import jsonify
from app import mysql
from api.v1.views import app_views


# app_views variable created in api.v1.views __init.py__
# app_views value is api/v1 
@app_views.route('/users/all')
def get_all_users():
    cur = mysql.connection.cursor()
    query = 'SELECT * FROM users'
    cur.execute(query)
    #data receives a tuple of tuple
    data = cur.fetchall()
    return jsonify(data)
