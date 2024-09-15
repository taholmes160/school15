# app/decorators.py

from functools import wraps
from flask import abort, current_app
from flask_login import current_user

SUPERUSER_ROLES = ['IT support', 'superadmin']  # Add any other superuser roles here

def role_required(role):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            role_groups = [group.name for group in current_user.role.groups]
            current_app.logger.debug(f"User {current_user.username} has role groups: {role_groups}")
            current_app.logger.debug(f"User {current_user.username} has role: {current_user.role.name}")
            if role not in role_groups and current_user.role.name not in SUPERUSER_ROLES:
                abort(403)
            return f(*args, **kwargs)
        return decorated_function
    return decorator