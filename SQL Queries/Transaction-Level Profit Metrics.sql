CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.transaction_profit` AS
SELECT
  t.*,
  (SALES_VALUE + RETAIL_DISC + COUPON_DISC + COUPON_MATCH_DISC) AS gross_revenue,
  SALES_VALUE AS net_revenue,                   -- revenue after discounts
  (RETAIL_DISC + COUPON_DISC + COUPON_MATCH_DISC) AS total_discount
FROM `customer-loyalty-profitability.dunnhumby_retail.transactions_final` t;
