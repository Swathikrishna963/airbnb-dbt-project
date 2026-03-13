{{ config(materialized= 'ephemeral')}}

with bookings as 
(
    select 
    BOOKING_ID,
    BOOKING_STATUS,
    CREATED_AT
    FROM {{ ref('gold_table') }}
)
select * from bookings