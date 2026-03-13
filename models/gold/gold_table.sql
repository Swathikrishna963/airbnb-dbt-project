{% set configs = [
    { 
        "table":  "AIRBNB.SILVER.SILVER_BOOKINGS",
    
        "columns": "SILVER_BOOKINGS.*",
        "alias": "SILVER_BOOKINGS"
    },
    { 
        "table":  "AIRBNB.SILVER.SILVER_LISTINGS",
        "columns": "SILVER_LISTINGS.HOST_ID, SILVER_LISTINGS.COUNTRY, SILVER_LISTINGS.CITY,
                    SILVER_LISTINGS.ACCOMMODATES, SILVER_LISTINGS.BEDROOMS, SILVER_LISTINGS.BATHROOMS,
                    SILVER_LISTINGS.PRICE_PER_NIGHT, SILVER_LISTINGS.PRICE_PER_NIGHT_TAG, 
                    SILVER_LISTINGS.CREATED_AT AS LISTINGS_CREATED_AT",
        "alias": "SILVER_LISTINGS",
        "join_condition": "SILVER_BOOKINGS.LISTING_ID = SILVER_LISTINGS.LISTING_ID" 
    },
    { 
        "table":  "AIRBNB.SILVER.SILVER_HOSTS",
        "columns": "SILVER_HOSTS.HOST_NAME, SILVER_HOSTS.HOST_SINCE, 
                    SILVER_HOSTS.IS_SUPERHOST, SILVER_HOSTS.CREATED_AT AS HOST_CREATED_AT, SILVER_HOSTS.RESPONSE_RATE_QUALITY ",
        "alias": "SILVER_HOSTS",
        "join_condition": "SILVER_LISTINGS.HOST_ID = SILVER_HOSTS.HOST_ID"        
    }
] %}

SELECT 
{% for config in configs %}
    {{ config['columns']}} {% if not loop.last %} , 
    {% endif %}
{% endfor %}

FROM 

{% for config in configs %}
{% if loop.first %}{{ config['table']}} as {{config['alias']}}
{% else %}
left join 
{{ config['table']}} as {{ config['alias']}} on {{ config['join_condition']}}
{% endif %}
{% endfor %}



