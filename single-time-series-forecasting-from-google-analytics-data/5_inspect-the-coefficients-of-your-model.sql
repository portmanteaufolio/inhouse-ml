#standardSQL
SELECT
 *
FROM
 ML.FORECAST(MODEL bqml_tutorial.ga_arima_model,
             STRUCT(30 AS horizon, 0.8 AS confidence_level))