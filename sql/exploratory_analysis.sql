-- ===========================================================
-- File: exploratory_analysis.sql
-- Exploratory Data Analysis
-- ===========================================================

-------------------------------------------------------------
-- Total Customers
-------------------------------------------------------------

SELECT
COUNT(*) AS Total_Customers
FROM `bank_analysis.credit_card_customers_cleaned`;

-------------------------------------------------------------
-- Existing vs Churned Customers
-------------------------------------------------------------

SELECT
Attrition_Flag,
COUNT(*) AS Customers
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Attrition_Flag;

-------------------------------------------------------------
-- Customer Churn Percentage
-------------------------------------------------------------

SELECT

ROUND(
100 *
SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)
/
COUNT(*)
,2) AS Churn_Percentage

FROM `bank_analysis.credit_card_customers_cleaned`;

-------------------------------------------------------------
-- Gender Distribution
-------------------------------------------------------------

SELECT

Gender,

COUNT(*) AS Customers,

ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS Percentage

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Gender;

-------------------------------------------------------------
-- Card Category Distribution
-------------------------------------------------------------

SELECT

Card_Category,

COUNT(*) AS Customers,

ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS Percentage

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Card_Category

ORDER BY Customers DESC;

-------------------------------------------------------------
-- Income Category Distribution
-------------------------------------------------------------

SELECT

Income_Category,

COUNT(*) AS Customers

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Income_Category

ORDER BY Customers DESC;

-------------------------------------------------------------
-- Education Level Distribution
-------------------------------------------------------------

SELECT

Education_Level,

COUNT(*) AS Customers

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Education_Level

ORDER BY Customers DESC;

-------------------------------------------------------------
-- Marital Status Distribution
-------------------------------------------------------------

SELECT

Marital_Status,

COUNT(*) AS Customers

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Marital_Status

ORDER BY Customers DESC;

-------------------------------------------------------------
-- Average Credit Limit
-------------------------------------------------------------

SELECT

ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit

FROM `bank_analysis.credit_card_customers_cleaned`;

-------------------------------------------------------------
-- Average Transaction Amount
-------------------------------------------------------------

SELECT

ROUND(AVG(Total_Trans_Amt),2) AS Avg_Transaction

FROM `bank_analysis.credit_card_customers_cleaned`;

-------------------------------------------------------------
-- Average Transaction Count
-------------------------------------------------------------

SELECT

ROUND(AVG(Total_Trans_Ct),2) AS Avg_Transaction_Count

FROM `bank_analysis.credit_card_customers_cleaned`;