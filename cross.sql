-- employees টেবিল তৈরি করা হচ্ছে
CREATE TABLE employees (
    emp_id INT, -- কর্মচারীর আইডি
    emp_name VARCHAR(50), -- কর্মচারীর নাম
    dept_id INT -- ডিপার্টমেন্ট আইডি (বিদ্যমান ডিপার্টমেন্টের রেফারেন্স)
);

-- departments টেবিল তৈরি করা হচ্ছে
CREATE TABLE departments (
    dept_id INT, -- ডিপার্টমেন্ট আইডি
    dept_name VARCHAR(50) -- ডিপার্টমেন্টের নাম
);

-- employees টেবিলে ডেটা ইনসার্ট করা হচ্ছে
INSERT INTO employees VALUES (1, 'John Doe', 101);
-- John Doe, HR ডিপার্টমেন্ট

INSERT INTO employees VALUES (2, 'Jone Smith', 102);
-- Jone Smith, IT ডিপার্টমেন্ট

-- departments টেবিলে ডেটা ইনসার্ট করা হচ্ছে
INSERT INTO departments VALUES (101, 'HR');
-- HR ডিপার্টমেন্ট

INSERT INTO departments VALUES (102, 'IT');
-- IT ডিপার্টমেন্ট

-- employees টেবিলের সকল ডেটা দেখানো হচ্ছে
SELECT * FROM employees;

-- departments টেবিলের সকল ডেটা দেখানো হচ্ছে
SELECT * FROM departments;

-- cross JOIN: প্রতিটি কর্মচারীর জন্য প্রতিটি ডিপার্টমেন্টের সাথে মিলিয়ে রেজাল্ট দেখানো হচ্ছে
SELECT * FROM employees CROSS JOIN departments;

-- NATURAL JOIN: দুই টেবিলের সাধারণ কলাম (dept_id) এর ভিত্তিতে স্বয়ংক্রিয়ভাবে JOIN করে রেজাল্ট দেখানো হচ্ছে
SELECT * FROM employees NATURAL JOIN departments;