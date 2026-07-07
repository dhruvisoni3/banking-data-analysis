-- ============================================================
-- File: churn_analysis.sql
-- Customer Churn Analysis
-- ============================================================

---------------------------------------------------------------
-- 1. Overall Churn Rate
---------------------------------------------------------------

SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Attrition_Flag='Attrited Customer' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Churn_Rate_Percentage
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 2. Churn by Gender
---------------------------------------------------------------

SELECT
    Gender,
    Attrition_Flag,
    COUNT(*) AS Customers,
    ROUND(
        COUNT(*)*100.0/
        SUM(COUNT(*)) OVER(PARTITION BY Gender),2
    ) AS Percentage
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Gender,Attrition_Flag
ORDER BY Gender;

---------------------------------------------------------------
-- 3. Churn by Income Category
---------------------------------------------------------------

SELECT
    Income_Category,
    Attrition_Flag,
    COUNT(*) AS Customers,
    ROUND(
        COUNT(*)*100.0/
        SUM(COUNT(*)) OVER(PARTITION BY Income_Category),2
    ) AS Percentage
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Income_Category,Attrition_Flag
ORDER BY Income_Category;

---------------------------------------------------------------
-- 4. Churn by Education Level
---------------------------------------------------------------

SELECT
    Education_Level,
    Attrition_Flag,
    COUNT(*) AS Customers,
    ROUND(
        COUNT(*)*100.0/
        SUM(COUNT(*)) OVER(PARTITION BY Education_Level),2
    ) AS Percentage
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Education_Level,Attrition_Flag
ORDER BY Education_Level;

---------------------------------------------------------------
-- 5. Churn by Marital Status
---------------------------------------------------------------

SELECT
    Marital_Status,
    Attrition_Flag,
    COUNT(*) AS Customers,
    ROUND(
        COUNT(*)*100.0/
        SUM(COUNT(*)) OVER(PARTITION BY Marital_Status),2
    ) AS Percentage
FROM `bank_analysis.credit_card_customers_cleaned`
GROUP BY Marital_Status,Attrition_Flag
ORDER BY Marital_Status;