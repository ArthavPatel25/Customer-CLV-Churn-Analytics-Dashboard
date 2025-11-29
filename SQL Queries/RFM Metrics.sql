CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.rfm_raw` AS
SELECT
  household_key,
  MAX(real_date) AS last_purchase_date,
  DATE_DIFF(DATE '2014-01-01', MAX(real_date), DAY) AS recency,
  COUNT(DISTINCT BASKET_ID) AS frequency,
  SUM(SALES_VALUE) AS monetary
FROM `customer-loyalty-profitability.dunnhumby_retail.transactions_final`
GROUP BY household_key;
