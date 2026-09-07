# Credit_Card_Financial_Dashboard
Power BI dashboard analyzing $389.6M in credit card transactions across 10K+ customers — covering revenue trends, delinquency risk, customer demographics, and spend behavior by card type, income group, and expense category. Built with PostgreSQL as the backend data source.

An interactive Power BI dashboard for analyzing credit card transaction data, 
built to surface revenue trends, customer risk profiles, and spending behavior.

## Overview
This project connects to a PostgreSQL database and transforms raw transaction 
data into three interactive report pages:
- **Transaction Report** – revenue by card category, expense type, education 
  level, job type, and use-chip method
- **Customer Report** – demographic breakdowns by age, income group, marital 
  status, dependents, and geography
- **Weekly Trend Analysis** – week-over-week revenue movement, delinquency 
  rates by occupation, and activation tracking

## Key Metrics
- Total Revenue: $389.6M
- Total Interest Earned: $55.2M
- Transaction Amount: $313.7M
- Transaction Count: 4.6M

## Tech Stack
- **Data Source:** PostgreSQL
- **ETL/Transformation:** Power Query
- **Visualization:** Power BI Desktop
- **Modeling:** DAX measures for revenue, WoW growth, and delinquency rates

## Insights Surfaced
- Blue card category drives ~83% of total revenue
- Businessman segment has the highest average income and revenue contribution
- Delinquency is concentrated in self-employed and blue-collar segments
- Bills and Entertainment are the top two expense categories by revenue
