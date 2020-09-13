-- CREATING employees table
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" CHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- CREATING titles TABLE
CREATE TABLE "titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

SELECT * FROM titles

-- CREATING salaries TABLE

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" FLOAT   NOT NULL
);

SELECT * FROM salaries;

-- CREATING dept_manager TABLE
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INT   NOT NULL    
);

SELECT * FROM dept_manager;
-- CREATING dept_emp TABLE
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
	"dept_no" VARCHAR(10)   NOT NULL
    
);

-- CREATING departments TABLE

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);


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




