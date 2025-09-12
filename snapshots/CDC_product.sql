{% snapshot cdc_product %}

{{
    config(
        target_schema='snapshot',
        unique_key='product_id',
        strategy='check',
        check_cols=[
            'product_name',
            'supplier_id',
            'category_id',
            'quantity_per_unit',
            'unit_price',
            'discontinued'
        ]
    )
}}

select
    id as product_id,
    product_name as product_name,
    supplier_ids as supplier_id,
    category as category_id,
    quantity_per_unit as quantity_per_unit,
    list_price as unit_price,
    reorder_level as reorder_level,
    discontinued as discontinued
from {{ source('northwind', 'products') }}

{% endsnapshot %}