create database customer_churn_db;
use customer_churn_db;
select count(*) from customer_churn;
select * from customer_churn limit 14;
DESCRIBE customer_churn;
ALTER TABLE customer_churn rename column ï»¿customerID to customer_id;
#Blank Rows
select * from customer_churn where TotalCharges = ' ';
#Checking for duplicates
select customer_id, count(*) from customer_churn group by customer_id having count(*) > 1;
set SQL_SAFE_UPDATES = 0;
update customer_churn set TotalCharges = NULL where (TotalCharges) = ' ';
set SQL_SAFE_UPDATES = 1;
ALTER TABLE customer_churn MODIFY COLUMN TotalCharges DECIMAL(10,2);
#Overall Churn Rate
SELECT COUNT(*) AS total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate_percentage
from customer_churn;
#Churn by Contract Type
select Contract, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn group by Contract order by Churn_rate desc;
#Churn by Internet Service Type
select InternetService, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn group by InternetService order by Churn_rate desc;
#Churn by Tech Support Type
select TechSupport, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn group by TechSupport order by Churn_rate desc;
#Average Monthly Charges by Churn
select Churn, round(avg(MonthlyCharges),2) as avg_monthly_charge
from customer_churn group by Churn;
#Average Total Charges by Contract
select Contract, round(avg(TotalCharges),2) as avg_total_charges
from customer_CHURN GROUP BY Contract;
#General High Risk Customers
select customer_id, gender, SeniorCitizen, tenure, MonthlyCharges, InternetService, Contract, TechSupport, Churn
from customer_churn where Contract = 'Month-to-Month'
and InternetService = 'Fiber optic' and TechSupport = 'No';
#Risk Churn Rate
select count(*) as high_risk_customer, sum(case when Churn = 'Yes' then 1 else 0 end) as already_churned,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as risk_churn_rate
from customer_churn where Contract = 'Month-to-Month'
and InternetService = 'Fiber optic' and TechSupport = 'No';
#Low Risk Customers
select case when Contract = 'Two year' and InternetService != 'Fiber optic' and TechSupport = 'Yes'
then 'Low Risk' else 'Other' end as risk_segment, count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers, 
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn group by risk_segment;
#Revenue at Risk
select round(sum(MonthlyCharges),2) as total_monthly_REVENUE_at_risk
from customer_churn where Contract = 'Month-to-Month'
and InternetService = 'Fiber optic' and TechSupport = 'No' and Churn = 'Yes';
#Customer Retention Analysis
select case when tenure between 0 and 12 then '0-1 Year'
when tenure between 13 and 24 then '1-2 Years'
when tenure between 25 and 48 then '2-4 Years'
when tenure > 48 then '4+ Years'
end as tenure_group, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn 
group by tenure_group order by churn_rate desc;
#Monthly Charges Vs Churn
select case when MonthlyCharges < 35 then 'Low'
when MonthlyCharges between 35 and 70 then 'Medium'
else 'High' end as charge_band, count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn 
group by charge_band order by churn_rate desc;
#Insight Summary
select Contract, InternetService, TechSupport, 
case when tenure<= 12 then '0-1 Year'
when tenure<= 24 then '1-2 Years'
when tenure <= 48 then '2-4 Years' else '4+ Years' end as tenure_group, 
count(*) as total_customers, sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
round (sum(case when Churn = 'Yes' then 1 else 0 end) *100/count(*), 2) as churn_rate
from customer_churn 
group by tenure_group, Contract, InternetService, TechSupport;