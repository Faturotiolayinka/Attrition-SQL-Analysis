create database attrition;
use attrition;
rename table attrition to attrition_table;
select * from attrition_table;
select count(department) from attrition_table;

SET SQL_SAFE_UPDATES = 0;

-- rename the attrition table
alter table attrition_table
rename column ï»¿Attrition to attrition;

-- 1 what  is the total amount of income by job role of each employee
select Job_Role, sum(Monthly_Income) as Total_income from attrition_table
group by Job_Role
order by Total_income desc;

-- 2 What is the count of employee in each department Attrition
select department, count(Employee_Count) as Employee_Count 
from attrition_table
group by department
order by Employee_Count desc;

-- 3 what is the sum of income by attrition lable
select attrition, sum( Monthly_Income) as Total_income
from attrition_table
group by attrition
order by Total_income desc;

-- 4 what is the numbers of years by education in the company
select Education, count(Years_At_Company) as Year_at_company
from Attrition_table
group by Education
order by Year_at_company desc;

-- 5 how many employee has left and how many are available in the company?
select count(*) as attrition,
case when attrition = "Yes" then count(attrition = "Yes")
end as Conditions
from attrition_table
group by attrition;

--  6 how many employee has left the company? 
 select count(*) as Yes_left
 from attrition_table where attrition = "Yes";

-- 7 how many employee are still availiable in the company?
select count(*) as On_sit
from attrition_table where attrition = "No";

-- 8 how many employee are both available in the company?
select attrition, count(attrition) as Yes_No
from attrition_table
group by attrition;

-- 9 what is the Monthly rate by department
select department, sum(Monthly_Rate) as Monthly_rate
from attrition_table
group by department
order by Monthly_Rate desc;

-- 10 What is the attrition rate by department?
SELECT department,
        COUNT(CASE WHEN attrition = 'Yes' THEN 1 END)* 100.0 / COUNT(*) AS attrition_rate
FROM attrition_table
GROUP BY department;

-- 11 What is the average monthly income of employees by job role?
select * from attrition_table;
select job_role, avg(Monthly_Income) as Average_Income
from attrition_table 
group by job_role;

-- 12 What is the distribution of education levels among employees who left?
select Education, count(case when attrition = "Yes" then 1 end ) as left_Emp
from attrition_table
group by Education;

-- 13 What is the distribution of education levels among employees who left?
SELECT education,
       COUNT(*) AS count
FROM attrition_table
WHERE attrition = 'Yes'
GROUP BY education;

-- 14 What is the average age and job satisfaction of Attrition by attrition status?
select attrition, avg(Age) as Avg_Age, avg(Job_Satisfaction) as Job_Satisfaction
from attrition_table
group by attrition;

-- 15 What is the total number of employees by gender and attrition status?
select Gender, attrition, sum(Employee_Count) Total_Emp
from attrition_table
group by gender, attrition;
 
-- 16 What is the average distance from home of employees who left vs. stayed?
select attrition, avg(Distance_From_Home) as Avg_Distance_From_Home
from attrition_table
group by attrition;

-- 17 Which job roles have the highest attrition count?
select Job_Role, count(case when attrition = "Yes" then 1 end) as highest_attrition
from attrition_table
group by Job_Role;

--  18 Is there a pattern between job level and attrition?
select Job_Level, count(case when attrition = "Yes" then 1 end) as count,
 count(*) as Job_level_count
from attrition_table
group by Job_Level;

-- 19 What is the average number of years at the company grouped by attrition status?
select attrition, avg(Years_At_Company) as Avg_Years_At_Company
from attrition_table
group by attrition;		

-- 20 What is the correlation between overtime and attrition?
select * from attrition_table;
select Over_Time, attrition, count(case when attrition = "Yes" then 1 end) as attrition
from attrition_table
group by Over_Time, attrition;