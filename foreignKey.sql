-- Create user table
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- Create post table with foreign key reference
CREATE TABLE post (
    id SERIAL PRIMARY KEY,-- Step 1: Drop existing tables if they exist
DROP TABLE IF EXISTS post;

DROP TABLE IF EXISTS "user";

-- Step 2: Create user table
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- Step 3: Create post table with foreign key reference
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES "user" (id)
);

-- Step 4: Insert data into user table
INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('natash'),
    ('sagor'),
    ('nodi');

-- Step 5: Check user IDs
SELECT * FROM "user";

-- Step 6: Insert data into post table using correct user IDs
INSERT INTO
    post (title, user_id)
VALUES ('Nature Beauty', 2),
    ('My First Post', 1),
    ('Healthy Living', 4),
    ('Tech Trends 2025', 3);

-- Step 7: Check posts
SELECT * FROM post;

-- Step 8: Additional insert (will work because user_id = 1 exists)
INSERT INTO post (title, user_id) VALUES ('Test', 1);

title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user" (id) NOT NULL
);

ALTER TABLE post alter COLUMN user_id set NOT NULL;

INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('natash'),
    ('sagor'),
    ('nodi');

-- Insert data into post table
INSERT INTO
    post (title, user_id)
VALUES ('Nature Beauty', 2),
    ('My First Post', 1),
    ('Healthy Living', 4),
    ('Tech Trends 2025', 3);

-- View data
SELECT * FROM "user";

SELECT * FROM post;

INSERT INTO post (title, user_id) VALUES ('test', 1);