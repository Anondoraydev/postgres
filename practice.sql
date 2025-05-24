-- 🧾 কর্মচারী টেবিল তৈরি করা হচ্ছে
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, -- প্রাইমারি কি (স্বয়ংক্রিয় সংখ্যা)
    employee_name VARCHAR(50), -- কর্মচারীর নাম
    department_id INT REFERENCES departments (department_id), -- বিভাগের সাথে রেফারেন্স
    salary DECIMAL(10, 2), -- বেতন (দশমিক সহ)
    hire_date DATE -- নিয়োগের তারিখ
);

-- 🏢 বিভাগ (ডিপার্টমেন্ট) টেবিল তৈরি করা হচ্ছে
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY, -- প্রাইমারি কি
    department_name VARCHAR(50) -- বিভাগের নাম
);

-- বিভাগ টেবিল ডিলিট (মুছে ফেলা) করা হচ্ছে (যদি পূর্বে থাকে)
DROP TABLE departments;

-- ডিপার্টমেন্ট টেবিলে তথ্য যোগ করা হচ্ছে
INSERT INTO
    departments (department_name)
VALUES ('HR'),
    ('Marketing'),
    ('Finance'),
    ('IT'),
    ('Sales'),
    ('Engineering'),
    ('Customer Support'),
    ('Administration'),
    ('Research'),
    ('Quality Assurance');

-- কর্মচারী টেবিলে তথ্য যোগ করা হচ্ছে
INSERT INTO
    employees (
        employee_name,
        department_id,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        1,
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        2,
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        3,
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        4,
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        5,
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        6,
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        7,
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        8,
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        9,
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        10,
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        1,
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        2,
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        3,
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        4,
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        5,
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        6,
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        7,
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        8,
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        9,
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        10,
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        1,
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        2,
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        3,
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        4,
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        5,
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        6,
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        7,
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        8,
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        9,
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        10,
        70000.25,
        '2021-11-20'
    );

-- কর্মচারী ও বিভাগের সংযুক্ত তথ্য দেখা
SELECT *
FROM employees
    JOIN departments ON employees.department_id = departments.department_id;

-- department_id ব্যবহার করে সহজে join করা
SELECT * FROM employees JOIN departments USING (department_id);

-- প্রতি বিভাগের গড় বেতন বের করা
SELECT department_name, round(avg(salary)) as avg_salary
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name;

-- প্রতি বিভাগে মোট কর্মচারীর সংখ্যা বের করা
SELECT department_name, count(employee_id)
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name;

-- সর্বোচ্চ গড় বেতন আছে এমন বিভাগ নির্ধারণ করা
SELECT department_name, round(avg(salary)) as avg_salary
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- প্রতি বছরে কতজন কর্মচারী নিয়োগ পেয়েছে তা বের করা
SELECT extract(
        YEAR
        from hire_date
    ) as hire_year, count(*)
FROM employees
GROUP BY
    hire_year;

-- 🛒 অর্ডার টেবিল তৈরি করা হচ্ছে
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY, -- অর্ডার আইডি
    customer_id INT, -- কাস্টমার আইডি
    order_date DATE, -- অর্ডার তারিখ
    total_amount DECIMAL(10, 2) -- মোট অর্ডার পরিমাণ
);

-- অর্ডার টেবিলে তথ্য যোগ করা হচ্ছে
INSERT INTO
    orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (1, '2022-01-05', 100.50),
    (2, '2020-01-07', 200.75),
    (1, '2022-01-08', 150.25),
    (3, '2020-05-10', 300.00),
    (2, '2022-01-15', 180.50),
    (3, '2022-01-20', 220.25),
    (1, '2022-01-25', 90.00),
    (2, '2022-01-28', 120.75),
    (3, '2021-02-01', 250.50),
    (1, '2022-02-05', 180.25),
    (4, '2023-02-05', 190.25);

-- অর্ডার টেবিল ডিলিট করা হচ্ছে (যদি আগে থেকে থাকে)
DROP TABLE orders;

-- ২টির বেশি অর্ডার দিয়েছে এমন কাস্টমার ও তাদের মোট খরচ বের করা
SELECT customer_id, count(order_id), sum(total_amount) as total_spent
FROM orders
GROUP BY
    customer_id
HAVING
    count(order_id) > 2;

-- ২০২২ সালে প্রতি মাসে মোট কত অর্ডার হয়েছে তা বের করা
SELECT extract(
        month
        from order_date
    ) as month, sum(total_amount)
FROM orders
WHERE
    extract(
        year
        from order_date
    ) = 2022
GROUP BY
    month;