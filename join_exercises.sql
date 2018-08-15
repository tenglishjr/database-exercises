-- ========= First Part (use join_test_db)
CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

insert into users (name, email, role_id) values
('tj', 'tj@example.com', 2),
('tyler', 'tyler@example.com', 2),
('taliah', 'taliah@example.com', null),
('kirsten', 'kirsten@example.com', 2);

show tables;

-- inner join (guess = 7)
select users.name as name, roles.name as role
from users
join roles
  on roles.id = users.role_id;

-- left join (guess = 10)
select users.name as name, roles.name as role
from users
left join roles
  on roles.id = users.role_id;

-- right join (guess = 8)
select users.name as name, roles.name as role
from users
right join roles
  on roles.id = users.role_id;

-- list of roles with number of users per role
select roles.name as role, count(users.role_id)
from users
right join roles
  on roles.id = users.role_id
group by roles.name;


-- ============ Part Two (use employees)

-- 2. Write a query that shows each department along with the name of the current manager for that department.
select d.dept_name as Department, concat(e.first_name, ' ', e.last_name) as 'Manager Name'
from departments as d
join dept_manager as dm
  on dm.dept_no = d.dept_no
join employees as e
  on e.emp_no = dm.emp_no
where dm.to_date = '9999-01-01'
order by d.dept_name;

-- 3. Find the name of all departments currently managed by women.
select d.dept_name as Department, concat(e.first_name, ' ', e.last_name) as 'Manager Name'
from departments as d
join dept_manager as dm
  on dm.dept_no = d.dept_no
join employees as e
  on e.emp_no = dm.emp_no
where dm.to_date = '9999-01-01'
AND e.gender = 'F'
order by d.dept_name;

-- 4. Find the current titles of employees currently working in the Customer Service department.
-- select 'Current employees & titles' as 'Customer Service';

select t.title as Title, count(*)
from titles as t
join employees as e
  on e.emp_no = t.emp_no
join dept_emp as de
  on de.emp_no = e.emp_no
join departments as d
  on d.dept_no = de.dept_no
where d.dept_name = 'Customer Service'
AND t.to_date = '9999-01-01'
group by t.title;

-- 5. Find the current salary of all current managers.
select d.dept_name as 'Department Name', concat(e.first_name, ' ', e.last_name) as Name, s.salary as 'Current Salary'
from departments as d
join dept_manager as dm
  on dm.dept_no = d.dept_no
join employees as e
  on e.emp_no = dm.emp_no
join salaries as s
  on s.emp_no = e.emp_no
where s.to_date = '9999-01-01'
AND dm.to_date = '9999-01-01'
order by d.dept_name;

-- BONUS: Find the names of all current employees, their department name, and their current manager's name.
select concat(e_emp.first_name, ' ', e_emp.last_name) as 'Employee Name',
  d.dept_name as 'Department Name',
  concat(e_man.first_name, ' ', e_man.last_name) as 'Manager Name'
from employees as e_emp
join dept_emp as de
  on de.emp_no = e_emp.emp_no
join departments as d
  on d.dept_no = de.dept_no
join dept_manager as dm
  on dm.dept_no = d.dept_no
join employees as e_man
  on e_man.emp_no = dm.emp_no
where de.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-01'
order by d.dept_name;
