# app/models.py

from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from app import db, login

class RoleGroup(db.Model):
    __tablename__ = 'role_groups'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True, nullable=False)

class Role(db.Model):
        __tablename__ = 'roles'
        id = db.Column(db.Integer, primary_key=True)
        name = db.Column(db.String(64), unique=True, nullable=False)
        groups = db.relationship('RoleGroup', secondary='role_group_memberships', backref=db.backref('roles', lazy='dynamic'))
    
        def __str__(self):
            return self.name
    

class RoleGroupMembership(db.Model):
    __tablename__ = 'role_group_memberships'
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'), primary_key=True)
    group_id = db.Column(db.Integer, db.ForeignKey('role_groups.id'), primary_key=True)

class User(UserMixin, db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), index=True, unique=True)
    email = db.Column(db.String(120), index=True, unique=True)
    password_hash = db.Column(db.String(512))
    first_name = db.Column(db.String(64))
    last_name = db.Column(db.String(64))
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    role = db.relationship('Role', backref=db.backref('users', lazy=True))

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

@login.user_loader
def load_user(id):
    return User.query.get(int(id))
