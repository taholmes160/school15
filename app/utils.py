from flask_login import current_user

def has_role(user, role_name):
    return user.role.name == role_name
