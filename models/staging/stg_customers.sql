{{ config(schema='L2_PROCESSING', materialized='table') }}

select
    CUSTOMER_ID as customer_id,
    FIRST_NAME as first_name,
    LAST_NAME as last_name,
    EMAIL as email,
    concat(FIRST_NAME, ' ', LAST_NAME) as customer_name
from 
    L1_LANDING.CUSTOMERS