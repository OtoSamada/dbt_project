{{ config(schema='L2_PROCESSING', materialized='table') }}

select 
    PRODUCT_NAME as product_name,
    QUANTITY as quantity,
    TOTAL_AMOUNT as total_amount,
    SALES_CHANNEL as sales_channel,
    CUSTOMER_FIRST_NAME as customer_first_name,
    CUSTOMER_LAST_NAME as customer_last_name,
    CUSTOMER_EMAIL as customer_email,
    SERIES_CITY as series_city,
    CREATED_DATE as created_date,
    RESELLER_ID as reseller_id,
    TRANSACTION_ID as transaction_id
from 
    L1_LANDING.RESELLERS_TYPE1