-- ============================================================
-- File: window_functions.sql
-- Window Functions in BigQuery
-- Dataset: bank_analysis.credit_card_customers_cleaned
-- ============================================================

---------------------------------------------------------------
-- 1. ROW_NUMBER()
-- Assign a unique row number based on transaction amount
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Total_Trans_Amt,
    ROW_NUMBER() OVER(
        ORDER BY Total_Trans_Amt DESC
    ) AS Row_Number
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 2. ROW_NUMBER() Partition by Card Category
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Card_Category,
    Total_Trans_Amt,
    ROW_NUMBER() OVER(
        PARTITION BY Card_Category
        ORDER BY Total_Trans_Amt DESC
    ) AS Row_Number
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 3. RANK()
-- Rank customers by transaction amount
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Total_Trans_Amt,
    RANK() OVER(
        ORDER BY Total_Trans_Amt DESC
    ) AS Customer_Rank
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 4. RANK() within each Card Category
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Card_Category,
    Total_Trans_Amt,
    RANK() OVER(
        PARTITION BY Card_Category
        ORDER BY Total_Trans_Amt DESC
    ) AS Card_Rank
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 5. DENSE_RANK()
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Credit_Limit,
    DENSE_RANK() OVER(
        ORDER BY Credit_Limit DESC
    ) AS Dense_Rank
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 6. DENSE_RANK() by Income Category
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Income_Category,
    Credit_Limit,
    DENSE_RANK() OVER(
        PARTITION BY Income_Category
        ORDER BY Credit_Limit DESC
    ) AS Income_Rank
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 7. NTILE(4)
-- Divide customers into four spending quartiles
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Total_Trans_Amt,
    NTILE(4) OVER(
        ORDER BY Total_Trans_Amt DESC
    ) AS Revenue_Quartile
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 8. NTILE(5)
-- Divide customers into five spending groups
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Total_Trans_Amt,
    NTILE(5) OVER(
        ORDER BY Total_Trans_Amt DESC
    ) AS Revenue_Group
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 9. LAG()
-- Previous customer's transaction amount
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Total_Trans_Amt,
    LAG(Total_Trans_Amt) OVER(
        ORDER BY Total_Trans_Amt
    ) AS Previous_Transaction
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 10. LAG() by Card Category
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Card_Category,
    Total_Trans_Amt,
    LAG(Total_Trans_Amt) OVER(
        PARTITION BY Card_Category
        ORDER BY Total_Trans_Amt
    ) AS Previous_Card_Transaction
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 11. LEAD()
-- Next customer's transaction amount
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Total_Trans_Amt,
    LEAD(Total_Trans_Amt) OVER(
        ORDER BY Total_Trans_Amt
    ) AS Next_Transaction
FROM `bank_analysis.credit_card_customers_cleaned`;

---------------------------------------------------------------
-- 12. LEAD() by Income Category
---------------------------------------------------------------

SELECT
    CLIENTNUM,
    Income_Category,
    Total_Trans_Amt,
    LEAD(Total_Trans_Amt) OVER(
        PARTITION BY Income_Category
        ORDER BY Total_Trans_Amt
    ) AS Next_Income_Transaction
FROM `bank_analysis.credit_card_customers_cleaned`;