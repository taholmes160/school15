import pandas as pd
import sqlalchemy
from werkzeug.security import generate_password_hash
from app import db, create_app
from app.models import User

# Example connection strings
source_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school10?charset=utf8mb4&collation=utf8mb4_general_ci'
target_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school15?charset=utf8mb4&collation=utf8mb4_general_ci'

# Create a connection to the source database
source_engine = sqlalchemy.create_engine(source_db_connection_string)

# Query to extract student data
query = "SELECT * FROM users"

# Load data into a DataFrame
students_df = pd.read_sql(query, source_engine)

# Add a default password and hash it
default_password = 'school1234'
students_df['password_hash'] = students_df.apply(lambda row: generate_password_hash(default_password), axis=1)

# Ensure the data matches the schema
students_df['role'] = 'student'

# Create a connection to the target database
target_engine = sqlalchemy.create_engine(target_db_connection_string)

# Initialize the Flask app context
app = create_app()
app.app_context().push()

# Function to import students
def import_students(students_df):
    for index, row in students_df.iterrows():
        user = User(
            username=row['username'],
            email=row['email'],
            password_hash=row['password_hash'],
            first_name=row['first_name'],
            last_name=row['last_name'],
            role=row['role']
        )
        db.session.add(user)
    db.session.commit()

# Import the students
import_students(students_df)
