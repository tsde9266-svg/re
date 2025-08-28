# Create main files
New-Item -Path "app.py" -ItemType File -Force
New-Item -Path "database.py" -ItemType File -Force
New-Item -Path "schema.sql" -ItemType File -Force
New-Item -Path "requirements.txt" -ItemType File -Force
New-Item -Path "README.md" -ItemType File -Force

# Create static and templates folders
New-Item -ItemType Directory -Path "static"
New-Item -ItemType Directory -Path "templates"

# Create CSS and HTML files
New-Item -Path "static/style.css" -ItemType File -Force
New-Item -Path "templates/index.html" -ItemType File -Force
New-Item -Path "templates/login.html" -ItemType File -Force
New-Item -Path "templates/upload.html" -ItemType File -Force
New-Item -Path "templates/watch.html" -ItemType File -Force

# Write boilerplate content to files
Set-Content app.py @"
from flask import Flask, render_template, request, redirect
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
"@

Set-Content database.py @"
import sqlite3

def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn
"@

Set-Content schema.sql @"
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL
);

CREATE TABLE videos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    file_url TEXT NOT NULL,
    creator_id INTEGER,
    FOREIGN KEY (creator_id) REFERENCES users(id)
);
"@

Set-Content requirements.txt @"
flask
"@

Set-Content static/style.css @"
body {
    font-family: Arial, sans-serif;
    margin: 20px;
}
"@

Set-Content templates/index.html "<h1>Welcome to the Video Platform</h1>"
Set-Content templates/login.html "<h1>Login Page</h1>"
Set-Content templates/upload.html "<h1>Upload Video</h1>"
Set-Content templates/watch.html "<h1>Watch Video</h1>"

Set-Content README.md @"
# Video Platform

## Setup

1. Create a virtual environment:
   \`\`\`
   python -m venv venv
   .\venv\Scripts\Activate
   pip install -r requirements.txt
   \`\`\`

2. Initialize the database:
   \`\`\`
   python
   >>> import sqlite3
   >>> conn = sqlite3.connect('database.db')
   >>> with open('schema.sql') as f: conn.executescript(f.read())
   >>> conn.close()
   \`\`\`

3. Run the server:
   \`\`\`
   python app.py
   \`\`\`
"@

Write-Host "✅ Project scaffold created successfully."
