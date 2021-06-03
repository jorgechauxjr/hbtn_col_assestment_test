from flask import render_template, jsonify, request, session
from . import routes
import requests

@routes.route('/order/<id>')
def order(id):

    headers = {'x-auth-token': session['savedToken']}
    data = requests.get('http://localhost:5000/api/v1/orders/{}'.format(id), headers=headers)
    data = data.json()
    return render_template('order.html', data_one=data)

@routes.route('/orders/ordersid/<ids>')
def allOrdersIds(ids):

    headers = {'x-auth-token': session['savedToken']}
    data = requests.get('http://localhost:5000/api/v1/orders/ordersid/{}'.format(ids), headers=headers)
    data = data.json()
    return render_template('order.html', data_one=data)

@routes.route('/orders/userid/<uId>')
def ordersByUserId(uId):

    headers = {'x-auth-token': session['savedToken']}
    data = requests.get('http://localhost:5000/api/v1/orders/userid/{}'.format(uId), headers=headers)
    data = data.json()
    return render_template('order.html', data_one=data)
