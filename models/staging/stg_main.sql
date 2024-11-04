{{ config(schema='L2_PROCESSING', materialized='table') }}

select 
    TRANSACTION_ID as transaction_id,
    CUSTOMER_ID as customer_id,
    PRODUCT_ID as product_id,
    AMOUNT as amount,
    QTY as quantity,
    CHANNEL_ID as channel_id,
    BOUGHT_DATE as bought_date
from 
    L1_LANDING.MAIN