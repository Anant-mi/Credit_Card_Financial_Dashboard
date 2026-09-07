-- SQL Query to create and import data from csv files:

-- 0. Create a database 
CREATE DATABASE ccdb;

-- 1. Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


-- 2. Create cc_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 3. Copy csv data into SQL (remember to update the file name and file location in below query)

-- copy cc_detail table

COPY cc_detail
FROM 'D:\credit_card.csv' 
DELIMITER ',' 
CSV HEADER;


-- copy cust_detail table

COPY cust_detail
FROM 'D:\customer.csv' 
DELIMITER ',' 
CSV HEADER;



-- If you are getting below error, then use the below point:  
   -- ERROR:  date/time field value out of range: "0"
   -- HINT:  Perhaps you need a different "datestyle" setting.

-- Check the Data in Your CSV File: Ensure date column values are formatted correctly and are in a valid format that PostgreSQL can recognize (e.g., YYYY-MM-DD). And correct any incorrect or missing date values in the CSV file. 
   -- or
-- Update the Datestyle Setting: Set the datestyle explicitly for your session using the following command:
SET datestyle TO 'ISO, DMY';

-- Now, try to COPY the csv files!


-- 4. Insert additional data into SQL, using same COPY function

-- copy additional data (week-53) in cc_detail table

COPY cc_detail
FROM 'D:\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;


-- copy additional data (week-53) in cust_detail table (remember to update the file name and file location in below query)

COPY cust_detail
FROM 'D:\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;




----------------------------------------------------------------------------------------------------------------------------------------

MY ANALYSIS. (CCDB Report Analysis Project)





TO sort out Ages in groups in cust_detail in powerBI

AgeGroup = SWITCH(TRUE(),'public cust_detail'[customer_age] < 30,"20-30",'public cust_detail'[customer_age] >=30 && 'public cust_detail'[customer_age] < 40,"30-40",
'public cust_detail'[customer_age] >=40 && 'public cust_detail'[customer_age] < 50,"40-50",
'public cust_detail'[customer_age] >=50 && 'public cust_detail'[customer_age] < 60,"50-60",
'public cust_detail'[customer_age] >=60, "60+",
"unknown"
)


TO sort out on Basis of income in cust_detail in powerBI

IncomeGroup = Switch(True(),'public cust_detail'[income] <35000, "Low",
'public cust_detail'[income] >=35000 && 'public cust_detail'[income] <70000, "Med",
'public cust_detail'[income] >=70000, "High",
"unknown")


To Add a new Revenue column in cc_detail Table 
Revenue = 'public cc_detail'[annual_fees] + 'public cc_detail'[total_trans_amt] + 'public cc_detail'[interest_earned]


Add a new Week_num2 to cc_detail table to sort weeks in order
week_num2 = WEEKNUM('public cc_detail'[week_start_date])



To calculate Current_week_Revenue
Current_week_Revenue = CALCULATE(SUM('public cc_detail'[Revenue]),FILTER(ALL('public cc_detail'),'public cc_detail'[week_num2]=MAX('public cc_detail'[week_num2])))

To calculate Previous_week_Revenue
Previous_week_Revenue = CALCULATE(SUM('public cc_detail'[Revenue]),FILTER(ALL('public cc_detail'),'public cc_detail'[week_num2]=MAX('public cc_detail'[week_num2])-1))


To calulate wow_Revenue (Week over Week)
wow_revenue = DIVIDE(([Current_week_Revenue]-[Previous_week_Revenue]),[Previous_week_Revenue])

