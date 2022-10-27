-- -- Creating tables for PH-EmployessDB
-- CREATE TABLE departments(
-- 	dept_no VARCHAR(4) NOT NULL,
-- 	dept_name VARCHAR(40) NOT NULL,
-- 	PRIMARY KEY (dept_no),
-- 	UNIQUE(dept_name)
-- );


-- CREATE TABLE Employees(
-- 	emp_no INT NOT NULL,
-- 	birth_date DATE NOT NULL,
-- 	first_name VARCHAR NOT NULL,
-- 	last_name VARCHAR NOT NULL,
-- 	gender VARCHAR NOT NULL,
-- 	hire_date DATE NOT NULL,
	
-- 	PRIMARY KEY (emp_no)
-- );

-- CREATE TABLE dept_manager(
-- 	dept_no VARCHAR(4) NOT NULL,
-- 	emp_no INT NOT NULL,
-- 	from_date DATE NOT NULL,
-- 	to_date DATE NOT NULL,
	
-- 	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
-- 	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
-- 	PRIMARY KEY (emp_no, dept_no)
-- );

-- CREATE TABLE salaries(
-- 	emp_no INT NOT NULL,
-- 	salary INT NOT NULL,
-- 	from_date DATE NOT NULL,
-- 	to_date DATE NOT NULL,
-- 	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
-- 	PRIMARY KEY (emp_no)
-- );
-- CREATE TABLE titles(
-- 	emp_no INT NOT NULL,
-- 	title INT NOT NULL,
-- 	from_date DATE NOT NULL,
-- 	to_date DATE NOT NULL,
-- 	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
-- 	PRIMARY KEY (emp_no)
-- );

-- CREATE TABLE dept_emp(
-- 	dept_no VARCHAR NOT NULL,
-- 	emp_no INT NOT NULL,
-- 	from_date DATE NOT NULL,
-- 	to_date DATE NOT NULL,
-- 	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
-- 	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
-- 	PRIMARY KEY (dept_no, emp_no)
-- );




#made a mistake for title (title instead of int it needed to VARCHAR)
CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_DATE DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (emp_no)
);

-- retirement.csv 

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
--INTO retirement_titles
FROM Employees as e
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-01-01';

--unique_titles.csv
SELECT DISTINCT ON(emp_no) emp_no, first_name, last_name, title
INTO unique_title
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--retiring_titles.csv
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY COUNT(title) DESC;

-- mentorship_eligibility.csv
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;
