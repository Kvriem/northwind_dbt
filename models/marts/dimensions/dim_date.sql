{{
    config(
        MATERIALIZED = 'incremental',
        unique_key = 'date_sk',
        on_schema_change = 'append_new_columns'
    )
}}

with date_range as(
    select 
        min("order_date") as min_order,
        max("order_date") as max_order
    from {{ ref('stg_orders') }}
),
date_series as(
    select generate_series(
        (select min_order from date_range),
        (select max_order from date_range),
        '1 day' ::INTERVAL
    )::date as full_date
)

select 
    md5(full_date::text) as date_sk,
    full_date,
    extract(year from full_date ) as year ,
    extract(MONTH from full_date ) as month,
    extract(day from full_date ) as day,
    to_char(full_date, 'Day') as day_name
from date_series 

{% if is_incremental() %}
    where full_date > (select max(full_date) from {{this}})
{% endif %}