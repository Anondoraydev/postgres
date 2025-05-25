-- টেবিল তৈরি করা হচ্ছে যেখানে কর্মচারীদের তথ্য রাখা হবে
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, -- প্রাইমারি কী যা অটো ইনক্রিমেন্ট হবে
    employee_name VARCHAR(50) NOT NULL, -- কর্মচারীর নাম
    department_name VARCHAR(50), -- ডিপার্টমেন্টের নাম
    salary DECIMAL(10, 2), -- বেতন (দশমিক সহ)
    hire_date DATE -- চাকরিতে যোগদানের তারিখ
);

-- কর্মচারীদের তথ্য ইনসার্ট করা হচ্ছে টেবিলে
INSERT INTO
    employees (
        employee_name,
        department_name,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        'HR',
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        'Marketing',
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        'Finance',
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        'IT',
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        'Sales',
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        'Engineering',
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        'Customer Support',
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        'Administration',
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        'Research',
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        'Quality Assurance',
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        'HR',
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        'Marketing',
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        'Finance',
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        'IT',
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        'Sales',
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        'Engineering',
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        'Customer Support',
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        'Administration',
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        'Research',
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        'Quality Assurance',
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        'HR',
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        'Marketing',
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        'Finance',
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        'IT',
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        'Sales',
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        'Engineering',
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        'Customer Support',
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        'Administration',
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        'Research',
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        'Quality Assurance',
        70000.25,
        '2021-11-20'
    );

-- সব কর্মচারীর তথ্য দেখানোর জন্য
SELECT * from employees;

-- টেবিল ডিলিট করার জন্য (সতর্কতা অবলম্বন করে ব্যবহার করতে হয়)
DROP Table employees;

-- HR বিভাগের সর্বোচ্চ বেতনের চেয়ে বেশি বেতন যাদের, তাদের তথ্য বের করা হচ্ছে
SELECT salary from employees WHERE department_name = 'HR';
-- HR এর সর্বোচ্চ বেতন: 63000

-- নিচের কোয়েরি HR বিভাগের সর্বোচ্চ বেতনের বেশি যাদের বেতন আছে তাদের দেখায়
SELECT *
FROM employees
WHERE
    salary > (
        SELECT max(salary)
        FROM employees
        WHERE
            department_name = 'HR'
    );

-- এই সাবকোয়েরি একটি মান (ভ্যালু) ফিরিয়ে দেয়
-- সাবকোয়েরি একাধিক রো বা কলামও ফিরিয়ে দিতে পারে

-- যেসব ডিপার্টমেন্টের নামের মধ্যে 'R' আছে, সেই সব ডিপার্টমেন্টের কর্মচারীদের নাম, বেতন এবং ডিপার্টমেন্ট দেখানো হচ্ছে
SELECT
    employee_name,
    salary,
    department_name
FROM employees
WHERE
    department_name IN (
        SELECT department_name
        FROM employees
        WHERE
            department_name LIKE '%R%'
    );