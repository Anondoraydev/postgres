-- সক্রিয় ডেটাবেস: ph

-- সব কর্মচারীর তথ্য দেখাও
SELECT * from employees;

-- একটি ভিউ তৈরি করা হচ্ছে যার মাধ্যমে প্রতিটি বিভাগ অনুযায়ী গড় বেতন দেখা যাবে
CREATE View dept_avg_salary AS
SELECT department_name, avg(salary)
FROM employees
GROUP BY
    department_name;

-- dept_avg_salary ভিউ থেকে সব তথ্য দেখাও
SELECT * from dept_avg_salary;

-- আরেকটি ভিউ তৈরি করা হচ্ছে যেখানে এমন বিভাগগুলোর কর্মচারীদের তথ্য থাকবে
-- যেসব বিভাগের নামের মধ্যে 'R' অক্ষর রয়েছে
CREATE View test_view AS
SELECT
    employee_name,
    salary,
    department_name
FROM employees
WHERE
    department_name in (
        SELECT department_name
        FROM employees
        WHERE
            department_name LIKE '%R%'
    );

-- test_view ভিউ থেকে সব তথ্য দেখাও
SELECT * from test_view;

-- জটিল প্রশ্ন সহজ করা যায়
-- নিরাপত্তা উন্নত করা যায়
-- ডেটা বিমূর্ততা (data abstraction) বৃদ্ধি পায়