CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.rfm_final` AS
SELECT
  *,
  CASE
    WHEN recency <= 60 AND frequency >= 10 AND monetary >= 100 THEN 'Platinum'
    WHEN recency <= 120 AND frequency >= 6 THEN 'Gold'
    WHEN recency <= 180 AND frequency >= 3 THEN 'Silver'
    WHEN recency <= 365 THEN 'Bronze'
    ELSE 'Churned'
  END AS rfm_segment
FROM `customer-loyalty-profitability.dunnhumby_retail.rfm_raw`;
