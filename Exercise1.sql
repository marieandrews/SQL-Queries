--create database Employee;
create table department (
	dep_id int not null,
	dep_name varchar(20) not null,
	dep_location varchar(15) not null,
	);

drop table department;

create table department (
	dep_id int not null,
	dep_name varchar(20),
	dep_location varchar(15),
	constraint department_pk1 primary key (dep_id)
	);

alter table employees
add unique (emp_id);

alter table employees
add unique (emp_name);

alter table employees
add foreign key (dep_id) references department(dep_id);

alter table employees 
drop column manager_id;

alter table employees
add manager_id int;

alter table employees
drop column commission;

alter table employees 
add commission decimal(7,2);

insert into department (dep_id)
values (1001),
(3001),
(2001);

insert into employees (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id) 
values ('68319', 'KAYLING', 'PRESIDENT', null,'1991-11-18', '6000.00', null, '1001'),
('66928', 'BLAZE', 'MANAGER', '68319', '1991-05-01', '2750.00', null, '3001'),
('67832', 'CLARE', 'MANAGER', '68319', '1991-06-09', '2550.00', null, '1001'),
('65646', 'JONAS', 'MANAGER', '68319', '1991-04-02', '2957.00', null, '1001'),
('67858', 'SCARLET', 'ANALYST', '65646', '1997-04-19', '3100.00', null, '2001'),
('69062', 'FRANK', 'ANALYST', '65646', '1991-12-03', '3100.00', NULL, '2001'),
('63679', 'SANDRINE', 'CLERK', '69062', '1990-12-18', '900.00', NULL, '2001'),
('64989', 'ADELYN', 'SALESMAN', '66928', '1991-02-20', '1700.00', '400.00', '3001'),
('65271', 'WADE', 'SALESMAN', '66928', '1991-02-22', '1350.00', '600.00', '3001'),
('66564', 'MADDEN', 'SALESMAN', '66928', '1991-09-28', '1350.00', '1500.00', '3001'),
('68454', 'TUCKER', 'SALESMAN', '66928', '1991-09-08', '1600.00', '0.00', '3001'),
('68736', 'ADNRES', 'CLERK', '67858', '1997-05-23', '1200.00', NULL, '2001'),
('69000', 'JULIUS', 'CLERK', '66928', '1991-12-03', '1050.00', NULL, '3001'),
('69324', 'MARKER', 'CLERK', '67832', '1991-01-23', '1400.00', NULL, '1001');

select * from employees;

select salary
from employees;

select emp_name, salary
from employees;

select distinct job_name
from employees;

select emp_name, 
(salary*0.15+salary)
from employees;

-- alter table to add new columns
alter table employees
add address varchar(100),
city varchar(25),
pin_code int;

-- change column name: use stored procedure
-- 'table_name.current_column_name', 'new_column_name';
exec sp_rename 'employees.city', 'emp_city';

-- delete column from a table
alter table employees
drop column zip_code;

-- update column values
update employees
set emp_name = 'MARIE'
where emp_id = 64989;

select emp_name, emp_id
from employees;

-- delete data from table
delete from employees
where emp_id = 64989;

-- error: cannot put more than one value into one where: you can use "in" instead of "="
select * from employees
where dep_id = (select dep_id from department);

-- return everything from employees, where dep_id is equal to the second select result
select * from employees
where dep_id = (select dep_id from department where emp_name like '%CL');

select * from employees
where emp_id = (select emp_id from employees where emp_name like '%cl');

-- GROUP BY clause: group by the data you are trying to track, "count()" keeps count of number of instances in () titled "as ''"
select dep_id, count(emp_id) as 'Number of Employees'
from employees
group by dep_id;

select manager_id, count(emp_id) as 'Number of Employees'
from employees
group by manager_id;

select emp_name, count(emp_id) as 'Number of Employees'
from employees
group by emp_name;

select dep_id, sum(salary) as 'Total Salaries'
from employees
group by dep_id;

-- order by sorts the column
select salary, emp_name
from employees
where salary > 1000.00
group by salary, emp_name
order by salary;

-- "having" acts as an equivalent to "where" when using "group by" function
select count(emp_id) as 'Number of Employees', dep_id
from employees
group by dep_id
having count(dep_id) = 5;

-- inner join: retrieves matching records from two or more tables
select employees.emp_id, employees.emp_name, employees.dep_id, department.dep_id
from employees
inner join department
on employees.dep_id = department.dep_id;

--left join: type of inner join - returns all data from left table (before "left join") and the matching records from the right table (after "left join")
select emp.emp_id, emp.emp_name, dept.dep_id
from employees emp
left join department dept
on emp.dep_id = dept.dep_id;

select emp.emp_id, emp.emp_name, dept.dep_id
from department dept
left join employees emp
on emp.dep_id = dept.dep_id;

select emp.emp_name, emp.commission, dept.dep_id
from employees emp
left join department dept
on emp.dep_id = dept.dep_id;

select emp_name, commission, dep_id
from employees;

insert into department (dep_id, dep_name, dep_location)
values ('4001','HR', 'Santa Barbara');

update employees
set dep_id = 4001
where emp_name = 'SANDRINE';

select emp.emp_name, dept.dep_id, dept.dep_location
from employees emp
left join department dept
on emp.dep_id = dept.dep_id;

select emp_name
from employees
where job_name = 'MANAGER';

select dep_name, dep_location
from department;

select emp_name
from employees
where salary > 60000.00;

select dep_name, dep_location
from department
where dep_location != 'New York';

select emp.emp_name, emp.emp_id, dept.dep_name
from employees emp
left join department dept
on emp.dep_id = dept.dep_id
where dep_name = 'sales';

select emp_name 
from employees
where job_name = 'manager' or job_name = 'sales';

select emp.emp_name, emp.salary, dept.dep_name
from employees emp
left join department dept
on emp.dep_id = dept.dep_id
where dep_name != 'sales';

select emp_name, salary