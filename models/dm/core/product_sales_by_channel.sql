{{ config(schema='L3_CONSUMPTION', materialized='table') }}

with product_channel_sales as (
    select
        p.product_id,
        p.product_name,
        ch.channel_name,
        sum(m.amount) as total_sales,
        sum(m.quantity) as total_quantity_sold
    from 
        L2_PROCESSING.STG_MAIN as m
    join 
        L2_PROCESSING.STG_PRODUCTS as p
    on 
        m.product_id = p.product_id
    join 
        L2_PROCESSING.STG_CHANNELS as ch
    on 
        m.channel_id = ch.channel_id
    group by
        p.product_id, 
        p.product_name, 
        ch.channel_name
)

select 
    product_id,
    product_name,
    channel_name as sales_channel,
    total_sales,
    total_quantity_sold
from 
    product_channel_sales