{{
    config(
        materialized = 'incremental',
        unique_key = 'transaction_id',
        indexes = [
            {'columns': ['transaction_id'], 'unique': true}
        ]
    )
}}

with source as (
    select 
        id as order_id,
        e.employee_id,
        c.customer_id,
        d.date_sk,
        sd.date_sk as ship_date_sk,
        shipper_id,
        ship_name,
        l.location_sk as ship_location_sk,
        shipping_fee,
        taxes,
        payment_type,
        paid_date,
        tax_rate,
        status_id
    from {{ ref('stg_orders') }} o
    left join {{ ref('dim_employee') }} e
    on e.employee_id = o.employee_id
    left join {{ ref('dim_customer') }} c
    on c.customer_id = o.customer_id
    left join {{ ref('dim_date') }} d
    on d.full_date = o.order_date
    left join {{ ref('dim_date') }} sd
    on sd.full_date = o.shipped_date
    left join {{ ref('dim_location') }} l
    on l.location_sk = o.location_sk
),
order_details as (
    select 
        od.order_id,
        p.product_sk,   
        od.quantity,
        od.unit_price,
        od.discount,
        od.status_id,
        od.date_allocated,
        od.purchase_order_id,
        od.inventory_id
    from {{ ref('stg_order_details') }} od
    left join {{ ref('stg_products') }} p
        on p.product_id = od.product_id
),
fact_orders as (
   select
    md5(s.order_id || od.product_sk) as transaction_id,
    s.*,
    od.product_sk,
    od.quantity,
    od.unit_price,
    od.discount,
    od.date_allocated,
    od.purchase_order_id,
    od.inventory_id
    from source s
    left join order_details od
    on s.order_id = od.order_id
    where od.order_id is not null
)
select distinct * from fact_orders
where  transaction_id is not null

