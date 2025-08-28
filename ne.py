import sqlite3

# Connect to database
conn = sqlite3.connect('videos.db')
cursor = conn.cursor()

# Create likes table if it doesn't exist
cursor.execute('''
    CREATE TABLE IF NOT EXISTS likes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        video_id INTEGER,
        user_id INTEGER,
        FOREIGN KEY (video_id) REFERENCES videos(id),
        FOREIGN KEY (user_id) REFERENCES users(id),
        UNIQUE(video_id, user_id)
    )
''')

# Add created_at column without default value
try:
    cursor.execute('ALTER TABLE comments ADD COLUMN created_at TIMESTAMP')
    # Update existing rows to have current timestamp
    cursor.execute("UPDATE comments SET created_at = datetime('now') WHERE created_at IS NULL")
except sqlite3.OperationalError as e:
    if "duplicate column name" not in str(e).lower():
        print(f"Error adding column: {e}")

# Insert into likes table
cursor.execute("INSERT INTO likes (user_id, video_id) VALUES (?, ?)", (1, 100))

# Select from likes table
cursor.execute("SELECT * FROM likes")
results = cursor.fetchall()
print(results)

conn.commit()
conn.close()