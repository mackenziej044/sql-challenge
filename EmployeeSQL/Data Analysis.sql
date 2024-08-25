-- Data Analysis 

-- 1. list the employee number, last name, first name sex and salary for each employee 
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no
group by employees.emp_no, salaries.salary

-- 2. list the first name, last name, and hire date for the employees who were hired in 1986 
SELECT first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date < '1987-01-01'

-- 3. list the manager of each department along with their department number, department name, employee number, last name and first name 
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept__manager as dm 
inner join departments as d on dm.dept_no = d.dept_no
inner join employees as e on dm.emp_no = e.emp_no

-- 4. list the department number for each employee along with that employee’s employee number, last name, first name, and department name
select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de 
inner join departments as d on de.dept_no = d.dept_no
inner join employees as e on de.emp_no = e.emp_no
order by de.dept_no

-- 5. list the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- 6. list each employee in the Sales department, including their employee number, last name, and first name.
select emp_no, last_name, first_name
from employees
where emp_no IN
(
	select emp_no
	from dept_emp
	where dept_no IN
	(
		select dept_no
		from departments
		where dept_name = 'Sales'
	)
)

-- 7. list each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
inner join employees as e on de.emp_no = e.emp_no
inner join departments as d on de.dept_no = d.dept_no
where d.dept_name in ('Sales','Development')

-- 8. list the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select count(last_name) as "Count",last_name
from employees
group by last_name
order by "Count" desc