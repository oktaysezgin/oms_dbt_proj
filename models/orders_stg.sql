{{config(materialized = 'incremental' , unique_key = 'OrderId')}}

SELECT
    OrderId
    , OrderDate
    , CustomerId
    , EmployeeId
    , StoreId
    , STATUS AS StatusCD
    , CASE
        WHEN STATUS = '01' THEN 'In Progress'
        WHEN STATUS = '02' THEN 'Completed'
        WHEN STATUS = '03' THEN 'Cancelled'
        ELSE NULL
      END AS StatusDesc
     , Updated_At 
     , current_timestamp as dbt_updated_at
FROM {{source('landing', 'orders')}}
{% if is_incremental() %}
WHERE Updated_At >= (SELECT MAX(dbt_updated_at) FROM {{this}})
{% endif %}
