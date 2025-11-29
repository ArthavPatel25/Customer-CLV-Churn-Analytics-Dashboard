CREATE OR REPLACE TABLE `customer-loyalty-profitability.dunnhumby_retail.churn_features` AS
WITH recent AS (
  SELECT
    household_key,
    SUM(weekly_visits) AS recent_visits,
    SUM(weekly_spend) AS recent_spend,
    SUM(unique_products) AS recent_variety
  FROM `customer-loyalty-profitability.dunnhumby_retail.weekly_metrics`
  WHERE wk BETWEEN 40 AND 47
  GROUP BY household_key
),
previous AS (
  SELECT
    household_key,
    SUM(weekly_visits) AS previous_visits,
    SUM(weekly_spend) AS previous_spend,
    SUM(unique_products) AS previous_variety
  FROM `customer-loyalty-profitability.dunnhumby_retail.weekly_metrics`
  WHERE wk BETWEEN 32 AND 39
  GROUP BY household_key
)
SELECT
  r.household_key,
  r.recent_visits,
  p.previous_visits,
  SAFE_DIVIDE(r.recent_visits - p.previous_visits, p.previous_visits) AS visit_decay_ratio,

  r.recent_spend,
  p.previous_spend,
  SAFE_DIVIDE(r.recent_spend - p.previous_spend, p.previous_spend) AS spend_decay_ratio,

  r.recent_variety,
  p.previous_variety,
  SAFE_DIVIDE(r.recent_variety - p.previous_variety, p.previous_variety) AS variety_decay_ratio
FROM recent r
LEFT JOIN previous p ON r.household_key = p.household_key;
