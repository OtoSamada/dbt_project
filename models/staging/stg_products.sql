{{ config(schema='L2_PROCESSING', materialized='table') }}

select 
    PRODUCT_ID as product_id,
    NAME as product_name,
    PRICE as price,
    CITY as city
from 
    L1_LANDING.PRODUCTS