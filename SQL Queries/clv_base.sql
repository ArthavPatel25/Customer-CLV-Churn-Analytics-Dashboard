CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.clv_base` AS
WITH customer_orders AS (
  SELECT
    household_key,
    MIN(real_date) AS first_purchase_date,
    MAX(real_date) AS last_purchase_date,
    COUNT(DISTINCT BASKET_ID) AS tx_count,
    SUM(SALES_VALUE) AS total_spend
  FROM `customer-loyalty-profitability.dunnhumby_retail.transactions_final`
  GROUP BY household_key
),
per_order AS (
  SELECT
    household_key,
    BASKET_ID,
    SUM(SALES_VALUE) AS order_value
  FROM `customer-loyalty-profitability.dunnhumby_retail.transactions_final`
  GROUP BY household_key, BASKET_ID
),
monetary AS (
  SELECT
    household_key,
    AVG(order_value) AS monetary_value
  FROM per_order
  GROUP BY household_key
)
SELECT
  c.household_key,
  -- frequency = number of repeat transactions
  GREATEST(c.tx_count - 1, 0) AS frequency,
  -- recency = days between first and last purchase
  DATE_DIFF(c.last_purchase_date, c.first_purchase_date, DAY) AS recency,
  -- T = days between first purchase and end of calibration window
  DATE_DIFF(DATE '2014-01-01', c.first_purchase_date, DAY) AS T,
  -- avg monetary value
  m.monetary_value
FROM customer_orders c
LEFT JOIN monetary m USING (household_key);
