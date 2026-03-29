{{config(materialized='table')}}

SELECT
    os.CustomerId
    , c.CustomerName
    , SUM(os.OrderCount) AS OrderCount
    , SUM(os.Revenue) AS Revenue
FROM {{ref('orders_fact')}} os
JOIN {{ref('customers_stg')}} c ON os.CustomerId = c.CustomerId
GROUP BY
    os.CustomerId
    , c.CustomerName