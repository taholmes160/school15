# app/__init__.py

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager
from config import Config
from app.utils import has_role  # Import the has_role function

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

    # Register custom filter
    @app.template_filter('get_role_groups')
    def get_role_groups(role):
        return [group.name for group in role.groups]

    # Make has_role function available to templates
    app.jinja_env.globals['has_role'] = has_role

    return app
