# app/__init__.py

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager
from config import Config

db = SQLAlchemy()
migrate = Migrate()
login = LoginManager()
login.login_view = 'views.login'

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    db.init_app(app)
    migrate.init_app(app, db)
    login.init_app(app)

    from app.views import bp as views_bp
    app.register_blueprint(views_bp)

    from app.lookup_views import bp as lookup_bp
    app.register_blueprint(lookup_bp, url_prefix='/lookup')

    return app
