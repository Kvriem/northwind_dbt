with source as (

    select * from {{ source('northwind', 'orders') }}
)
select 
    *,
    md5(ship_address || ship_zip_postal_code) as location_sk,
    current_timestamp as ingestion_timestamp
from source