{{ config(materialized='view') }}

select *
from {{ source('LANDING', 'TRIP_BOOKINGS') }}
