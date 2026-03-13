{{ config(
    materialized='incremental',
    unique_key='LISTING_ID',
    schema='silver'
 )}}

 SELECT 
 LISTING_ID,
 HOST_ID,
 CITY,
 COUNTRY,
 ACCOMMODATES,
 BEDROOMS,
 BATHROOMS,
 CREATED_AT,
 PRICE_PER_NIGHT,
 {{ tag('PRICE_PER_NIGHT')}} as PRICE_PER_NIGHT_TAG
FROM {{ ref('bronze_listings') }}
