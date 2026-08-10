DROP TABLE IF EXISTS telco_churn;

CREATE TABLE telco_churn (
    customerID VARCHAR(20),
    gender VARCHAR(20),
    SeniorCitizen INTEGER,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INTEGER,
    PhoneService VARCHAR(20),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges NUMERIC(10,2),
    TotalCharges VARCHAR(30),
    Churn VARCHAR(10)
);


SELECT *
FROM telco_churn;


SELECT COUNT(*) AS total_customers
FROM telco_churn;


SELECT COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn = 'Yes';


SELECT gender, COUNT(*) AS customers
FROM telco_churn
GROUP BY gender;


SELECT Contract, COUNT(*) AS customers
FROM telco_churn
GROUP BY Contract
ORDER BY customers DESC;


SELECT Contract, COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY churned_customers DESC;


SELECT
    Contract,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM telco_churn
GROUP BY Contract
ORDER BY avg_monthly_charges DESC;



SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS average_tenure
FROM telco_churn
GROUP BY Churn;



SELECT
    InternetService,
    COUNT(*) AS customers
FROM telco_churn
GROUP BY InternetService
ORDER BY customers DESC;


SELECT
    InternetService,
    COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY churned_customers DESC;


SELECT
    customerID,
    Contract,
    MonthlyCharges,
    Churn
FROM telco_churn
WHERE MonthlyCharges > 70
ORDER BY MonthlyCharges DESC;


SELECT
    customerID,
    tenure,
    Contract,
    MonthlyCharges,
    Churn
FROM telco_churn
WHERE tenure < 12
AND Churn = 'Yes'
ORDER BY tenure;


SELECT
    PaymentMethod,
    COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;


SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM telco_churn
GROUP BY Churn;


SELECT
    customerID,
    tenure,
    MonthlyCharges,
    TotalCharges,
    Churn
FROM telco_churn
WHERE CAST(TotalCharges AS NUMERIC) > 5000
ORDER BY CAST(TotalCharges AS NUMERIC) DESC;


SELECT
    customerID,
    MonthlyCharges,
    Contract,
    Churn
FROM telco_churn
WHERE MonthlyCharges > (
    SELECT AVG(MonthlyCharges)
    FROM telco_churn
)
ORDER BY MonthlyCharges DESC;


SELECT
    customerID,
    tenure,
    Contract,
    Churn
FROM telco_churn
WHERE tenure > (
    SELECT AVG(tenure)
    FROM telco_churn
)
ORDER BY tenure DESC;