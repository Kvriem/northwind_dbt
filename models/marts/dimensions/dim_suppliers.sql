{{ 
    config(
        materialized='incremental',
        unique_key='supplier_id',
        indexes=[{"columns": ['supplier_id'], 'unique': True}]
    ) 
}}

    SELECT
        id as supplier_id,
        company as company_name,
        first_name,
        last_name,
        job_title,
        email_address,
        home_phone,
        md5(address || zip_postal_code ) as location_sk
    FROM 
        {{ref("stg_suppliers")}}
