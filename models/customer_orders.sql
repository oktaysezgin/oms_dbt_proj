WITH customer_order
AS
(
    SELECT
        CONCAT(c.firstname , ' ', c.lastname) AS CustomerName
        , COUNT(o.orderid) AS Amount
    FROM {{source('landing', 'customers')}} c 
    JOIN {{source('landing', 'orders')}}  o ON c.customerId = o.customerId
    GROUP BY CustomerName

)
SELECT * FROM customer_order

