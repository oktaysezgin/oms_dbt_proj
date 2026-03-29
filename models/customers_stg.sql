{{config(materialized='ephemeral')}}

SELECT
    CustomerId
    , FirstName
    , LastName
    , Email
    , Phone
    , Address
    , City
    , State
    , ZipCode
    , Updated_At
    , CONCAT(FIRSTNAME, ' ', LASTNAME) AS CustomerName
FROM {{source('landing', 'customers')}}