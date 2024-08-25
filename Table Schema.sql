-- create tables for data (departments, dept_emp, dept_manager, employees, salaries, titles)

-- departments table 
create table departments (
	dept_no varchar(10) primary key,
	dept_name varchar(30) not null
);

-- titles table 
CREATE TABLE titles (
	title_id varchar(10) PRIMARY key,
	title VARCHAR(30) NOT null
);

-- employees table 
CREATE TABLE employees (
	emp_no int PRIMARY KEY,
	emp_title_id varchar(10) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(1) not null,
	hire_date date not null,
	foreign key (emp_title_id) REFERENCES titles(title_id)
);

-- dept_emp table 
CREATE TABLE dept_emp (
	emp_no int NOT NULL,
	dept_no VARCHAR(10) not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) REFERENCES employees(emp_no),
	foreign key (dept_no) REFERENCES departments(dept_no)
);

-- dept_manager table 
CREATE TABLE dept__manager (
	dept_no varchar(10) not null,
	emp_no INT NOT null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) REFERENCES departments(dept_no),
	foreign key (emp_no) REFERENCES employees(emp_no)
);

-- salaries table 
CREATE TABLE salaries (
	emp_no int not null,
	salary int not null,
	primary key (emp_no, salary),
	foreign key (emp_no) references employees(emp_no)
);