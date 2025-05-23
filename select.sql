-- শিক্ষার্থীদের তথ্য সংরক্ষণের জন্য students টেবিল তৈরি
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(6),
    country VARCHAR(50)
);

-- students টেবিলে একাধিক শিক্ষার্থীর ডাটা সংযোজন
INSERT INTO
    students (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES
    -- প্রতিটি শিক্ষার্থীর তথ্য নিচে সংযোজন করা হয়েছে
    (
        'Rahim',
        'Uddin',
        20,
        'A+',
        'Computer Science',
        'rahim@example.com',
        '2005-03-15',
        'A+',
        'Bangladesh'
    ),
    (
        'Karim',
        'Hasan',
        22,
        'B',
        'Mathematics',
        NULL,
        '2003-06-25',
        'B+',
        'Bangladesh'
    ),
    (
        'Sadia',
        'Khan',
        19,
        'A',
        'Biology',
        'sadia.k@example.com',
        '2006-01-10',
        'O+',
        'India'
    ),
    (
        'Tanvir',
        'Ahmed',
        21,
        'C',
        'History',
        'tanvir.a@example.com',
        '2004-08-30',
        'AB-',
        'Pakistan'
    ),
    (
        'Jannat',
        'Ara',
        18,
        'A+',
        'Physics',
        'jannat@example.com',
        '2007-11-19',
        'A-',
        'Nepal'
    ),
    (
        'Fahim',
        'Rahman',
        20,
        'B+',
        'Chemistry',
        NULL,
        '2005-05-21',
        'B+',
        'Bangladesh'
    ),
    (
        'Ayesha',
        'Sultana',
        23,
        'A',
        'English',
        'ayesha.s@example.com',
        '2002-02-02',
        'O-',
        'India'
    ),
    (
        'Imran',
        'Khan',
        22,
        'C',
        'Economics',
        NULL,
        '2003-12-12',
        'AB+',
        'Pakistan'
    );

-- সমস্ত শিক্ষার্থীর তথ্য দেখানো
SELECT * FROM students;

-- কেবল শিক্ষার্থীদের নাম দেখানো
SELECT first_name FROM students;

-- বয়স এবং ইমেইল দেখানো
SELECT age, email FROM students;

-- ইমেইলকে "Student Email" নামে দেখানো
SELECT email as "Student Email" FROM students;

-- ইমেইল ও বয়স একসাথে "Student Email" নামে দেখানো
SELECT email as "Student Email", age FROM students;

-- নাম অনুযায়ী অর্ডার করে দেখানো (A-Z)
SELECT * FROM students ORDER BY first_name ASC;

-- নাম অনুযায়ী উল্টো অর্ডার (Z-A)
SELECT * FROM students ORDER BY first_name DESC;

-- বয়স অনুযায়ী সাজানো (বড় থেকে ছোট)
SELECT * FROM students ORDER BY age DESC;

-- জন্মতারিখ অনুযায়ী সাজানো (নতুন থেকে পুরনো)
SELECT * FROM students ORDER BY dob DESC;

-- জন্মতারিখ অনুযায়ী সাজানো (পুরনো থেকে নতুন)
SELECT * FROM students ORDER BY dob ASC;

-- শিক্ষার্থীদের ইউনিক দেশগুলোর তালিকা
SELECT DISTINCT country FROM students;

-- শিক্ষার্থীদের ইউনিক রক্তের গ্রুপ
SELECT DISTINCT blood_group FROM students;

-- শুধুমাত্র ভারতীয় শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE country = 'India';

-- পদার্থবিদ্যায় 'A' গ্রেডপ্রাপ্ত শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE grade = 'A' AND course = 'Physics';

-- 'A+' রক্তের গ্রুপযুক্ত শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE blood_group = 'A+';

-- ভারত বা বাংলাদেশের এবং বয়স ২০ এমন শিক্ষার্থীদের তথ্য
SELECT *
FROM students
WHERE (
        country = 'India'
        OR country = 'Bangladesh'
    )
    AND age = 20;

-- ভারত বা বাংলাদেশের সব শিক্ষার্থীর তথ্য
SELECT *
FROM students
WHERE (
        country = 'India'
        OR country = 'Bangladesh'
    );

-- ২০ বছরের বেশি শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE age > 20;

-- ২০ বছরের কম শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE age < 20;

-- বয়স ২০ বছরের বেশি এবং কোর্স 'Biology'
SELECT * FROM students WHERE age > 20 AND course = 'Biology';

-- বয়স ২০ বা তার কম এবং কোর্স 'History'
SELECT * FROM students WHERE age <= 20 AND course = 'History';

-- যাদের বয়স ২০ নয় এমন শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE age != 20;

-- পাকিস্তান বাদে সব দেশের শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE country <> 'Pakistan';

-- বয়স ২০ বা তার বেশি এবং কোর্স 'History'
SELECT * FROM students WHERE age >= 20 AND course = 'History';

-- নাম বড় অক্ষরে এবং সম্পূর্ণ তথ্য দেখানো
SELECT upper(first_name) as first_name_in_uppercase, * FROM students;

-- নাম এবং উপনাম একত্র করে দেখানো
SELECT concat(first_name, ' ', last_name) FROM students;

-- নামের দৈর্ঘ্য বের করা
SELECT length(first_name) FROM students;

-- গড় বয়স নির্ণয়
SELECT avg(age) FROM students;

-- সর্বোচ্চ বয়স নির্ণয়
SELECT max(age) FROM students;

-- সর্বনিম্ন বয়স নির্ণয়
SELECT min(age) FROM students;

-- বয়সের মোট যোগফল
SELECT sum(age) FROM students;

-- মোট শিক্ষার্থীর সংখ্যা
SELECT count(*) FROM students;

-- প্রথম নামের সর্বোচ্চ দৈর্ঘ্য
SELECT max(length(first_name)) FROM students;

-- বাংলাদেশ ছাড়া বাকি দেশের শিক্ষার্থীরা
SELECT * FROM students WHERE NOT country = 'Bangladesh';

-- NULL ইকুয়াল NULL কি না পরীক্ষা
SELECT NULL = NULL;

-- যাদের ইমেইল নেই এমন শিক্ষার্থীদের তথ্য
SELECT * FROM students WHERE email IS NULL;

-- সব শিক্ষার্থীর তথ্য দেখানো
SELECT * FROM students;

-- NULL ইমেইল থাকলে 'email not provided' দেখানো
SELECT COALESCE(email, 'email not provided') FROM students;

-- ইমেইল সহ শিক্ষার্থীদের বয়স ও নাম দেখানো
SELECT
    COALESCE(email, 'email not provided') as "EMAIL",
    age,
    first_name,
    last_name
FROM students;

-- পাকিস্তান বা নেপালের শিক্ষার্থীরা
SELECT *
FROM students
WHERE
    country = 'Pakistan'
    OR country = 'Nepal';

-- পাকিস্তান বা ভারতের শিক্ষার্থীরা
SELECT * FROM students WHERE country IN ('Pakistan', 'India');

-- পাকিস্তান বা ভারত ছাড়া সব দেশের শিক্ষার্থীরা
SELECT * FROM students WHERE country NOT IN ('Pakistan', 'India');

-- ১৯ থেকে ২২ বছরের মধ্যে বয়সের শিক্ষার্থীরা
SELECT * FROM students WHERE age BETWEEN 19 AND 22;

-- জন্মতারিখ ২০০০-০১-০১ থেকে ২০০৫-০১-০১ এর মধ্যে এমন শিক্ষার্থীরা
SELECT *
FROM students
WHERE
    dob BETWEEN '2000-01-01' AND '2005-01-01'
ORDER BY dob;

-- নাম 'ir' দিয়ে শেষ হয় এমন শিক্ষার্থীরা
SELECT * FROM students WHERE first_name LIKE '%ir';

-- 'T' দিয়ে শুরু হওয়া নাম
SELECT * FROM students WHERE first_name LIKE 'T%';

-- দ্বিতীয় অক্ষরে 'a' আছে এমন নাম
SELECT * FROM students WHERE first_name LIKE '_a%';

-- প্রথম তিন অক্ষরের পর 'ir' থাকলে
SELECT * FROM students WHERE first_name LIKE '___ir';

-- মোট ৭ অক্ষরের মধ্যে 'ir' থাকলে
SELECT * FROM students WHERE first_name LIKE '___ir__';

-- ছোট হাত/বড় হাত অগ্রাহ্য করে 't' দিয়ে শুরু হওয়া নাম
SELECT * FROM students WHERE first_name ILIKE 't%';

-- প্রথম ৫ জন শিক্ষার্থীর তথ্য
SELECT * FROM students LIMIT 5;

-- দ্বিতীয় পৃষ্ঠার ৫টি রেকর্ড (offset 2)
SELECT * FROM students LIMIT 5 OFFSET 2;

-- পাকিস্তান বা ভারতের প্রথম ৫ জন শিক্ষার্থী
SELECT *
FROM students
WHERE
    country IN ('Pakistan', 'India')
LIMIT 5;

-- পেজিনেশন: পৃষ্ঠা ১
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;

-- পেজিনেশন: পৃষ্ঠা ২
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;

-- পেজিনেশন: পৃষ্ঠা ৩
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;

-- গ্রেড 'B' এর শিক্ষার্থীদের ডিলিট
DELETE FROM students WHERE grade = 'B';

-- গ্রেড 'C' এবং বাংলাদেশি শিক্ষার্থীদের ডিলিট
DELETE FROM students WHERE grade = 'C' AND country = 'Bangladesh';

-- নির্দিষ্ট শিক্ষার্থীর ইমেইল আপডেট
UPDATE students
SET
    email = 'default@gmail.com'
WHERE
    student_id = 45;

-- নির্দিষ্ট শিক্ষার্থীর ইমেইল ও বয়স আপডেট
UPDATE students
SET
    email = 'default@gmail.com',
    age = 30
WHERE
    student_id = 45;