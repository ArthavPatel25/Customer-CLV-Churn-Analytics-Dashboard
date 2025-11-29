CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.customer_profit` AS
SELECT
  household_key,
  
  SUM(gross_revenue) AS total_gross_revenue,
  SUM(net_revenue) AS total_net_revenue,
  SUM(total_discount) AS total_discount_given,
  
  SAFE_DIVIDE(SUM(net_revenue), COUNT(DISTINCT BASKET_ID)) AS profit_per_visit,
  COUNT(DISTINCT BASKET_ID) AS total_visits,
  SUM(QUANTITY) AS total_units
FROM `customer-loyalty-profitability.dunnhumby_retail.transaction_profit`
GROUP BY household_key;
