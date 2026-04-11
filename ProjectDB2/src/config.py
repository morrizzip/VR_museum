import os

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-secret-key-change-in-production'
    DATABASE_URI = 'sqlite:///src.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    FLASK_DEBUG = os.getenv('FLASK_DEBUG')
    UPLOAD_FOLDER = os.getenv('UPLOAD_FOLDER')
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URI')