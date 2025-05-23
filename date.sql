-- সার্ভারের বর্তমান টাইমজোন দেখায়
SHOW timezone;

-- বর্তমান সময় এবং তারিখ দেখায় (টাইমজোন সহ)
SELECT now();

-- টাইমস্ট্যাম্প সংরক্ষণের জন্য একটি টেবিল তৈরি
CREATE TABLE timez (
    ts TIMESTAMP WITHOUT TIME ZONE, -- টাইমজোন ছাড়া টাইমস্ট্যাম্প
    tsz TIMESTAMP WITHOUT TIME ZONE -- টাইমজোন ছাড়া টাইমস্ট্যাম্প (আবার)
);

-- টাইমজোন ছাড়া দুটি টাইমস্ট্যাম্প ইনসার্ট করা
INSERT INTO
    timez
VALUES (
        '2024-01-12 10:45:00',
        '2024-01-12 10:45:00'
    );

-- timez টেবিল থেকে সব ডাটা দেখানো
SELECT * FROM timez;

-- শুধুমাত্র বর্তমান তারিখ দেখানো
SELECT CURRENT_DATE;

-- শুধুমাত্র তারিখ অংশ দেখানো (now() থেকে)
SELECT now()::date;

-- শুধুমাত্র সময় অংশ দেখানো (now() থেকে)
SELECT now()::time;

-- সময়কে 'yyyy/mm/dd' ফরম্যাটে দেখানো
SELECT to_char(now(), 'yyyy/mm/dd');

-- সময়কে 'dd/mm/yyyy' ফরম্যাটে দেখানো
SELECT to_char(now(), 'dd/mm/yyyy');

-- বর্তমান তারিখ থেকে ১ বছর ২ মাস আগের তারিখ দেখানো
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

-- দুটি তারিখের মধ্যকার পার্থক্য দেখানো (বর্তমান তারিখ এবং ২০০৩-০১-০২ এর মধ্যে)
SELECT age (CURRENT_DATE, '2003-01-02');

-- students টেবিলের প্রতিটি স্টুডেন্টের বয়স হিসাব করা
SELECT *, age (CURRENT_DATE, dob) FROM students;

-- নির্দিষ্ট তারিখ থেকে বছর বের করা
SELECT extract( YEAR FROM '2024-10-25'::date );

-- নির্দিষ্ট তারিখ থেকে দিন বের করা
SELECT extract( DAY FROM '2024-10-25'::date );

-- নির্দিষ্ট তারিখ থেকে মাস বের করা
SELECT extract( MONTH FROM '2024-10-25'::date );

-- সংখ্যাকে boolean এ কনভার্ট করা (১ → true)
SELECT 1::BOOLEAN;

-- 'n' কে boolean এ কনভার্ট করার চেষ্টা (PostgreSQL এ এটি false হিসেবে নেয়া হয়)
SELECT 'n'::BOOLEAN;