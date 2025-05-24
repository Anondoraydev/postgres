-- ধাপ ১: আগের post এবং user টেবিল যদি আগে থেকে থাকে, তাহলে সেগুলো ডিলিট করো
DROP TABLE IF EXISTS post;

DROP TABLE IF EXISTS "user";

-- ধাপ ২: user টেবিল তৈরি করো
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY, -- প্রতিটি ইউজারের জন্য ইউনিক আইডি, অটো ইনক্রিমেন্ট হবে
    username VARCHAR(25) NOT NULL -- ইউজারনেম অবশ্যই দিতে হবে (NOT NULL)
);

-- ধাপ ৩: post টেবিল তৈরি করো
-- এখানে user_id কলামে DEFAULT 2 সেট করা হয়েছে
-- কেউ যদি user_id ছাড়া ইনসার্ট করে বা ইউজার ডিলিট হয়, তাহলে user_id = 2 হয়ে যাবে
CREATE TABLE post (
    id SERIAL PRIMARY KEY, -- পোস্টের ইউনিক আইডি
    title TEXT NOT NULL, -- পোস্টের টাইটেল (খালি রাখা যাবে না)
    user_id INTEGER DEFAULT 2 REFERENCES "user" (id) ON DELETE SET DEFAULT
    -- যদি রেফারেন্সকৃত ইউজার ডিলিট হয়, তাহলে user_id ফিল্ডটি ডিফল্ট মান 2 হয়ে যাবে
);

-- ধাপ ৪: user টেবিলে কিছু ইউজারের ডেটা ইনসার্ট করো
INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('natash'),
    ('sagor'),
    ('nodi');

-- ধাপ ৫: user টেবিল চেক করো
SELECT * FROM "user";

-- ধাপ ৬: post টেবিলে কিছু পোস্ট ইনসার্ট করো (user_id দিয়ে সম্পর্ক তৈরি করা হয়েছে)
INSERT INTO
    post (title, user_id)
VALUES ('Nature Beauty', 2),
    ('My First Post', 1),
    ('Healthy Living', 4),
    ('Tech Trends 2025', 3);

-- ধাপ ৭: post টেবিল চেক করো
SELECT * FROM post;

-- ধাপ ৮: আরও একটি পোস্ট ইনসার্ট করো
INSERT INTO post (title, user_id) VALUES ('Test', 1);

-- ধাপ ৯: user আইডি ৪ যিনি, তাকে ডিলিট করো
-- যেহেতু ON DELETE SET DEFAULT ব্যবহার করা হয়েছে,
-- তাই তার পোস্টগুলোর user_id এখন ২ হয়ে যাবে
DELETE FROM "user" WHERE id = 4;

-- ধাপ ১০: সব ডেটা আবার চেক করো
SELECT * FROM "user";

SELECT * FROM post;