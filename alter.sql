-- টেবিল থেকে সব তথ্য দেখাও
SELECT * FROM person2;

-- নতুন একটি কলাম 'email' যোগ করো, যার ডেটা টাইপ VARCHAR(25), NULL হবে না, এবং ডিফল্ট ভ্যালু 'default@gmail.com'
ALTER TABLE person2
ADD COLUMN email VARCHAR(25) NOT NULL DEFAULT 'default@gmail.com';

-- 'email' নামের কলামটি টেবিল থেকে মুছে ফেলো
ALTER TABLE person2 DROP COLUMN email;

-- 'age' নামের কলামটির নাম পরিবর্তন করে 'user_age' করো
ALTER TABLE person2 RENAME COLUMN age TO user_age;

-- 'user_name' কলামের ডেটা টাইপ পরিবর্তন করে VARCHAR(50) করো
ALTER TABLE person2 ALTER COLUMN user_name TYPE VARCHAR(50);

-- 'user_age' কলামে NOT NULL কনস্ট্রেইন্ট অ্যাড করো (এই কলামে future-এ null ডেটা রাখা যাবে না)
ALTER TABLE person2 ALTER COLUMN user_age SET NOT NULL;

-- 'user_age' কলাম থেকে NOT NULL কনস্ট্রেইন্ট বাদ দাও (এখন null ডেটা রাখা যাবে)
ALTER TABLE person2 ALTER COLUMN user_age DROP NOT NULL;

-- person2 টেবিলে একটি নতুন রো (row) ইনসার্ট করো
INSERT INTO person2 VALUES ( 8, 'test', 45, 'test@gmail.com' );