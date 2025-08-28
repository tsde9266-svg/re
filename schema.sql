-- CREATE TABLE IF NOT EXISTS users (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     username TEXT UNIQUE NOT NULL,
--     password TEXT NOT NULL,
--     role TEXT CHECK(role IN ('creator', 'consumer')) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS videos (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     title TEXT NOT NULL,
--     publisher TEXT NOT NULL,
--     producer TEXT,
--     genre TEXT,
--     age_rating TEXT,
--     url TEXT NOT NULL,
--     uploaded_by INTEGER,
--     FOREIGN KEY (uploaded_by) REFERENCES users(id)
-- );

-- CREATE TABLE IF NOT EXISTS comments (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     video_id INTEGER,
--     user_id INTEGER,
--     comment TEXT NOT NULL,
--     rating INTEGER CHECK(rating BETWEEN 1 AND 5),
--     FOREIGN KEY (video_id) REFERENCES videos(id),
--     FOREIGN KEY (user_id) REFERENCES users(id)
-- );


























-- CREATE TABLE IF NOT EXISTS users (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     username TEXT UNIQUE NOT NULL,
--     password TEXT NOT NULL,
--     role TEXT CHECK(role IN ('creator', 'consumer')) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS videos (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     title TEXT NOT NULL,
--     publisher TEXT NOT NULL,
--     producer TEXT,
--     genre TEXT,
--     age_rating TEXT,
--     url TEXT NOT NULL,
--     uploaded_by INTEGER,
--     FOREIGN KEY (uploaded_by) REFERENCES users(id)
-- );

-- CREATE TABLE IF NOT EXISTS comments (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     video_id INTEGER,
--     user_id INTEGER,
--     comment TEXT NOT NULL,
--     rating INTEGER CHECK(rating BETWEEN 1 AND 5),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (video_id) REFERENCES videos(id),
--     FOREIGN KEY (user_id) REFERENCES users(id)
-- );


-- CREATE TABLE IF NOT EXISTS likes (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     video_id INTEGER,
--     user_id INTEGER,
--     FOREIGN KEY (video_id) REFERENCES videos(id),
--     FOREIGN KEY (user_id) REFERENCES users(id),
--     UNIQUE(video_id, user_id)
-- );
-- ALTER TABLE comments ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
















CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT CHECK(role IN ('creator', 'consumer')) NOT NULL
);

CREATE TABLE IF NOT EXISTS videos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    publisher TEXT NOT NULL,
    producer TEXT,
    genre TEXT,
    age_rating TEXT,
    url TEXT NOT NULL,
    uploaded_by INTEGER,
    FOREIGN KEY (uploaded_by) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    video_id INTEGER,
    user_id INTEGER,
    comment TEXT NOT NULL,
    rating INTEGER CHECK(rating BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS likes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    video_id INTEGER,
    user_id INTEGER,
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    UNIQUE(video_id, user_id)
);