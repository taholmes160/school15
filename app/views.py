# app/views.py

from flask import Blueprint, render_template, flash, redirect, url_for, request, abort
from app import db
from app.models import User, Role, RoleGroup
from flask_login import login_user, logout_user, current_user, login_required
from app.decorators import role_required

bp = Blueprint('views', __name__)

# Home page route
@bp.route('/')
@bp.route('/index')
@login_required
def index():
    role_groups = [group.name for group in current_user.role.groups]
    return render_template('index.html', title='Home', role_groups=role_groups)

# User registration route
@bp.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('views.index'))
    roles = Role.query.all()
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        role_id = request.form['role_id']
        
        if not username or not email or not password or not first_name or not last_name or not role_id:
            flash('All fields are required.')
            return redirect(url_for('views.register'))
        
        if User.query.filter_by(username=username).first():
            flash('Username already exists.')
            return redirect(url_for('views.register'))
        
        if User.query.filter_by(email=email).first():
            flash('Email already registered.')
            return redirect(url_for('views.register'))
        
        user = User(username=username, email=email, first_name=first_name, last_name=last_name, role_id=role_id)
        user.set_password(password)
        db.session.add(user)
        db.session.commit()
        flash('Congratulations, you are now a registered user!')
        return redirect(url_for('views.login'))
    return render_template('register.html', title='Register', roles=roles)

# User login route
@bp.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('views.index'))
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = User.query.filter_by(username=username).first()
        if user is None or not user.check_password(password):
            flash('Invalid username or password')
            return redirect(url_for('views.login'))
        login_user(user)
        return redirect(url_for('views.index'))
    return render_template('login.html', title='Sign In')

# User logout route
@bp.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('views.index'))

# User profile route
@bp.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        
        if not username or not email or not first_name or not last_name:
            flash('All fields are required.')
            return redirect(url_for('views.profile'))
        
        if User.query.filter_by(username=username).first() and username != current_user.username:
            flash('Username already exists.')
            return redirect(url_for('views.profile'))
        
        if User.query.filter_by(email=email).first() and email != current_user.email:
            flash('Email already registered.')
            return redirect(url_for('views.profile'))
        
        current_user.username = username
        current_user.email = email
        current_user.first_name = first_name
        current_user.last_name = last_name
        db.session.commit()
        flash('Your profile has been updated.')
        return redirect(url_for('views.profile'))
    return render_template('profile.html', title='Profile')

# Example route restricted to faculty members
@bp.route('/faculty-only')
@login_required
@role_required('faculty')
def faculty_only():
    return render_template('faculty_only.html', title='Faculty Only')

# List users route (admin only)
@bp.route('/admin/users')
@login_required
@role_required('admin')
def list_users():
    users = User.query.all()
    return render_template('list_users.html', title='User List', users=users)

# Edit user route (admin only)
@bp.route('/admin/users/<int:user_id>/edit', methods=['GET', 'POST'])
@login_required
@role_required('admin')
def edit_user(user_id):
    user = User.query.get_or_404(user_id)
    roles = Role.query.all()
    if request.method == 'POST':
        user.username = request.form['username']
        user.email = request.form['email']
        user.first_name = request.form['first_name']
        user.last_name = request.form['last_name']
        user.role_id = request.form['role_id']
        db.session.commit()
        flash('User profile has been updated.')
        return redirect(url_for('views.list_users'))
    return render_template('edit_user.html', title='Edit User', user=user, roles=roles)
