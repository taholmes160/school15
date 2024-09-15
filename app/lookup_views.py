# app/lookup_views.py

from flask import Blueprint, render_template, flash, redirect, url_for, request
from app import db
from app.models import Role
from flask_login import login_required

bp = Blueprint('lookup', __name__)

# List roles
@bp.route('/roles')
@login_required
def list_roles():
    roles = Role.query.all()
    return render_template('list_roles.html', roles=roles)

# Add role
@bp.route('/roles/add', methods=['GET', 'POST'])
@login_required
def add_role():
    if request.method == 'POST':
        role_name = request.form['name']
        if Role.query.filter_by(name=role_name).first():
            flash('Role already exists.')
            return redirect(url_for('lookup.add_role'))
        role = Role(name=role_name)
        db.session.add(role)
        db.session.commit()
        flash('Role added successfully.')
        return redirect(url_for('lookup.list_roles'))
    return render_template('add_role.html')

# Delete role
@bp.route('/roles/delete/<int:role_id>', methods=['POST'])
@login_required
def delete_role(role_id):
    role = Role.query.get_or_404(role_id)
    db.session.delete(role)
    db.session.commit()
    flash('Role deleted successfully.')
    return redirect(url_for('lookup.list_roles'))
