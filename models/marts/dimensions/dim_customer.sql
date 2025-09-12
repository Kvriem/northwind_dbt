{{
    config (
        MATERIALIZED = 'incremental',
        strategy = 'merge',
        unique_key = 'id',
        INDEX = {"columns" :['id'], 'unique': true},
        target_schema = 'dwh'
        )
    
}}

with valid_customers as (
    select 
        DISTINCT id as customer_id,
        first_name ,
        last_name ,
        company as company_name ,
        job_title ,
        md5(address || zip_postal_code) as location_sk,
        ingestion_timestamp 
    from {{ ref('stg_customer') }}
    where 
        first_name is not null 

)

select * from valid_customers 