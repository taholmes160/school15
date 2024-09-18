# app/forms.py

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, SelectField, IntegerField, TextAreaField
from wtforms.validators import DataRequired, Email, EqualTo, ValidationError, Optional
from app.models import User, Role, Grade, Language, State

class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    password2 = PasswordField(
        'Repeat Password', validators=[DataRequired(), EqualTo('password')])
    first_name = StringField('First Name', validators=[DataRequired()])
    last_name = StringField('Last Name', validators=[DataRequired()])
    role = SelectField('Role', choices=[('student', 'Student'), ('faculty', 'Faculty')], validators=[DataRequired()])
    submit = SubmitField('Register')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user is not None:
            raise ValidationError('Please use a different username.')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is not None:
            raise ValidationError('Please use a different email address.')

class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Sign In')

class ManualStudentEntryForm(FlaskForm):
    first_name = StringField('First Name', validators=[DataRequired()])
    last_name = StringField('Last Name', validators=[DataRequired()])
    role = SelectField('Role', coerce=int, validators=[DataRequired()])
    submit = SubmitField('Add Student')

    def __init__(self, *args, **kwargs):
        super(ManualStudentEntryForm, self).__init__(*args, **kwargs)
        self.role.choices = [(role.id, role.name) for role in Role.query.order_by('name')]

class StudentProfileForm(FlaskForm):
    age = IntegerField('Age', validators=[Optional()])
    grade = SelectField('Grade', coerce=int, validators=[Optional()])
    address1 = StringField('Address 1', validators=[Optional()])
    address2 = StringField('Address 2', validators=[Optional()])
    city = StringField('City', validators=[Optional()])
    state = SelectField('State', coerce=int, validators=[Optional()])
    zip = StringField('Zip', validators=[Optional()])
    primary_language = SelectField('Primary Language', coerce=int, validators=[Optional()])
    submit = SubmitField('Save')

    def __init__(self, *args, **kwargs):
        super(StudentProfileForm, self).__init__(*args, **kwargs)
        self.grade.choices = [(grade.id, grade.name) for grade in Grade.query.order_by('name')]
        self.primary_language.choices = [(language.id, language.name) for language in Language.query.order_by('name')]
        self.state.choices = [(state.id, state.name) for state in State.query.order_by('name')]

class NoteForm(FlaskForm):
    note = TextAreaField('Note', validators=[DataRequired()])
    submit = SubmitField('Add Note')
