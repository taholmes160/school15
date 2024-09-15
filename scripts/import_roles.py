import sys
import os
import warnings

# Suppress specific NumPy warnings
warnings.filterwarnings("ignore", message="Signature .* for <class 'numpy.longdouble'> does not match any known type")

# Add the project directory to the Python path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import pandas as pd
import sqlalchemy
from app import db, create_app
from app.models import Role

# Example connection strings
source_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school10?charset=utf8mb4&collation=utf8mb4_general_ci'
target_db_connection_string = 'mysql+mysqlconnector://server2:T3t0npack@192.168.1.28/school15?charset=utf8mb4&collation=utf8mb4_general_ci'

# Create a connection to the source database
source_engine = sqlalchemy.create_engine(source_db_connection_string)

# Query to extract role data
query = """
SELECT 
    id, 
    name
FROM roles
"""

# Load data into a DataFrame
roles_df = pd.read_sql(query, source_engine)

# Create a connection to the target database
target_engine = sqlalchemy.create_engine(target_db_connection_string)

# Initialize the Flask app context
app = create_app()
app.app_context().push()

# Function to import roles
def import_roles(roles_df):
    for index, row in roles_df.iterrows():
        # Check if the role already exists
        existing_role = Role.query.filter_by(name=row['name']).first()
        if existing_role is None:
            role = Role(
                id=row['id'],
                name=row['name']
            )
            db.session.add(role)
    db.session.commit()

# Import the roles
import_roles(roles_df)
