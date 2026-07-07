-- ============================================================
-- File: revenue_analysis.sql
-- Revenue Analysis
-- ============================================================

---------------------------------------------------------------
-- 1. Total Transaction Revenue
---------------------------------------------------------------

SELECT
    SUM(Total_Trans_Amt) AS Total_Revenue
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 2. Revenue by Card Category
---------------------------------------------------------------

SELECT
    Card_Category,
    COUNT(*) AS Customers,
    SUM(Total_Trans_Amt) AS Total_Revenue,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Revenue
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Card_Category
ORDER BY Total_Revenue DESC;

---------------------------------------------------------------
-- 3. Revenue by Gender
---------------------------------------------------------------

SELECT
    Gender,
    COUNT(*) AS Customers,
    SUM(Total_Trans_Amt) AS Total_Revenue,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Revenue
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Gender
ORDER BY Total_Revenue DESC;

---------------------------------------------------------------
-- 4. Revenue by Income Category
---------------------------------------------------------------

SELECT
    Income_Category,
    COUNT(*) AS Customers,
    SUM(Total_Trans_Amt) AS Total_Revenue,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Revenue
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Income_Category
ORDER BY Total_Revenue DESC;

---------------------------------------------------------------
-- 5. Revenue by Age Group
---------------------------------------------------------------

SELECT

CASE
    WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
    WHEN Customer_Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Customer_Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Customer_Age BETWEEN 51 AND 60 THEN '51-60'
    ELSE '60+'
END AS Age_Group,

COUNT(*) AS Customers,

SUM(Total_Trans_Amt) AS Total_Revenue,

ROUND(AVG(Total_Trans_Amt),2) AS Avg_Revenue

FROM `bank_analysis.credit_card_customers_cleaned`

GROUP BY Age_Group

ORDER BY Total_Revenue DESC;