SELECT * FROM attrition_data;

--Details of employees under attrition having 5+ years of experience with the age group 27-35
SELECT * FROM attrition_data
WHERE age BETWEEN 27 AND 35
AND totalworkingyears >= 5; 

--Details of employees having max and min salary working in different departments who received less than 13% salary hike
SELECT department,
		MAX(monthlyincome),
		MIN(monthlyincome)
FROM attrition_data
WHERE percentsalaryhike < 13
GROUP BY department
ORDER BY max(monthlyincome) DESC;

--Average monthly income of all employees who worked more than 3 years and whose education background is medical
SELECT AVG(monthlyincome)
FROM attrition_data
WHERE yearsatcompany > 3
AND educationfield = 'Medical'
GROUP BY educationfield;

--Total number of male and female employees under attrition who are married and haven't been promoted in the last 2 years
SELECT gender, COUNT(employeenumber)
FROM attrition_data
WHERE maritalstatus = 'Married'
AND yearssincelastpromotion = 2
AND attrition = 'Yes'
GROUP BY gender;

--Employees with max performance rating but no promotion for 4 years or more
SELECT * FROM attrition_data
WHERE performancerating = (SELECT MAX(performancerating) FROM attrition_data)
AND yearssincelastpromotion >= 4;

--Has max and min percentage salary hike
SELECT yearsatcompany, performancerating, yearssincelastpromotion, employeenumber,
		MAX(percentsalaryhike),
		MIN(percentsalaryhike)
FROM attrition_data
GROUP BY yearsatcompany, performancerating, yearssincelastpromotion, employeenumber
ORDER BY MAX(percentsalaryhike) DESC, MIN(percentsalaryhike) ASC;

--Employees working overtime but given min salary hike and have been with the company mor than 5 years
SELECT * FROM attrition_data 
WHERE overtime = 'Yes'
AND percentsalaryhike = (SELECT MIN(percentsalaryhike) FROM attrition_data)
AND yearsatcompany > 5
AND attrition = 'Yes';

--Overtime, max salary hike, and less than 5 years with the company 
SELECT * FROM attrition_data 
WHERE overtime = 'Yes'
AND percentsalaryhike = (SELECT MAX(percentsalaryhike) FROM attrition_data)
AND yearsatcompany < 5;

--Same conditions as above, but no overtime
SELECT * FROM attrition_data 
WHERE overtime = 'No'
AND percentsalaryhike = (SELECT MAX(percentsalaryhike) FROM attrition_data)
AND yearsatcompany < 5;


