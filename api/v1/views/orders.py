from flask import jsonify
from app import mysql
from api.v1.views import app_views

# app_views variable created in api.v1.views __init.py__
# app_views value is api/v1 
@app_views.route('/orders/<id>')
def get_order_by_id(id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM orders WHERE orderid = %s;', [id])
    #data receives a tuple of tuple
    data = cur.fetchall()
    return jsonify(data)
    """
    return jsonify({
        "orderid": data[0][0],
        "date": data[0][1],
        "total": data[0][2],
        "subtotal": data[0][3],
        "taxes": data[0][4],
        "paid": data[0][5]
    })
    """

# receive string with order ids separated by coma and return all orders
@app_views.route('/orders/ordersid/<orders_id>')
def get_orders_by_orderid(orders_id):
    cur = mysql.connection.cursor()
    strIds = orders_id
    arrIds = []
    twoDigitid = ""
    count = 0

    for c in strIds:
        if c is ",":
            count = count + 1
            cur.execute('SELECT * FROM orders WHERE orderid = %s;', [twoDigitid])
            #data receives a tuple of tuple
            data = cur.fetchall()
            arrIds.append(data[0])
            twoDigitid = ""
            continue
        count = count + 1
        twoDigitid = twoDigitid + c
        if(count == len(strIds)):
            cur.execute('SELECT * FROM orders WHERE orderid = %s;', [twoDigitid])
            #data receives a tuple of tuple
            data = cur.fetchall()
            arrIds.append(data[0])
    return jsonify(arrIds)

# Get all orders by userId
@app_views.route('/orders/userid/<user_id>')
def get_order_by_userid(user_id):
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM orders WHERE userid = %s;', [user_id])
    #data receives a tuple of tuple
    data = cur.fetchall()
    return jsonify(data)
