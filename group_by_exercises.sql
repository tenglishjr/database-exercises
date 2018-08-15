select distinct title from titles;

select first_name, last_name from employees
where last_name like 'e%e'
group by first_name, last_name;

select last_name, count(*) from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;

select count(*), gender from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by gender
order by count(*) desc;