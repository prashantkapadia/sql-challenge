
-- Altering Employee table to add emp_title_id as foreign key
ALTER TABLE employees ADD CONSTRAINT "pk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

-- Adding employee Nmumber as Foreign key Constraint in Salaries table 
ALTER TABLE salaries ADD CONSTRAINT "fk_salaries_emp_id" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Adding dept_emp table foreign keys for dept_no and emp_no
ALTER TABLE dept_emp ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE dept_emp ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");


-- Adding dept_manager table foreign keys for dept_no and emp_no
ALTER TABLE dept_manager ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE dept_manager ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,last_name,hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,dp.dept_name,dm.emp_no,e.last_name,e.first_name
FROM dept_manager as dm
INNER JOIN departments AS dp ON dm.dept_no = dp.dept_no
INNER JOIN employees AS e ON dm.emp_no = e.emp_no;

-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no;

--5. List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name,sex FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6.List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007';


-- 7 List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005'


-- 8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name,COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
