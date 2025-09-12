{{
    config(
        MATERIALIZED = 'incremental',
        unique_key = 'location_sk',
        INDEX = 'location_sk'
    )
}}

select 
    md5(ship_address || ship_zip_postal_code)location_sk,
    ship_address as address,
    ship_city as city,
    ship_state_province as state_province,
    ship_zip_postal_code as zip_postal_code 
from {{ ref('stg_orders') }}
where 
    ship_address is not null and
    ship_zip_postal_code is not null 


    