{{ config(
    materialized='table',
    pre_hook = [ log_start_time(this) ],
    post_hook = [ log_end_time(this) ]
) }}

SELECT
    CustomerName,
    Amount,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM {{ref('customer_orders')}}
