from flask import render_template, jsonify, request, session, redirect
from . import routes
import requests

@routes.route('/users')
def users():
    if ('savedToken' in session.keys()):
        # 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImJldHR5QGVtYWlsLmNvbSJ9.3sFcNmL-V3M5X02P6nvj9OQ5IvbiXXF3OIL4b4xwfrs'
        headers = {'x-auth-token': session['savedToken']}
        data = requests.get('http://localhost:5000/api/v1/users/all', headers=headers)
        data = data.json()
        return render_template('users.html', data_one=data)
    print("SESIO NO INICIADA")
    return redirect('/')
