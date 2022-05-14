-----------------
--DELIVERABLE 1--
-----------------
/*
Retrieve the emp_no, first_name, and last_name columns from the Employees table.
Retrieve the title, from_date, and to_date columns from the Titles table.
Create a new table using the INTO clause.
Join both tables on the primary key.
Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
*/
--drop table retirement_titles;
select e.emp_no,
	e.first_name,
	e.last_name,
	t.title, 
	t.from_date,
	t.to_date
into retirement_titles
from public.employees e
inner join public.titles t
	on e.emp_no=t.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31')
order by e.emp_no;

/*
Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
These columns will be in the new table that will hold the most recent title of each employee.
Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
Create a Unique Titles table using the INTO clause.
Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
	Before you export your table, confirm that it looks like this image:

Save your Employee_Database_challenge.sql file in your Queries folder in the Pewlett-Hackard folder
*/
-- Use Dictinct with Orderby to remove duplicate rows
--Drop table unique_titles;
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;

/*
Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
First, retrieve the number of titles from the Unique Titles table.
Then, create a Retiring Titles table to hold the required information.
Group the table by title, then sort the count column in descending order.
Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
	Before you export your table, confirm that it looks like this image:
*/
--drop table retiring_titles;
select title,
	count(*) emp_count
into retiring_titles
from unique_titles ut
group by title,
	e.total_emp_count
order by 2 desc;

-----------------
--DELIVERABLE 2--
-----------------
/*
In the Employee_Database_challenge.sql file, write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

x Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
x Join the Employees and the Department Employee tables on the primary key.
x Retrieve the from_date and to_date columns from the Department Employee table.
x Join the Employees and the Titles tables on the primary key.
x Retrieve the title column from the Titles table.
x Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
x Order the table by the employee number.
x Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
Create a new table using the INTO clause.
Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Before you export your table, confirm that it looks like this image:
*/
--drop table mentorship_eligibilty;
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	de.from_date,
	de.to_date,
	t.title
into mentorship_eligibilty
from public.employees e
inner join public.dept_emp de
	on e.emp_no=de.emp_no
inner join titles t
	on e.emp_no=t.emp_no
where (e.birth_date between '1965-01-01' and '1965-12-31')
	and t.to_date='9999-01-01'
order by e.emp_no

--------------------
--data exploration--
--------------------
select t.title,
	count(*) total_emp_count,
	ut.emp_count retiring_emp_count,
	((count(*)*1.) / (ut.emp_count*1.))*100 retiring_pct,
	me.emp_count mentor_emp_count
from titles t
left join (
		select title,
			count(*) emp_count
		from public.mentorship_eligibilty
		group by title) me
	on t.title=me.title
left join (
		select title,
			count(*) emp_count
		from public.unique_titles
		group by title) ut
	on t.title=ut.title
where t.to_date='9999-01-01'
	and exists(
		select 1
		from employees e
		where e.emp_no=t.emp_no)
group by t.title,
	ut.emp_count,
	me.emp_count
order by 2 desc;



	
	
	