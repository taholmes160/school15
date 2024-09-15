import sys
import os

# Add the project directory to the Python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from app import db, create_app
from app.models import Role, RoleGroup, RoleGroupMembership

# Initialize the Flask app context
app = create_app()
app.app_context().push()

# List of roles and their groups
roles = [
    {'name': 'alumni', 'group': 'other'},
    {'name': 'attendance officer', 'group': 'admin'},
    {'name': 'board member', 'group': 'admin'},
    {'name': 'coach', 'group': 'faculty'},
    {'name': 'counselor', 'group': 'faculty'},
    {'name': 'department head', 'group': 'admin'},
    {'name': 'facilities', 'group': 'other'},
    {'name': 'finance officer', 'group': 'admin'},
    {'name': 'food service', 'group': 'other'},
    {'name': 'health staff', 'group': 'other'},
    {'name': 'IT support', 'group': 'admin'},
    {'name': 'librarian', 'group': 'faculty'},
    {'name': 'office staff', 'group': 'other'},
    {'name': 'parent', 'group': 'other'},
    {'name': 'pastor', 'group': 'other'},
    {'name': 'principal', 'group': 'admin'},
    {'name': 'student', 'group': 'student'},
    {'name': 'substitute teacher', 'group': 'faculty'},
    {'name': 'teacher', 'group': 'faculty'},
    {'name': 'vice principal', 'group': 'admin'},
    {'name': 'volunteer', 'group': 'other'}
]

# Create role groups if they don't exist
role_groups = {group.name: group for group in RoleGroup.query.all()}
for group_name in ['admin', 'faculty', 'student', 'other']:
    if group_name not in role_groups:
        group = RoleGroup(name=group_name)
        db.session.add(group)
        role_groups[group_name] = group

# Create roles and associate them with groups
for role_data in roles:
    role = Role.query.filter_by(name=role_data['name']).first()
    if not role:
        role = Role(name=role_data['name'])
        db.session.add(role)
    group = role_groups[role_data['group']]
    if group not in role.groups:
        role.groups.append(group)

db.session.commit()
