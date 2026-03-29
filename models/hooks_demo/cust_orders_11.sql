SELECT
    CustomerName,
    Amount,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM {{ref('customer_orders')}}

