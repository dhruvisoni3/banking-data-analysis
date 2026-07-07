# Bank Customer Churn Analysis using BigQuery & Looker Studio

## Project Overview

This project analyzes a bank's credit card customer dataset to understand customer behavior, identify churn patterns, and evaluate revenue performance. SQL queries were developed using Google BigQuery, and an interactive dashboard was created in Looker Studio to visualize key business metrics.

The project demonstrates practical Data Analyst skills, including data cleaning, exploratory data analysis (EDA), customer segmentation, business KPI analysis, SQL window functions, and dashboard development.

---

## Business Problem

Customer churn directly impacts a bank's profitability. Understanding which customers are leaving, identifying high-value customers, and analyzing spending behavior helps businesses make informed decisions to improve retention and increase revenue.

---

## Dataset

**Dataset:** BankChurners.csv

The dataset contains customer demographic information, credit card details, transaction history, credit limits, customer engagement metrics, and churn status.

---

## Tools & Technologies

* Google BigQuery
* SQL (Standard SQL)
* Looker Studio
* GitHub

---

## Project Structure

```text
Bank-Customer-Churn-Analysis/
│
├── dataset/
├── sql/
├── dashboard/
├── documentation/
├── presentation/
├── README.md
└── LICENSE
```

---

## SQL Topics Covered

* Data Cleaning
* Aggregate Functions
* GROUP BY
* HAVING
* CASE WHEN
* Common Table Expressions (CTEs)
* Window Functions
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* NTILE()
* LAG()
* LEAD()

---

## Dashboard Pages

### Executive Dashboard

* Total Customers
* Churn Rate
* Total Revenue
* Average Credit Limit
* Revenue by Card Category
* Customer Distribution

### Customer & Churn Analysis

* Churn by Gender
* Churn by Income
* Churn by Education
* Churn by Marital Status
* Revenue by Age Group
* Top Customers
* Customer Segmentation

---

## Key Performance Indicators (KPIs)

* Total Customers
* Churn Rate (%)
* Total Revenue
* Average Transaction Amount
* Average Credit Limit
* Customer Distribution
* Revenue by Card Category
* Customer Segmentation

---

## Business Insights

* Customer churn differs across demographic segments.
* High-value customers contribute significantly to total revenue.
* Customer inactivity is associated with higher churn risk.
* Premium card holders generally have higher transaction values.
* Revenue varies across income groups and age categories.

---

## Business Recommendations

* Improve retention strategies for high-risk customers.
* Reward loyal customers through targeted loyalty programs.
* Increase customer engagement with personalized offers.
* Identify eligible customers for premium card upgrades.
* Monitor business KPIs using interactive dashboards.

---

## Repository Structure

```
dataset/
    BankChurners.csv

sql/
    01_create_table.sql
    02_data_cleaning.sql
    03_exploratory_analysis.sql
    04_customer_analysis.sql
    05_churn_analysis.sql
    06_revenue_analysis.sql
    07_window_functions.sql

dashboard/
    dashboard_screenshots/

documentation/
    business_problem.md
    objectives.md
    kpis.md
    conclusions.md
    recommendations.md
```

---

## Author
Dhruvi Soni,
This project was developed as a Data Analyst portfolio project to demonstrate SQL analytics, business intelligence, and dashboard development using BigQuery and Looker Studio.
