{{ config(
    materialized='table',
    post_hook=[
        "ALTER TABLE {{ this }} MODIFY COLUMN amount SET MASKING POLICY {{ this.schema }}.sensitive_amount_mask"
    ]
) }}


SELECT
    CustomerName,
    Amount,
    CASE WHEN amount > 500 THEN 'High' ELSE 'Normal' END AS order_category
FROM {{ref('customer_orders')}}
