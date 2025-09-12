{{
    config(
        MATERIALIZED ='incermental',
        unique_key = 'employee_id'

    )
}}

select 
    id as employee_id,
    first_name,
    last_name,
    company as company_name,
    email_address,
    job_title,
    business_phone,
    home_phone,
    state_province,
    md5(address || zip_postal_code) as location_sk
from {{ ref('stg_employees') }}

