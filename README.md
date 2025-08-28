# Video Platform

## Setup

1. Create a virtual environment:
   \\\
   python -m venv venv
   .\venv\Scripts\Activate
   pip install -r requirements.txt
   \\\

2. Initialize the database:
   \\\
   python
   >>> import sqlite3
   >>> conn = sqlite3.connect('database.db')
   >>> with open('schema.sql') as f: conn.executescript(f.read())
   >>> conn.close()
   \\\

3. Run the server:
   \\\
   python app.py
   \\\
