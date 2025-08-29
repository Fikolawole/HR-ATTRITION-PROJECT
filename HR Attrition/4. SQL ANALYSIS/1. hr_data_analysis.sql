SELECT TOP 5 * FROM hr_data;

--What is the total number of employees?
SELECT COUNT(*) AS [Total Number of Employees]
FROM hr_data;

--How many employees left the company?
select count(*) as [Employees that Left]
from hr_data where Attrition = '1';

--Attrition rate by department?
SELECT Department, COUNT(*) AS Total, 
SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS [Employees that Left] 
FROM hr_data GROUP BY Department;

--Average age of employees who left vs stayed
SELECT Attrition, AVG(Age) AS AvgAge 
FROM hr_data GROUP BY Attrition;

--Job roles with the highest attrition?
SELECT JobRole, COUNT(*) AS Leavers 
 FROM hr_data WHERE Attrition = '1' GROUP BY JobRole  ORDER BY Leavers DESC;

 --Average income by job role
 SELECT JobRole, AVG(MonthlyIncome) AS AvgIncome 
 FROM hr_data GROUP BY JobRole;

 --Attrition by overtime status
 SELECT OverTime, COUNT(*) AS Total, SUM(CASE WHEN Attrition = '1' THEN 1 ELSE 0 END) AS Leavers 
 FROM hr_data GROUP BY OverTime;

 --Satisfaction score comparison: left vs stayed
 SELECT Attrition, AVG(JobSatisfaction) AS AvgSatisfaction 
 FROM hr_data GROUP BY Attrition;

 --Top 3 departments with most employees
  SELECT TOP 3 Department, COUNT(*) AS Total 
  FROM hr_data GROUP BY Department ORDER BY Total DESC;

  --Correlation check: YearsAtCompany vs Attrition
  SELECT Attrition, AVG(YearsAtCompany) AS AvgTenure 
  FROM hr_data GROUP BY Attrition;