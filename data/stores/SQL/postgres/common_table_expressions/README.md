# Common Table Expressions
## A CTE for IT-positions

To practice writing CTEs, let's start with a simple example. You will use the employee table which is built up of fields such as ID, Name, and Position. The task for you is to create a CTE called ITjobs (keep in mind the syntax WITH CTE_Name As) that finds employees named Andrea whose job titles start with IT. Finally, a new query will retrieve all IT positions and names from the ITJobs CTE.

To search for a pattern, you have to use the LIKE statement and % representing the search direction. For example, using a WHERE statement with LIKE 'N%' will find patterns starting with N.


    Create the CTE ITjobs.
    Define the fields of the CTE as ID, Name, and Position.
    Find the positions starting with IT and the name starting with A.

```sql
-- Define the CTE ITjobs by the WITH operator
WITH ITjobs (ID, Name, Position) AS (
    SELECT 
  		ID, 
  		Name,
  		Position
    FROM employee
    -- Find IT jobs and names starting with A
  	WHERE Position LIKE 'IT%' AND Name LIKE 'A%')
    
SELECT * 
FROM ITjobs;
```

## A CTE for high-paid IT-positions

In the previous exercise, you created a CTE to find IT positions. Now, you will combine these results with another CTE on the salary table. You will use multiple CTE definitions in a single query. Notice that a comma is used to separate the CTE query definitions. The salary table contains some more information about the ID and salary of employees. Your task is to create a second CTE named ITsalary and JOIN both CTE tables on the employees ID. The JOIN should select only records having matching values in both tables. Finally, the task is to find only employees earning more than 3000.


    Define the second CTE, ITSalary, with the fields ID and Salary.
    Find salaries above 3000.
    Combine the two CTEs by using a JOIN of matching IDs and select the name, the salary, and the position of the selected employees.

```sql
WITH ITjobs (ID, Name, Position) AS (
    SELECT 
  		ID, 
  		Name,
  		Position
    FROM employee
    WHERE Position like 'IT%'),
    
-- Define the second CTE table ITSalary with the fields ID and Salary
ITSalary (ID, Salary) AS (
    SELECT
        ID,
        Salary
    FROM Salary
  	-- Find salaries above 3000
    WHERE Salary > 3000)
    
SELECT 
	ITjobs.NAME,
	ITjobs.POSITION,
    ITsalary.Salary
FROM ITjobs
    -- Combine the two CTE tables the correct join variant
    INNER JOIN ITsalary
    -- Execute the join on the ID of the tables
    ON ITjobs.ID = ITsalary.ID;
```

# Recursive Common Table Expressions

## How to query the factorial of 6 recursively

In the last exercise, you queried the factorial 5! with an iterative solution. Now, you will calculate 6! recursively. We reduce the problem into smaller problems of the same type to define the factorial n! recursively. For this the following definition can be used:

    0! = 1 for step = 0
    (n+1)! = n! * (step+1) for step > 0

With this simple definition you can calculate the factorial of every number. In this exercise, n! is represented by factorial.

You are going to leverage the definition above with the help of a recursive CTE.


    Initialize the fields factorial and step to 1.
    Calculate the recursive part with factorial * (step + 1).
    Stop the recursion process when the current iteration value is smaller than the target factorial number.

```sql
WITH calculate_factorial AS (
	SELECT 
		-- Initialize step and the factorial number      
      	1 AS step,
        1 AS factorial
	UNION ALL
	SELECT 
	 	step + 1,
		-- Calculate the recursive part by n!*(n+1)
	    factorial * (step + 1)
	FROM calculate_factorial        
	-- Stop the recursion reaching the wanted factorial number
	WHERE step < 6)
    
SELECT factorial 
FROM calculate_factorial;
```

## Counting numbers recursively

In this first exercise after the video, we will start with a very simple math function. It is the simple series from 1 to target and in our case we set the target value to 50.

