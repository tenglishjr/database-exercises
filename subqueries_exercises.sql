use employees;

-- 1. Find all the employees with the same hire date as employee `101010` using a sub-query.
select e.emp_no as 'Emp Number', concat(e.first_name, ' ', e.last_name) as Name, e.hire_date as 'Hire Date'
from employees as e
where e.hire_date = (
  select hire_date
  from employees
  where emp_no = '101010'
);

-- 2. Find all the titles held by all employees with the first name Aamod.
select distinct title as Title
from titles
where emp_no in (
    select emp_no from employees
    where first_name = 'Aamod'
);

-- 3. Find all the current department managers that are female.
select concat(first_name, ' ', last_name) as Name
from employees
where emp_no in (
    select emp_no
    from dept_manager
    where to_date = '9999-01-01'
    AND emp_no in (
        select emp_no
        from employees
        where gender = 'F'
    )
);