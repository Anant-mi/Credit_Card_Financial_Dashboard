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

## Project Structure & Workflow

Credit Card Financial Dashboard
│
├── 📊 Data Layer
│   └── PostgreSQL
│       ├── Database: ccdb
│       ├── Table: cc_detail   (transaction-level data)
│       └── Table: cust_detail (customer-level data)
│
├── 🔗 Connectivity
│   └── Npgsql Driver
│       └── Connects Power BI ↔ PostgreSQL
│
├── 🛠️ ETL / Data Preparation
│   └── Power Query
│       ├── Connected to PostgreSQL source
│       ├── Cleaned & shaped raw transaction/customer data
│       └── Merged tables for unified reporting model
│
├── 📐 Data Modeling
│   └── DAX (Data Analysis Expressions)
│       ├── Week-over-week revenue growth (%)
│       ├── Delinquency rate by occupation
│       ├── 30-day activation rate
│       └── Revenue, interest, and income aggregations
│
├── 📈 Visualization
│   └── Power BI Desktop
│       ├── Page 1: Weekly Trend & Risk Summary
│       │   ├── Revenue by card category
│       │   ├── WoW revenue table
│       │   ├── Monthly transaction trend
│       │   └── Delinquency by occupation
│       │
│       ├── Page 2: Transaction Report
│       │   ├── Revenue by card type, expense type, education
│       │   ├── Revenue by payment method (swipe/chip/online)
│       │   └── Quarterly revenue vs transaction count
│       │
│       └── Page 3: Customer Report
│           ├── Revenue by age, income, marital status
│           ├── Top 5 states by revenue
│           └── Gender-based revenue trends
│
└── 🎯 Key Deliverables
    ├── Interactive multi-page Power BI dashboard
    ├── Business insights (Blue card = 83% revenue, etc.)
    └── End-to-end BI workflow: DB → ETL → Model → Visualize
