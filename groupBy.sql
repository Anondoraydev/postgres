-- সমস্ত students টেবিল থেকে সব ডেটা দেখাও
SELECT * FROM students;

-- দেশভিত্তিক কতজন স্টুডেন্ট আছে তা দেখাও
SELECT country, count(*) FROM students GROUP BY country;

-- দেশভিত্তিক কতজন এবং গড় বয়স (avg age) দেখাও
SELECT country, count(*), avg(age) FROM students GROUP BY country;

-- দেশভিত্তিক স্টুডেন্ট সংখ্যা ও গড় বয়স দেখাও, যেখানে গড় বয়স ২০ বছরের বেশি
SELECT country, count(*), avg(age)
FROM students
GROUP BY
    country
HAVING
    avg(age) > 20;

-- জন্ম তারিখ (dob) থেকে জন্ম সাল বের করে, সেই সাল অনুযায়ী গ্রুপ করে কতজন জন্মেছে দেখাও
SELECT extract(
        YEAR
        FROM dob
    ) as birth_year, count(*)
FROM students
GROUP BY
    birth_year;