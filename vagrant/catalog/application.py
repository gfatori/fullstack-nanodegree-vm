#!/usr/bin/env python
#
# application.py -- implementation of catalog page.
#
from flask import Flask
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from database_setup import Base, Catalog, Item
app = Flask(__name__)

engine = create_engine('postgresql:///catalog')
Base.metadata.bind = engine
DBSession = sessionmaker(bind=engine)
session = DBSession()


@app.route('/')
def HelloWorld():
        return "Hello"

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=5000)
