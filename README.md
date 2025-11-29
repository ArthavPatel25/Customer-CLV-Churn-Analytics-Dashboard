Customer CLV & Churn Analytics Dashboard
BigQuery + Looker Studio | dunnhumby Retail Dataset

An end-to-end customer analytics pipeline that transforms raw retail transactions into actionable retention insights. Built on the dunnhumby dataset from Kaggle, this project demonstrates SQL-based feature engineering, predictive segmentation, and dashboard design for marketing and revenue optimization.

🚀 Live Dashboard
🔗 View Dashboard https://lookerstudio.google.com/reporting/f2f2092d-62b2-4d73-afc6-e1a6e61c12e7

📦 Dataset
Source: dunnhumby Retail Dataset (Kaggle)](https://www.kaggle.com/))

This dataset includes:

Transaction records
Household-level identifiers
Purchase behavior data
Product catalog
Basket-level metadata
All data was cleaned, loaded into Google Cloud Storage, and modeled in BigQuery for scalable SQL-based analytics.

🗂️ Pipeline Architecture
1. Data Ingestion & Preprocessing
Process:

Uploaded raw CSVs from Kaggle to Google Cloud Storage
Loaded data into BigQuery staging tables
Cleaned missing values and standardized datatypes (dates, prices, spend)
Joined tables on household_key and trip-level granularity
Output: Clean, normalized fact and dimension tables ready for transformation.

2. SQL Feature Engineering (BigQuery)
All analytics logic was built directly in SQL using CASE statements, aggregations, and window functions.

🔹 Customer Lifetime Value (CLV)
Aggregated historical spend per household
Computed 6-month predicted revenue
Segmented customers into quantile-based tiers
Created CLV ranges:
0–100
100–300
300–700
700+
🔹 Churn Probability Scoring
Feature engineered churn indicators:

Engagement recency
Purchase frequency
Total monetary value
Predicted spend decline
Inactivity periods
Churn Risk Bands:

High Risk: > 0.66
Medium Risk: 0.33–0.66
Low Risk: < 0.33
🔹 RFM Segmentation
Custom CASE-based logic for:

Recency ranges (days since last purchase)
Frequency buckets (transaction count)
Monetary bands (total spend tiers)
All segments stored as computed fields for real-time dashboard consumption.

3. Looker Studio Dashboard
Interactive, multi-page dashboard connected live to BigQuery.

Executive KPIs
Total Customers
Average CLV
Total Predicted Revenue
Total Transactions
Total Monetary Value
Average Churn Risk
Distribution Analysis
CLV Distribution (bar)
Frequency Distribution (histogram)
Recency Distribution (histogram)
Monetary Value Distribution (histogram)
Advanced Insights
Churn vs CLV Scatter Plot — Visualizes risk boundaries and outliers
Churn Segment Breakdown — Donut chart showing customer concentration
Customer Value & Churn Table — Conditional formatting highlights retention priorities
Updates dynamically via BigQuery's native Looker Studio connector.

🔍 Key Findings - 
High churn risk clusters in low-recency, low-frequency households | Target win-back campaigns for inactive customers | | Mid-value customers dominate CLV distribution | Largest opportunity for upsell and cross-sell | | Several high-CLV households show elevated churn probability | Immediate retention action required | | Spending is concentrated among a small loyal group | Loyalty program expansion opportunity |

🧰 Tech Stack - 
 Google BigQuery | SQL modeling, feature engineering, aggregations | | Looker Studio | BI dashboards and interactive visualization | | Google Cloud Storage | Dataset ingestion and storage | | Kaggle (dunnhumby) | Transactional retail dataset | | SQL | CASE logic, window functions, segmentation |

🎯 Business Applications
Marketing:

Identify at-risk, high-value customers for retention campaigns
Build targeted offers based on RFM segments
Product:

Understand purchase behavior and basket patterns
Optimize inventory for high-frequency buyers
Finance:

Forecast revenue using CLV predictions
Model customer profitability by tier
Leadership:

Monitor customer health KPIs in real time
Track retention performance across segments
