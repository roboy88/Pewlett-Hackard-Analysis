# Pewlett-Hackard-Analysis
Pewlett-Hackard-Analysis
For learning SQLs from Module 7

Project Overview
Pewlett-Hackward needs to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then write a report that summarizes your analysis and helps prepare manager for the "silver tsunami" as many current employees reach retirement age.

Resources
PostgreSQL 14, PgAdmin 4
data for tables from employees.csv, departments.csv,dept_emp.csv,dept_manager.csv,titles.csv,salaries.csv
Challenge Overview
Prerequisite:

Download the Employee_Challenge_starter_code.sql file
Deliverable 1: The Number of Retiring Employees by Title
Follow the instructions below to complete Deliverable 1.

Retrieve the emp_no, first_name, and last_name columns from the Employees table.
Retrieve the title, from_date, and to_date columns from the Titles table.
Create a new table using the INTO clause.
Join both tables on the primary key.
Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Note: There are duplicate entries for some employees because they have switched titles over the years. Use the following instructions to remove these duplicates and keep only the most recent title of each employee.

Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
These columns will be in the new table that will hold the most recent title of each employee.
Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
Create a Unique Titles table using the INTO clause.
Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
First, retrieve the number of titles from the Unique Titles table.
Then, create a Retiring Titles table to hold the required information.
Group the table by title, then sort the count column in descending order.
Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Deliverable 2: The Employees Eligible for the Mentorship Program
Follow the instructions below to complete Deliverable 2.

Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
Retrieve the from_date and to_date columns from the Department Employee table.
Retrieve the title column from the Titles table.
Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
Create a new table using the INTO clause.
Join the Employees and the Department Employee tables on the primary key.
Join the Employees and the Titles tables on the primary key.
Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
Order the table by the employee number.
Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Pewlett-Hackard-Analysis Results
Image of retirement_titles image_name

Image of unique_titles image_name

Image of retiring_titles image_name

Image of mentorship_eligibilty image_name

Pewlett-Hackard-Analysis Summary
There are 1549 employees eligible for mentorship
Most number of employees retiring from titles Senior Engonner and Senior Staff
Additional Queries:

Retiring Managers
-- Following SQL will give information about managers who are going to retire and their department

  SELECT	a.emp_no,
			a.first_name,
			a.last_name,		
			a.title,
			b.dept_no,		
			c.dept_name
    FROM	unique_titles a
    JOIN	dept_manager b
      ON	a.emp_no = b.emp_no
    JOIN	departments c
      ON	b.dept_no = c.dept_no
  WHERE 	b.to_date = '9999-01-01'
  ORDER BY a.emp_no;
Top 10 hignest paid employees
-- Following SQL will give information top 10 highest paid employees

SELECT	a.emp_no,
        a.first_name,
        a.last_name,
        b.from_date,
        b.to_date,
        c.title,
        d.salary
FROM	employees a
JOIN	dept_emp b
  ON	a.emp_no = b.emp_no
JOIN	titles c
  ON	b.emp_no = c.emp_no
JOIN 	salaries d 
  ON	a.emp_no = d.emp_no 
WHERE b.to_date = '9999-01-01' AND c.to_date = '9999-01-01'
ORDER BY d.salary DESC LIMIT 10;
