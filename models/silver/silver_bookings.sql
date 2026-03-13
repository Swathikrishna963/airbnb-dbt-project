{{ config(
    materialized='incremental',
    unique_key='BOOKING_ID',
    schema='silver'
 )}}

select 
BOOKING_ID,
LISTING_ID,
BOOKING_DATE,
BOOKING_STATUS,
{{ multiply('BOOKING_AMOUNT', 'NIGHTS_BOOKED')}} + CLEANING_FEE + SERVICE_FEE as TOTAL_AMOUNT,
CREATED_AT
FROM 
{{ ref('bronze_bookings') }}

