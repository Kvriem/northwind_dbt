{{
    config(
        materialized='incremental',
        strategy='append',
        unique_key='product_id',
        indexes=[
            {"columns": ['product_id'], 'unique': false},
            {"columns": ['product_SK'], 'unique': false}
        ],
        on_schema_change="ignore"
    )
}}

with product_data as (
    select
        product_id, 
        product_name::varchar(50),
        supplier_id::varchar(50),
        category_id::varchar(50),
        quantity_per_unit::varchar(20),
        unit_price::real,
        reorder_level::int,
        discontinued::int,
        dbt_valid_from::timestamp,
        dbt_valid_to::timestamp,
        'northwind_db' as data_source 
    from {{ ref('cdc_product') }}
),
clean_product as (
    select 
        * 
    from product_data
    where
        product_name is not null 
    AND
        supplier_id is not null
    and 
        category_id is not null
    and
       unit_price > 0
    and 
        unit_price is not null 
)

select 
    md5(product_name || data_source) as product_SK,
    *
from clean_product