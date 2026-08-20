CREATE DATABASE customer_churn_analysis;

USE customer_churn_analysis;
USE customer_churn_analysis;
SELECT COUNT(*) AS total_customers
FROM customers;
DESCRIBE customers;
SELECT *
FROM customers
LIMIT 10;
USE customer_churn_analysis;
#QUERY_1_(Basic Data Overview)
SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Total_Churned,
    COUNT(*) - SUM(Churn) AS Total_Not_Churned,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers;
#QUERY_2_(Churn by Gender)
SELECT
    Gender,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY Gender
ORDER BY Churn_Rate_Percent DESC;
#QUERY_3_(Churn by Active Membership)
SELECT
    IsActiveMember,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY IsActiveMember;
#QUERY_4_(Number of Products vs Churn)
SELECT
    NumOfProducts,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;
#QUERY_5_(Churn by Credit Card)
SELECT
    HasCrCard,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY HasCrCard
ORDER BY Churn_Rate_Percent DESC;
#QUERY_6_(Churn by Age Group)
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS Age_Group,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY Age_Group
ORDER BY Churn_Rate_Percent DESC;
#QUERY_7_(Tenure vs Churn)
SELECT
    CASE
        WHEN Tenure_Months <= 24 THEN '0-2 Years'
        WHEN Tenure_Months BETWEEN 25 AND 48 THEN '2-4 Years'
        WHEN Tenure_Months BETWEEN 49 AND 72 THEN '4-6 Years'
        ELSE '6+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY Tenure_Group
ORDER BY Churn_Rate_Percent DESC;
#QUERY_8_(Balance vs Churn)
SELECT
    CASE
        WHEN Balance < 10000 THEN 'Low Balance'
        WHEN Balance BETWEEN 10000 AND 50000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS Balance_Group,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY Balance_Group
ORDER BY Churn_Rate_Percent DESC;
#QUERY_9_(Estimated salary vs churn)
SELECT
    CASE
        WHEN EstimatedSalary < 50000 THEN 'Low Salary'
        WHEN EstimatedSalary BETWEEN 50000 AND 100000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Group,
    COUNT(*) AS Customers,
    SUM(Churn) AS Churned_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percent
FROM customers
GROUP BY Salary_Group
ORDER BY Churn_Rate_Percent DESC;
#QUERY_10_(Overall Churn Summary)
SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn) AS Total_Churned_Customers,
    COUNT(*) - SUM(Churn) AS Total_Active_Customers,
    ROUND(SUM(Churn) * 100.0 / COUNT(*), 2) AS Overall_Churn_Rate
FROM customers;
