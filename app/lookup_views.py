# app/lookup_views.py

from flask import Blueprint, render_template, flash, redirect, url_for, request
from app import db
from app.models import Role, RoleGroup, RoleGroupMembership
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

# Edit role
@bp.route('/roles/edit/<int:role_id>', methods=['GET', 'POST'])
@login_required
def edit_role(role_id):
    role = Role.query.get_or_404(role_id)
    if request.method == 'POST':
        role.name = request.form['name']
        db.session.commit()
        flash('Role updated successfully.')
        return redirect(url_for('lookup.list_roles'))
    return render_template('edit_role.html', role=role)

# Delete role
@bp.route('/roles/delete/<int:role_id>', methods=['POST'])
@login_required
def delete_role(role_id):
    role = Role.query.get_or_404(role_id)
    db.session.delete(role)
    db.session.commit()
    flash('Role deleted successfully.')
    return redirect(url_for('lookup.list_roles'))

# Manage role group associations
@bp.route('/roles/manage-groups/<int:role_id>', methods=['GET', 'POST'])
@login_required
def manage_role_groups(role_id):
    role = Role.query.get_or_404(role_id)
    groups = RoleGroup.query.all()
    if request.method == 'POST':
        selected_groups = request.form.getlist('groups')
        # Clear existing group memberships
        RoleGroupMembership.query.filter_by(role_id=role.id).delete()
        # Add new group memberships
        for group_id in selected_groups:
            membership = RoleGroupMembership(role_id=role.id, group_id=group_id)
            db.session.add(membership)
        db.session.commit()
        flash('Role group associations updated successfully.')
        return redirect(url_for('lookup.list_roles'))
    return render_template('manage_role_groups.html', role=role, groups=groups)
