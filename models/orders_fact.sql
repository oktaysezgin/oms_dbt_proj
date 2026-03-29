{{config(materialized='table')}}

SELECT
    o.OrderId
    , o.OrderDate
    , o.CustomerId
    , o.EmployeeId
    , o.StoreId
    , o.StatusCD
    , o.StatusDesc
    , o.Updated_At
    , COUNT(DISTINCT o.OrderId) AS OrderCount
    , SUM(oi.TotalPrice) AS Revenue
FROM {{ref('orders_stg')}} o
JOIN {{ref('order_items_stg')}} oi ON o.OrderId = oi.OrderId
GROUP BY
    o.OrderId
    , o.OrderDate
    , o.CustomerId
    , o.EmployeeId
    , o.StoreId
    , o.StatusCD
    , o.StatusDesc
    , o.Updated_At