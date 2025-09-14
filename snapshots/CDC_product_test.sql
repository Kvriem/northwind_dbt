{% snapshot cdc_product_test %}

    {{
        config(
          target_schema='snapshot',
          unique_key='product_id',
          strategy='check',
          check_cols=['product_name']
        )
    }}

    select
        product_id::int as product_id,
        product_name::varchar(50) as product_name
    from {{ source('northwind', 'products') }}

{% endsnapshot %}
