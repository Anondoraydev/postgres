-- ইউজার টেবিল তৈরি করা হচ্ছে
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY, -- প্রতিটি ইউজারের ইউনিক আইডি
    username VARCHAR(25) NOT NULL -- ইউজারনেম, ফাঁকা রাখা যাবে না
);

-- পোস্ট টেবিল তৈরি করা হচ্ছে, যেখানে প্রতিটি পোস্ট একটি ইউজার এর সাথে যুক্ত
CREATE TABLE post (
    id SERIAL PRIMARY KEY, -- প্রতিটি পোস্টের ইউনিক আইডি
    title TEXT NOT NULL, -- পোস্টের শিরোনাম
    user_id INTEGER REFERENCES "user" (id) -- ইউজার আইডি (foreign key)
);

-- ইউজার টেবিলে ডেটা ইনসার্ট করা হচ্ছে
INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('bikash'),
    ('das'),
    ('nodi');

-- পোস্ট টেবিলে ডেটা ইনসার্ট করা হচ্ছে
INSERT INTO
    post (title, user_id)
VALUES ('Exploring Nature', 1),
    ('Tech Innovations', 2),
    ('Healthy Living Tips', 3),
    ('Travel Diaries', 4);

-- নিচের দুটি কমান্ড টেবিল ডিলিট করার জন্য ব্যবহৃত হয়
-- ⚠️ এই কমান্ডগুলো চালালে সব ডেটা মুছে যাবে, সাবধানতার সাথে ব্যবহার করতে হবে

-- DROP TABLE post;
-- DROP TABLE "user";

-- ইউজার টেবিল থেকে সব রেকর্ড দেখা
SELECT * FROM "user";

-- পোস্ট টেবিল থেকে সব রেকর্ড দেখা
SELECT * FROM post;

-- পোস্ট এবং ইউজার টেবিল একত্রে দেখানো (INNER JOIN)
SELECT * FROM post JOIN "user" ON post.user_id = "user".id;

-- শুধুমাত্র টাইটেল এবং ইউজারনেম দেখানো
SELECT title, username
FROM post
    JOIN "user" ON post.user_id = "user".id;

-- ইউজারের আইডি দেখানো, যাদের পোস্ট আছে
SELECT "user".id FROM post JOIN "user" ON post.user_id = "user".id;

-- পোস্ট আইডি দেখানো, যেগুলো ইউজারের সাথে যুক্ত
SELECT post.id FROM post JOIN "user" ON post.user_id = "user".id;

-- টেবিলকে আলিয়াস দিয়ে JOIN করা হয়েছে (p = post, u = user)
SELECT p.id FROM post p JOIN "user" u ON p.user_id = u.id;

-- আবারও আলিয়াস সহ JOIN করা হয়েছে
SELECT p.id FROM post AS p JOIN "user" AS u ON p.user_id = u.id;

-- NULL ইউজার সহ একটি পোস্ট ইনসার্ট করা হচ্ছে (অর্থাৎ পোস্টটি কোনো ইউজারের সাথে যুক্ত নয়)
INSERT INTO
    post (id, title, user_id)
VALUES (5, 'this is test titel', NULL);

-- LEFT JOIN: সব পোস্ট এবং তাদের ইউজার, যদি না থাকে তাহলে NULL দেখাবে
SELECT * FROM post AS p LEFT JOIN "user" AS u ON p.user_id = u.id;

-- LEFT OUTER JOIN (LEFT JOIN এরই পূর্ণরূপ, কাজ একই)
SELECT *
FROM post AS p
    LEFT OUTER JOIN "user" AS u ON p.user_id = u.id;

-- RIGHT OUTER JOIN: সব ইউজার এবং তাদের পোস্ট, পোস্ট না থাকলে NULL দেখাবে
SELECT *
FROM post AS p
    RIGHT OUTER JOIN "user" AS u ON p.user_id = u.id;

-- RIGHT JOIN (উপরের RIGHT OUTER JOIN এর সংক্ষিপ্ত রূপ)
SELECT * FROM post AS p RIGHT JOIN "user" AS u ON p.user_id = u.id;

-- FULL JOIN: সব পোস্ট ও ইউজার, যেগুলোর মিল নেই সেগুলোকেও দেখাবে
SELECT * FROM post AS p FULL JOIN "user" AS u ON p.user_id = u.id;