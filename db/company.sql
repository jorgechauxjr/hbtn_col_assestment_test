-- Create Fake database with fake data to try the app

-- create database


CREATE DATABASE IF NOT EXISTS companydb;
USE companydb;

-- create tables

-- users table
CREATE TABLE IF NOT EXISTS users (userid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(255),
lastname VARCHAR(255),
govid VARCHAR(255), 
email VARCHAR(255),
company VARCHAR(255),
password VARCHAR(255));

-- shipping table

CREATE TABLE IF NOT EXISTS shipping (shippingid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
address VARCHAR(255),
city VARCHAR(255),
state VARCHAR(255), 
country VARCHAR(255),
cost INT);

-- payment table

CREATE TABLE IF NOT EXISTS payment (paymentid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
type VARCHAR(255),
date DATE,
txnid INT, 
total INT,
status BOOLEAN);

-- orders table

CREATE TABLE IF NOT EXISTS orders (orderid INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
date DATE,
total INT, 
subtotal INT,
taxes INT,
paid BOOLEAN,
userid INT,
shippingid INT,
paymentid INT,
FOREIGN KEY (userid) REFERENCES users(userid),
FOREIGN KEY (shippingid) REFERENCES shipping(shippingid),
FOREIGN KEY (paymentid) REFERENCES payment(paymentid)
);

-- Insert data to tables

INSERT INTO users (name, lastname, govid, email, company, password) VALUES ("Alan", "Agora", "2", "alan@email.com", "apple", "123"),
("Betty", "Holberton", "3", "betty@email.com", "Holberton School", "123"),
("Dennis", "Ritchie", "1", "dennis@email.com", "apple", "123"),
("Steve", "Jobs", "4", "steve@email.com", "apple", "123"),
("Elon", "Musk", "5", "elon@email.com", "Tesla", "123"),
("Julien", "Barbier", "3", "julien@email.com", "Holberton School", "123"),
("Tori", "Cybill", "3", "qmacro@msn.com", "Rohan-Auer", "123"),
("Masterman", "Aline", "3", "bmidd@sbcglobal.net", "Kuphal and Sons", "123"),
("Selina", "Terrell", "3", "iamcal@sbcglobal.net", "Weimann, Breitenberg and Mueller", "123"),
("Keegan", "Moriah", "3", "danzigism@icloud.com", "Haag Inc", "123"),
("Betsy", "Everard", "3", "timlinux@att.net", "Gusikowski, Lehner and Lueilwitz", "123");

INSERT INTO shipping (address, city, state, country, cost) VALUES ("42 Avenue", "Manhattan", "New York", "USA", "200"),
("50 Avenue", "Miami", "Florida", "USA", "10"),
("23 Avenue", "Orlando", "Florida", "USA", "120"),
("142 Avenue", "San Francisco", "California", "USA", "100"),
("542 Avenue", "Los Angeles", "California", "USA", "15"),
("245 Avenue", "Townsend", "Tennesssee", "USA", "32");


INSERT INTO payment (type, date, txnid, total, status) VALUES ("CreditCard", "2020-10-30", "1", "3000", TRUE),
("PayPal", "2020-09-09", "2", "2500", FALSE),
("PayPal", "2020-01-30", "3", "1500", TRUE),
("CreditCard", "2020-06-12", "4", "2000", FALSE),
("PayPal", "2020-02-02", "5", "3200", TRUE),
("CreditCard", "2020-07-27", "6", "5000", FALSE);

INSERT INTO orders (date, total, subtotal, taxes, paid, userid, shippingid,paymentid) VALUES ("2019-09-09", "350", "250", "100", TRUE, "1", "1", "1"),
("2019-10-09", "350", "250", "100", FALSE, "2", "2", "2"),
("2017-05-09", "350", "250", "100", FALSE, "3", "3", "3"),
("2020-03-09", "350", "250", "100", FALSE, "4", "4", "4"),
("2005-11-09", "350", "250", "100", TRUE, "5", "5", "5"),
("2001-12-09", "350", "250", "100", TRUE, "6", "6", "6"),
("2008-05-17", "120", "150", "12", TRUE, "1", "1", "1"),
("2018-11-22", "1350", "2350", "1500", TRUE, "3", "4", "1"),
("1999-10-22", "50", "2530", "1010", FALSE, "5", "1", "2"),
("1990-05-13", "22", "2570", "105", FALSE, "2", "3", "3"),
("1980-03-25", "32", "2510", "1070", FALSE, "7", "2", "4"),
("2002-11-13", "4750", "2350", "1700", TRUE, "4", "6", "5"),
("2014-12-09", "854", "2450", "1800", TRUE, "2", "5", "6"),
("2002-05-17", "945", "5150", "192", TRUE, "1", "1", "1"),
("2019-10-09", "350", "250", "100", FALSE, "2", "2", "2"),
("2019-05-09", "350", "250", "100", FALSE, "3", "3", "3"),
("2002-03-09", "350", "250", "100", FALSE, "4", "4", "4"),
("2019-11-09", "350", "250", "100", TRUE, "5", "5", "5"),
("2019-12-09", "350", "250", "100", TRUE, "6", "6", "6"),
("2002-05-17", "120", "150", "12", TRUE, "1", "1", "1"),
("2018-11-22", "1350", "2350", "1500", TRUE, "3", "4", "1"),
("2017-10-22", "50", "2530", "1010", FALSE, "5", "1", "2"),
("2017-05-13", "22", "2570", "105", FALSE, "2", "3", "3"),
("2018-03-25", "32", "2510", "1070", FALSE, "7", "2", "4"),
("2011-11-13", "4750", "2350", "1700", TRUE, "4", "6", "5"),
("2014-12-09", "854", "2450", "1800", TRUE, "2", "5", "6"),
("2013-05-17", "945", "5150", "192", TRUE, "1", "1", "1");
