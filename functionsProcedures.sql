-- সক্রিয় ডেটাবেস: ph

/*
@Procedural Approach (প্রসিডিউরাল পদ্ধতি):
1. ভাষার সমর্থন: PL/pgSQL, PL/Perl, PL/Python ইত্যাদি প্রসিডিউরাল ভাষা সমর্থন করে।
2. জটিল যুক্তি: লুপ, শর্ত (if-else), ও এক্সসেপশন হ্যান্ডলিং-এর মাধ্যমে জটিল যুক্তি প্রয়োগ করা যায়।
3. ভেরিয়েবল ব্যবহারের সুবিধা: ভেরিয়েবল ঘোষণা ও মান পরিবর্তনের সুবিধা রয়েছে।
4. সংরক্ষিত প্রসিডিউর/ফাংশন: Stored Procedure বা Function তৈরি করা যায়।

@Non-Procedural Approach (নন-প্রসিডিউরাল বা ঘোষণামূলক পদ্ধতি):
1. ঘোষণামূলক কুয়েরি: SQL ব্যবহার করে কেবল কোন ডেটা দরকার সেটি বলা হয়, কিভাবে তা আনতে হবে সেটা নয়।
2. সরলতা: সহজভাবে ডেটা কুয়েরি করা যায়।
3. SQL ফাংশন: এক বা একাধিক SQL স্টেটমেন্টকে ফাংশনের মাধ্যমে ব্যবহারের সুবিধা।
4. কর্মদক্ষতা: সাধারণ কাজের ক্ষেত্রে ডেটাবেইস ইঞ্জিনের অপ্টিমাইজড কুয়েরি পরিকল্পনার কারণে ভালো পারফর্মেন্স দিতে পারে।
*/

-- কর্মচারীদের সকল তথ্য দেখাও
SELECT * from employees;

-- মোট কর্মচারীর সংখ্যা দেখাও
SELECT count(*) from employees;

-- একটি SQL ফাংশন তৈরি করা হয়েছে, যা নির্দিষ্ট কর্মচারী (ID: 30) ডিলিট করে
CREATE or replace Function emp_count()
RETURNS void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id = 30;
$$;

-- একই কাজের আরেকটি ফাংশন (উদাহরণ স্বরূপ)
CREATE or replace Function delete_emp()
RETURNS void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id = 30;
$$;

-- delete_emp ফাংশন কল করা হচ্ছে
SELECT delete_emp ();

-- একটি প্যারামিটারাইজড ফাংশন, যেটিতে যেকোনো কর্মচারীর ID দিয়ে ডিলিট করা যায়
CREATE or replace Function delete_emp_by_id(p_emp_id int)
RETURNS void
LANGUAGE SQL
as
$$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

-- ফাংশন কল করে ID 29 এর কর্মচারী ডিলিট করা হচ্ছে
SELECT delete_emp_by_id (29);

-- একটি প্রসিডিউর তৈরি করা হচ্ছে যেখানে ভেরিয়েবল ব্যবহার করে কর্মচারী ডিলিট করা হবে (ID: 26)
CREATE Procedure remove_emp_var()
LANGUAGE plpgsql
AS
$$
    DECLARE
    test_var int;
    BEGIN
        SELECT employee_id INTO test_var from employees WHERE employee_id = 26;
        DELETE FROM employees WHERE employee_id = test_var;
    END
$$;

-- remove_emp_var প্রসিডিউর কল করা হচ্ছে
call remove_emp_var ();

-- প্যারামিটার সহ একটি প্রসিডিউর তৈরি করা হয়েছে, যেটি কোনো কর্মচারীর ID নিয়ে তাকে ডিলিট করে
-- এবং সফলভাবে ডিলিট হলে একটি বার্তা দেখায়
CREATE Procedure remove_emp_by_id(p_emp_id int)
LANGUAGE plpgsql
AS
$$
    DECLARE
    test_var int;
    BEGIN
        SELECT employee_id INTO test_var from employees WHERE employee_id = p_emp_id;
        DELETE FROM employees WHERE employee_id = test_var;

        RAISE NOTICE 'Employee removed successfully!';
        
    END
$$;

-- remove_emp_by_id প্রসিডিউর কল করে ID 25 এর কর্মচারী ডিলিট করা হচ্ছে
CALL remove_emp_by_id (25);