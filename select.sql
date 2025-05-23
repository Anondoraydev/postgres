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
VALUES (
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
        'Fatema',
        'Khatun',
        19,
        'A',
        'Physics',
        'fatema@example.com',
        '2006-01-10',
        'O+',
        'India'
    ),
    (
        'Jannat',
        'Ara',
        21,
        'B+',
        'Biology',
        'jannat@example.com',
        '2004-08-09',
        'AB+',
        'Bangladesh'
    ),
    (
        'Sohan',
        'Ali',
        20,
        'C',
        'Chemistry',
        'sohan@example.com',
        '2005-12-18',
        'B-',
        'Nepal'
    ),
    (
        'Mehedi',
        'Hasan',
        23,
        'A-',
        'Economics',
        NULL,
        '2002-04-07',
        'A-',
        'Bangladesh'
    ),
    (
        'Rina',
        'Begum',
        18,
        'B+',
        'Statistics',
        'rina@example.com',
        '2007-09-13',
        'O-',
        'Bangladesh'
    ),
    (
        'Nayeem',
        'Islam',
        20,
        'A',
        'English',
        'nayeem@example.com',
        '2005-02-19',
        'AB-',
        'Pakistan'
    ),
    (
        'Shila',
        'Akter',
        19,
        'C+',
        'Accounting',
        NULL,
        '2006-05-30',
        'A+',
        'India'
    ),
    (
        'Tariq',
        'Zaman',
        22,
        'B-',
        'Management',
        'tariq@example.com',
        '2003-11-25',
        'B+',
        'Bangladesh'
    ),
    (
        'Munira',
        'Sultana',
        20,
        'A+',
        'History',
        'munira@example.com',
        '2005-07-11',
        'O+',
        'Nepal'
    ),
    (
        'Fahim',
        'Khan',
        21,
        'B+',
        'Philosophy',
        'fahim@example.com',
        '2004-03-14',
        'A-',
        'Bangladesh'
    ),
    (
        'Laboni',
        'Nahar',
        18,
        'A',
        'Political Science',
        NULL,
        '2007-06-22',
        'B+',
        'Bangladesh'
    ),
    (
        'Rafi',
        'Hossain',
        20,
        'C',
        'Law',
        'rafi@example.com',
        '2005-01-08',
        'O+',
        'India'
    ),
    (
        'Sadia',
        'Rahman',
        19,
        'B',
        'Sociology',
        'sadia@example.com',
        '2006-10-03',
        'AB+',
        'Bangladesh'
    ),
    (
        'Tanvir',
        'Ahmed',
        22,
        'A-',
        'Psychology',
        'tanvir@example.com',
        '2003-04-29',
        'O-',
        'Bangladesh'
    ),
    (
        'Rupa',
        'Akter',
        21,
        'C+',
        'Marketing',
        'rupa@example.com',
        '2004-12-16',
        'B-',
        'Nepal'
    ),
    (
        'Rakib',
        'Islam',
        20,
        'B+',
        'Finance',
        'rakib@example.com',
        '2005-08-20',
        'A+',
        'Pakistan'
    ),
    (
        'Nusrat',
        'Jahan',
        19,
        'A',
        'Anthropology',
        'nusrat@example.com',
        '2006-07-07',
        'AB-',
        'Bangladesh'
    ),
    (
        'Babu',
        'Mia',
        23,
        'C',
        'Environmental Science',
        NULL,
        '2002-09-01',
        'O+',
        'Bangladesh'
    );

SELECT * FROM students;

SELECT first_name FROM students;

SELECT age, email FROM students;

SELECT email as "Student Email" FROM students;

SELECT email as "Student Email", age FROM students;

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY first_name DESC;

SELECT * FROM students ORDER BY age DESC;

SELECT * FROM students ORDER BY dob DESC;

SELECT * FROM students ORDER BY dob ASC;

SELECT DISTINCT country FROM students;

SELECT DISTINCT blood_group FROM students;

SELECT * FROM students WHERE country = 'India';

SELECT * FROM students WHERE grade = 'A' AND course = 'Physics';

SELECT * FROM students WHERE blood_group = 'A+';

SELECT *
FROM students
WHERE (
        country = 'India'
        OR country = 'Bangladesh'
    )
    AND age = 20;

SELECT *
FROM students
WHERE (
        country = 'India'
        OR country = 'Bangladesh'
    );

SELECT * FROM students WHERE age > 20;

SELECT * FROM students WHERE age < 20;

SELECT * FROM students WHERE age > 20 AND course = 'Biology';

SELECT * FROM students WHERE age <= 20 AND course = 'History';

SELECT * FROM students WHERE age != 20;

SELECT * FROM students WHERE country <> 'Pakistan';

SELECT * FROM students WHERE age >= 20 AND course = 'History';

SELECT upper(first_name) as first_name_in_uppercase, * FROM students;

SELECT concat(first_name, ' ', last_name) FROM students;

SELECT length(first_name) FROM students;

SELECT avg(age) FROM students;

SELECT max(age) FROM students;

SELECT min(age) FROM students;

SELECT sum(age) FROM students;

SELECT count(*) FROM students;

SELECT max(length(first_name)) FROM students;

SELECT * FROM students WHERE NOT country = 'Bangladesh'

SELECT NULL = NULL;

SELECT * FROM students WHERE email IS NULL;

SELECT * FROM students;

SELECT COALESCE(email, 'email not provided') FROM students;

SELECT
    COALESCE(email, 'email not provided') as "EMAIL",
    age,
    first_name,
    last_name
FROM students;

SELECT *
FROM students
WHERE
    country = 'Pakistan'
    OR country = 'Nepal';

SELECT * FROM students WHERE country IN ('Pakistan', 'India');

SELECT * FROM students WHERE country NOT IN ('Pakistan', 'India');

SELECT * FROM students WHERE age BETWEEN 19 AND 22;

SELECT *
FROM students
WHERE
    dob BETWEEN '200-01-01' AND '2005-01-01';

SELECT *
FROM students
WHERE
    dob BETWEEN '2000-01-01' AND '2005-01-01 '
ORDER BY dob;

SELECT * FROM students WHERE first_name LIKE '%ir';

SELECT * FROM students WHERE first_name LIKE 'T%';

SELECT * FROM students WHERE first_name LIKE '_a%';

SELECT * FROM students WHERE first_name LIKE '___ir';

SELECT * FROM students WHERE first_name LIKE '___ir__';

SELECT * FROM students WHERE first_name ILIKE 't%';