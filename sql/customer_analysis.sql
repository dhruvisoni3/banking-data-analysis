-- ===========================================================
-- File: customer_analysis.sql
-- Customer Analysis
-- ===========================================================

-------------------------------------------------------------
-- Customer Age Groups
-------------------------------------------------------------

SELECT

CASE

WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'

WHEN Customer_Age BETWEEN 31 AND 40 THEN '31-40'

WHEN Customer_Age BETWEEN 41 AND 50 THEN '41-50'

WHEN Customer_Age BETWEEN 51 AND 60 THEN '51-60'

ELSE '60+'

END AS Age_Group,

COUNT(*) AS Customers

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Age_Group

ORDER BY Age_Group;

-------------------------------------------------------------
-- Average Credit Limit by Card Category
-------------------------------------------------------------

SELECT

Card_Category,

ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Card_Category

ORDER BY Avg_Credit_Limit DESC;

-------------------------------------------------------------
-- Average Credit Limit by Income
-------------------------------------------------------------

SELECT

Income_Category,

ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Income_Category

ORDER BY Avg_Credit_Limit DESC;

-------------------------------------------------------------
-- Average Transaction Count by Card
-------------------------------------------------------------

SELECT

Card_Category,

ROUND(AVG(Total_Trans_Ct),2) AS Avg_Transaction_Count

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Card_Category

ORDER BY Avg_Transaction_Count DESC;

-------------------------------------------------------------
-- Total Transactions by Gender
-------------------------------------------------------------

SELECT

Gender,

SUM(Total_Trans_Ct) AS Total_Transactions

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Gender;

-------------------------------------------------------------
-- Average Relationship Count
-------------------------------------------------------------

SELECT

ROUND(AVG(Total_Relationship_Count),2) AS Avg_Relationships

FROM `bank_analysis.credit_card_customers_cleaned`;

-------------------------------------------------------------
-- Relationship Count Distribution
-------------------------------------------------------------

SELECT

Total_Relationship_Count,

COUNT(*) AS Customers

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Total_Relationship_Count

ORDER BY Total_Relationship_Count;

-------------------------------------------------------------
-- Average Credit Limit by Gender
-------------------------------------------------------------

SELECT

Gender,

ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Gender;

-------------------------------------------------------------
-- Average Transaction Amount by Age Group
-------------------------------------------------------------

SELECT

CASE

WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
WHEN Customer_Age BETWEEN 31 AND 40 THEN '31-40'
WHEN Customer_Age BETWEEN 41 AND 50 THEN '41-50'
WHEN Customer_Age BETWEEN 51 AND 60 THEN '51-60'
ELSE '60+'

END AS Age_Group,

ROUND(AVG(Total_Trans_Amt),2) AS Avg_Transaction

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Age_Group

ORDER BY Age_Group;

-------------------------------------------------------------
-- Top 20 Customers by Transaction Amount
-------------------------------------------------------------

SELECT

CLIENTNUM,

Card_Category,

Income_Category,

Credit_Limit,

Total_Trans_Amt

FROM `bank_analysis.credit_card_customers_cleaned`

ORDER BY Total_Trans_Amt DESC

LIMIT 20;