This means the task is to count from 1 to 50 using a recursive query. You have to define:

    the CTE with the definition of the anchor and recursive query and
    set the appropriate termination condition for the recursion


    Limit the recursion step to 50 in the recursive query.
    Define the CTE with the name counting_numbers.
    Initialize number in the anchor query.
    Add 1 to number each recursion step.

```sql
-- Define the CTE
WITH counting_numbers AS ( 
	SELECT 
  		-- Initialize number
  		1 AS number
  	UNION ALL 
  	SELECT 
  		-- Increment number by 1
  		number + 1 
  	FROM counting_numbers
	-- Set the termination condition
  	WHERE number < 50)

SELECT number
FROM counting_numbers;
```


## Calculate the sum of potencies

In this exercise, you will calculate the sum of potencies recursively. This mathematical series is defined as:

    result=1 for step = 1
    result + step^step for step > 1

The numbers in this series are getting large very quickly and the series does not converge. The task of this exercise is to calculate the sum of potencies for step = 9.


    Define the CTE calculate_potencies with the fields step and result.
    Initialize step and result.
    Add the next step to the POWER() step + 1 to result.


```sql
-- Define the CTE calculate_potencies with the fields step and result
WITH calculate_potencies (step, result) AS (
    SELECT 
  		-- Initialize step and result
  		1 as step,
  		1 as result
    UNION ALL
    SELECT 
  		step + 1,
  		-- Add the POWER calculation to the result 
  		result + POWER(step + 1, step + 1)
    FROM calculate_potencies
    WHERE step < 9)
    
SELECT 
	step, 
    result
FROM calculate_potencies;
```

## Create the alphabet recursively

The task of this exercise is to create the alphabet by using a recursive CTE.

To solve this task, you need to know that you can represent the letters from A to Z by a series of numbers from 65 to 90. Accordingly, A is represented by 65 and C by 67. The function char(number) can be used to convert a number its corresponding letter.


    Initialize number_of_letter to the number representing the letter A.
    Increase the value of number_of_letter by 1 in each step and set the limit to 90, the value of Z.
    Select the recursive member from the defined CTE.

```sql
WITH alphabet AS (
	SELECT 
  		-- Initialize letter to A
	    65 AS number_of_letter
	-- Statement to combine the anchor and the recursive query
  	UNION ALL
	SELECT 
  		-- Add 1 each iteration
	    number_of_letter + 1
  	-- Select from the defined CTE alphabet
	FROM alphabet
  	-- Limit the alphabet to A-Z
  	WHERE number_of_letter < 90)
    
SELECT char(number_of_letter)
FROM alphabet;
```

## Create a time series of a year

The goal of this exercise is to create a series of days for a year. For this task you have to use the following two time/date functions:

    GETDATE()
    DATEADD(datepart, number, date)

With GETDATE() you get the current time (e.g. 2019-03-14 20:09:14) and with DATEADD(month, 1, GETDATE()) you get current date plus one month (e.g. 2019-04-14 20:09:14).

To get a series of days for a year you need 365 recursion steps. Therefore, increase the number of iterations by OPTION (MAXRECURSION n) where n represents the number of iterations.


    Initialize the current time as time.
    Select the CTE recursively and combine the anchor and recursive member with the correct statement.
    Limit the number of iterations to days in a year minus 1
    Increase the maximum number of iterations to the number of days in a year with OPTION (MAXRECURSION n)

```sql
WITH time_series AS (
	SELECT 
  		-- Get the current time
	    GETDATE() AS time
  	UNION ALL
	SELECT 
	    DATEADD(day, 1, time)
  	-- Call the CTE recursively
	FROM time_series
  	-- Limit the time series to 1 year minus 1 (365 days -1)
  	WHERE time < GETDATE() + 364)
    
SELECT time
FROM time_series
-- Increase the number of iterations (365 days)
OPTION(MAXRECURSION 365)
```
