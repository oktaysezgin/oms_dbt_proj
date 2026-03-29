SELECT
    OrderItemId
    , OrderId
    , ProductId
    , Quantity
    , UnitPrice
    , Quantity * UnitPrice AS TotalPrice
    , Updated_At
FROM {{source('landing', 'orderitems')}}