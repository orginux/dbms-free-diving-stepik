import psycopg2 as pg_driver
import random

# Establish a connection to the database
conn = pg_driver.connect(user="postgres", host="localhost")

# Create a cursor object to execute SQL queries
cur = conn.cursor()

# Create the University table
cur.execute('''
    CREATE TABLE IF NOT EXISTS University (
        university_id SERIAL PRIMARY KEY,
        university_name VARCHAR(255)
    )
''')

# Generate data and insert into the University table
universities = [("University A",), ("University B",), ("University C",), ("University D",), ("University E",)]

cur.executemany("INSERT INTO University (university_name) VALUES (%s)", universities)

# Create the Researcher table with a foreign key reference to University table
cur.execute('''
    CREATE TABLE IF NOT EXISTS Researcher (
        researcher_id SERIAL PRIMARY KEY,
        university_id INTEGER,
        FOREIGN KEY (university_id) REFERENCES University (university_id)
    )
''')

# Generate data and insert into the Researcher table with university_id from the University table
for i in range(99):
    university_id = random.randint(1, len(universities))  # Modify as per your requirements
    cur.execute("INSERT INTO Researcher (university_id) VALUES (%s)", (university_id,))

# Commit the changes
conn.commit()

# Count the number of rows in the Researcher table
cur.execute("SELECT COUNT(*) FROM Researcher")
row_count = cur.fetchone()[0]
print("Total rows in Researcher table:", row_count)

# Count the number of rows in the University table
cur.execute("SELECT COUNT(*) FROM University")
row_count = cur.fetchone()[0]
print("Total rows in University table:", row_count)

# Close the cursor and connection
cur.close()
conn.close()
