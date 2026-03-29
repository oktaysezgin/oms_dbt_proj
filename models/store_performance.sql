SELECT
    os.StoreId
    , SUM(ofact.Revenue) AS ActualSales
    , SUM(st.salestarget) AS TargetSales
FROM {{ref('orders_stg')}} os
JOIN {{ref('orders_fact')}} ofact on os.OrderId = ofact.OrderId
JOIN {{ref('sales_targets')}} st on os.StoreId = st.StoreId
GROUP BY
    os.StoreId