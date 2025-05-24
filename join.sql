CREATE Table "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);

CREATE Table post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user" (id)
);

INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('bikash'),
    ('das'),
    ('nodi');

INSERT INTO
    post (title, user_id)
VALUES ('Exploring Nature', 1),
    ('Tech Innovations', 2),
    ('Healthy Living Tips', 3),
    ('Travel Diaries', 4);

DROP Table post;

DROP Table "user";

SELECT * FROM "user";

SELECT * FROM post;

SELECT * FROM post JOIN "user" on post.user_id = "user".id;

SELECT title, username
FROM post
    JOIN "user" on post.user_id = "user".id;

SELECT "user".id FROM post JOIN "user" on post.user_id = "user".id;

SELECT post.id FROM post JOIN "user" on post.user_id = "user".id;

SELECT p.id FROM post p JOIN "user" u on p.user_id = "u".id;

SELECT p.id FROM post as p JOIN "user" as u on p.user_id = "u".id;