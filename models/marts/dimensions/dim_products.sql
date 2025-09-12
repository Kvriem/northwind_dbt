{{
    config(
        materialized='table',
        schema='dwh'
    )
}}

with base as (
    select * from {{ ref('stg_products') }} where dbt_valid_to is null
),
final as (
    select
        product_sk,
        product_id,
        product_name,
        supplier_id,
        category_id,
        quantity_per_unit,
        unit_price,
        reorder_level,
        discontinued,
        data_source,
        dbt_valid_from as effective_from,
        dbt_valid_to   as effective_to,
        current_timestamp as dim_loaded_at
    from base
)
select * from final