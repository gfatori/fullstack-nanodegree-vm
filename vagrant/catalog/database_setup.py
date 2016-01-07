#!/usr/bin/env python
#
# database_setup.py -- implementation of the database for catalog, using
# SQLAlchemy
import sys
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

Base = declarative_base()


class Category(Base):

    __tablename__ = 'category'

    name = Column(String(80), nullable=False)
    id = Column(Integer, primary_key=True)
    description = Column(String(140), nullable=True)


class item(Base):

    __tablename__ = 'item'

    name = Column(String(80), nullable=False)
    id = Column(Integer, primary_key=True)
    description = Column(String(140), nullable=True)
    category_id = Column(Integer, ForeignKey('category.id'))
    category = relationship(Category)

# End of File ###############################################################
engine = create_engine('postgresql:///catalog')
Base.metadata.create_all(engine)
