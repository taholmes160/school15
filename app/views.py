# app/views.py

from flask import Blueprint, render_template, flash, redirect, url_for, request, abort
from app import db
from app.models import User
from flask_login import login_user, logout_user, current_user, login_required
from app.decorators import role_required

bp = Blueprint('views', __name__)

# Home page route
@bp.route('/')
@bp.route('/index')
@login_required
def index():
    """
    Home page route. Requires user to be logged in.
    """
    return render_template('index.html', title='Home')

# User registration route
@bp.route('/register', methods=['GET', 'POST'])
def register():
    """
    User registration route. Allows new users to register.
    """
    if current_user.is_authenticated:
        return redirect(url_for('views.index'))
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        role = request.form['role']
        
        # Basic validation
        if not username or not email or not password or not first_name or not last_name or not role:
            flash('All fields are required.')
            return redirect(url_for('views.register'))
        
        if User.query.filter_by(username=username).first():
            flash('Username already exists.')
            return redirect(url_for('views.register'))
        
        if User.query.filter_by(email=email).first():
            flash('Email already registered.')
            return redirect(url_for('views.register'))
        
        user = User(username=username, email=email, first_name=first_name, last_name=last_name, role=role)
        user.set_password(password)
        db.session.add(user)
        db.session.commit()
        flash('Congratulations, you are now a registered user!')
        return redirect(url_for('views.login'))
    return render_template('register.html', title='Register')

# User login route
@bp.route('/login', methods=['GET', 'POST'])
def login():
    """
    User login route. Allows existing users to log in.
    """
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
    """
    User logout route. Logs out the current user.
    """
    logout_user()
    return redirect(url_for('views.index'))

# User profile route
@bp.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    """
    User profile route. Allows users to view and update their profile.
    """
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        
        # Basic validation
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
    """
    Route accessible only to faculty members.
    """
    return render_template('faculty_only.html', title='Faculty Only')
