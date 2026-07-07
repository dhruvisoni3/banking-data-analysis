-- ===========================================================
-- File: data_cleaning.sql
-- Purpose: Clean and prepare the dataset for analysis
-- ===========================================================

-- Preview dataset
SELECT *
FROM `bank_analysis.credit_card_customers`
LIMIT 10;

-------------------------------------------------------------
-- Check Total Records
-------------------------------------------------------------

SELECT COUNT(*) AS total_records
FROM `bank_analysis.credit_card_customers`;

-------------------------------------------------------------
-- Check Duplicate Customer IDs
-------------------------------------------------------------

SELECT
CLIENTNUM,
COUNT(*) AS duplicate_count
FROM `bank_analysis.credit_card_customers`
GROUP BY CLIENTNUM
HAVING COUNT(*) > 1;

-------------------------------------------------------------
-- Check NULL values in each important column
-------------------------------------------------------------

SELECT
COUNTIF(Customer_Age IS NULL) AS age_nulls,
COUNTIF(Gender IS NULL) AS gender_nulls,
COUNTIF(Education_Level IS NULL) AS education_nulls,
COUNTIF(Marital_Status IS NULL) AS marital_nulls,
COUNTIF(Income_Category IS NULL) AS income_nulls,
COUNTIF(Card_Category IS NULL) AS card_nulls,
COUNTIF(Credit_Limit IS NULL) AS credit_limit_nulls,
COUNTIF(Total_Trans_Amt IS NULL) AS transaction_amount_nulls,
COUNTIF(Total_Trans_Ct IS NULL) AS transaction_count_nulls
FROM `bank_analysis.credit_card_customers`;

-------------------------------------------------------------
-- Replace NULL values (if any)
-------------------------------------------------------------

CREATE OR REPLACE VIEW `bank_analysis.credit_card_customers_cleaned`
AS
SELECT

CLIENTNUM,

Attrition_Flag,

IFNULL(Customer_Age,0) AS Customer_Age,

IFNULL(Gender,'Unknown') AS Gender,

IFNULL(Education_Level,'Unknown') AS Education_Level,

IFNULL(Marital_Status,'Unknown') AS Marital_Status,

IFNULL(Income_Category,'Unknown') AS Income_Category,

IFNULL(Card_Category,'Unknown') AS Card_Category,

IFNULL(Months_on_book,0) AS Months_on_book,

IFNULL(Total_Relationship_Count,0) AS Total_Relationship_Count,

IFNULL(Months_Inactive_12_mon,0) AS Months_Inactive_12_mon,

IFNULL(Contacts_Count_12_mon,0) AS Contacts_Count_12_mon,

IFNULL(Credit_Limit,0) AS Credit_Limit,

IFNULL(Total_Revolving_Bal,0) AS Total_Revolving_Bal,

IFNULL(Avg_Open_To_Buy,0) AS Avg_Open_To_Buy,

IFNULL(Total_Amt_Chng_Q4_Q1,0) AS Total_Amt_Chng_Q4_Q1,

IFNULL(Total_Trans_Amt,0) AS Total_Trans_Amt,

IFNULL(Total_Trans_Ct,0) AS Total_Trans_Ct,

IFNULL(Total_Ct_Chng_Q4_Q1,0) AS Total_Ct_Chng_Q4_Q1,

IFNULL(Avg_Utilization_Ratio,0) AS Avg_Utilization_Ratio

FROM `bank_analysis.credit_card_customers`;

-------------------------------------------------------------
-- Verify Cleaned View
-------------------------------------------------------------

SELECT *
FROM `bank_analysis.credit_card_customers_cleaned`
LIMIT 20;