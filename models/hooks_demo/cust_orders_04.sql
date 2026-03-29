{{ config(
    materialized='table',
    pre_hook=[
        "INSERT INTO audit.model_runs (model_name, run_type, run_timestamp) VALUES ('{{ this }}', 'start', CURRENT_TIMESTAMP)"
    ],
    post_hook=[
        "INSERT INTO audit.model_runs (model_name, run_type, run_timestamp) VALUES ('{{ this }}', 'end', CURRENT_TIMESTAMP)"
    ]
) }}

SELECT
    CustomerName,
    Amount,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM {{ref('customer_orders')}}
