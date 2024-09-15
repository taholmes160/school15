# config.py

import os

class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school15?charset=utf8mb4&collation=utf8mb4_general_ci'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = 'your_secret_key'
    SESSION_COOKIE_NAME = 'your_session_cookie_name'
    SESSION_COOKIE_HTTPONLY = True
    SESSION_COOKIE_SECURE = False  # Set to True in production with HTTPS
