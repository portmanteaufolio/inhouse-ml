-- EDA
-- Question: What are the minimum and maximum dates present in the dataset?
SELECT
  MIN(date) AS min_date,
  MAX(date) AS max_date
FROM
  `ai4f.AAPL10Y`;


-- Question: What's the average closing share price for each year?
SELECT
  EXTRACT(year FROM date) AS year,
  AVG(close) AS avg_close
FROM
  `ai4f.AAPL10Y`
GROUP BY
  year
ORDER BY
  year DESC;


-- Question: Which five dates correspond to the greatest percent increases in AAPL stock?
SELECT
  date,
  100.0 * close / LAG(close, 1) OVER(ORDER BY date) AS pct_close_change
FROM
  `ai4f.AAPL10Y`
ORDER BY
  pct_close_change DESC
LIMIT
  5;



-- Build a Linear Regression Model in BigQuery
-- model_data, this step is bqml equivalent of feature engineering 
CREATE OR REPLACE TABLE ai4f.model_data AS
WITH
  raw AS (
  SELECT
    date,
    close,
    LAG(close, 1) OVER(ORDER BY date) AS min_1_close,
    LAG(close, 2) OVER(ORDER BY date) AS min_2_close,
    LAG(close, 3) OVER(ORDER BY date) AS min_3_close,
    LAG(close, 4) OVER(ORDER BY date) AS min_4_close
  FROM
    `ai4f.AAPL10Y`
  ORDER BY
    date DESC ),
  raw_plus_trend AS (
  SELECT
    date,
    close,
    min_1_close,
    IF (min_1_close - min_2_close > 0, 1, -1) AS min_1_trend,
    IF (min_2_close - min_3_close > 0, 1, -1) AS min_2_trend,
    IF (min_3_close - min_4_close > 0, 1, -1) AS min_3_trend
  FROM
    raw ),
  ml_data AS (
  SELECT
    date,
    close,
    min_1_close AS day_prev_close,
    IF (min_1_trend + min_2_trend + min_3_trend > 0, 1, -1) AS trend_3_day
  FROM
    raw_plus_trend )
SELECT
  *
FROM
  ml_data;

-- create & train model
CREATE OR REPLACE MODEL `ai4f.aapl_model`
OPTIONS
  ( model_type='linear_reg',
    input_label_cols=['close'],
    data_split_method='seq',
    data_split_eval_fraction=0.3,
    data_split_col='date') AS
SELECT
  date,
  close,
  day_prev_close,
  trend_3_day
FROM
  `ai4f.model_data`;


-- Evaluate Regression Model Performance
SELECT * FROM ML.EVALUATE(MODEL `ai4f.aapl_model`);


-- Make Predictions Using Model
CREATE OR REPLACE TABLE ai4f.appl_predictions AS
SELECT
  *
FROM
  ml.PREDICT(MODEL `ai4f.aapl_model`,
    (
    SELECT
      *
    FROM
      `ai4f.model_data`
    WHERE
      date >= '2019-01-01') );