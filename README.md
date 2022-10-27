# Pwelett-Hackard_Analysis
Overview of the analysis:
The purpose of this analysis is to have a deeper understanding of the number of retiring employees per title and also identitfying who are eligible to participate in a mentorship program. 

Results: 
The table illustrates that the Senior position of the Engineer and the Staff are going to be retired the most compare to other job position. Manager postion has the least amount of retirement compare to any other postion. 

Summary:

How many roles will need to be filled as the "silver tsunami" begins to make an impact?
According to the data, 472 people will be retired. Therefore, it is crucial to hire at least 472 employees inorder to overcome the silver tsunami.

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date != '9999-01-01';


Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

For senior staff postion there are 66 employee that retired and 276 employee who are curretnly working on this position. This shows that there are enough employee to mentor new employees.

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date != '9999-01-01' AND title = 'Senior Staff';

For senior engineer postion there are 79 employee that retired and 263 employee who are curretnly working on this position. This shows that there are enough employee to mentor new employees.

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date != '9999-01-01' AND title = 'Senior Engineer';

For engineer postion there are 132 employee that retired and 392 employee who are curretnly working on this position. This shows that there are enough employee to mentor new employees.

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date = '9999-01-01' AND title = 'Engineer';

For Staff postion there are 148 employee that retired and 414 employee who are curretnly working on this position. This shows that there are enough employee to mentor new employees.

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date != '9999-01-01' AND title = 'Staff';

For Technique Leader postion there are 27 employee that retired and 72 employee who are curretnly working on this position. This shows that there are enough employee to mentor new employees

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date != '9999-01-01' AND title = 'Technique Leader';


For Assitant Engineer postion there are 20 employee that retired and 51 employee who are curretnly working on this position. This shows that there are enough employee to mentor new employees

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date != '9999-01-01' AND title = 'Assistant Engineer';

For Manager postion there are 0 employee that retired and 0 employee who are curretnly working on this position.

SELECT COUNT(emp_no)
FROM mentorship_eligibility
WHERE to_date = '9999-01-01' AND title = 'Manager';

