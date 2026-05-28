# Telecom Customer Churn & Retention Analysis

## Project Overview
This project focuses on customer churn analysis for a telecom company using SQL and Power BI. The analysis was carried out to determine the overall customer churn rate, identify the major drivers of churn, and evaluate customer retention patterns. The project also examined the financial impact of churn.
The dataset contained customer demographic information, service subscriptions, billing details, contract types, and churn status for over 7,000 customers. SQL was used for data cleaning, transformation, and exploratory analysis, while Power BI was used to create an interactive dashboard for visualization and business insights.

## Business Problem
Customer churn is a major challenge in the telecommunications industry because losing customers directly affects revenue, customer growth, and long-term profitability. Telecom companies need to understand why customers leave their services and identify the factors contributing to high churn rates to improve customer retention strategies.

## Objectives
The objectives of this analysis were to:

- Calculate the overall customer churn rate
- Identify the major drivers of customer churn
- Analyze customer behavior and retention patterns
- Evaluate the financial impact of churn through revenue-at-risk analysis
- Provide actionable recommendations to improve customer retention

## Tools Used
- MySQL
- Power BI

## Dataset Information
The dataset used for this project is a synthetic telecom customer churn dataset obtained from Kaggle. It contains demographic information, service subscriptions, contract details, billing information, and churn status for 7,043 telecom customers.

## Data Cleaning Process
The data cleaning and preparation process included:

- Checking for duplicate customer IDs
- Handling blank and null values
- Renaming incorrectly labelled columns
- Converting data types where necessary
- Performing segmentation using CASE WHEN statements
- Aggregating customer data for churn analysis

## SQL Analysis
SQL was used to perform exploratory data analysis and customer churn analysis. The analysis included:

- Overall churn rate calculation
- Churn analysis by contract type
- Churn analysis by internet service type
- Churn analysis by tech support availability
- Customer retention analysis by tenure group
- Revenue-at-risk analysis
- Monthly charge band analysis
- High-risk customer segmentation

## Power BI Dashboard
An interactive Power BI dashboard was created to visualize key metrics and customer churn patterns. The dashboard included KPI cards and visualizations showing churn drivers, customer retention trends, revenue impact, and customer behaviour analysis.
<img width="835" height="471" alt="Dashboard_Screenshot" src="https://github.com/user-attachments/assets/dc9525ff-f342-4b21-8f59-c747d60d0f85" />

## Key Insights
- Customers on month-to-month contracts showed the highest churn rates.
- Fiber optic users experienced significantly higher churn rates than DSL users.
- Customers without tech support were more likely to churn.
- Customers with tenure between 0–1 year exhibited the highest churn behaviour.
- Higher monthly charges were associated with increased churn risk.
- The business faces significant monthly revenue loss from churned customers.

## Recommendations
- Encourage customers to switch to long-term contracts through discounts and loyalty incentives.
- Improve onboarding and engagement strategies for new customers.
- Bundle tech support services with fiber optic plans to improve customer satisfaction.
- Introduce targeted retention offers for high-charge customers who are at greater risk of churning.
- Monitor high-risk customer segments and implement proactive retention campaigns.

## Conclusion
This project demonstrated how SQL and Power BI can be used together to analyse customer churn patterns and generate actionable business insights. The analysis revealed that contract type, service quality, customer tenure, and monthly charges significantly influence customer churn behaviour. By identifying high-risk customer segments and revenue impact areas, telecom companies can implement more effective customer retention strategies and reduce potential revenue loss.

