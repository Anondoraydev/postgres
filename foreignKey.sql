-- Step 1: Drop existing tables if they exist
DROP TABLE IF EXISTS post;

DROP TABLE IF EXISTS "user";

-- Step 2: Create user table
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

-- Step 3: Create post table with foreign key reference (CASCADE delete)
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES "user" (id) ON DELETE set DEFAULT DEFAULT 2
);
;

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

-- Step 8: Additional insert
INSERT INTO post (title, user_id) VALUES ('Test', 1);

-- Step 9: Delete user with id = 4 (should delete their posts too)
DELETE FROM "user" WHERE id = 4;

-- Step 10: View data after delete
SELECT * FROM "user";

SELECT * FROM post;