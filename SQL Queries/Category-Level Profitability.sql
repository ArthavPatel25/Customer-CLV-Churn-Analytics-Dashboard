CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.category_profit` AS
SELECT
  t.household_key,
  p.COMMODITY_DESC AS category,
  SUM(t.net_revenue) AS net_revenue,
  SUM(t.total_discount) AS discount_given,
  SUM(t.QUANTITY) AS units_purchased
FROM `customer-loyalty-profitability.dunnhumby_retail.transaction_profit` t
LEFT JOIN `customer-loyalty-profitability.dunnhumby_retail.products` p
ON t.PRODUCT_ID = p.PRODUCT_ID
GROUP BY household_key, category;
