{{ config(schema='L3_CONSUMPTION', materialized='table') }}

with customer_transactions as (
    select
        t.Customer_ID,
        c.Customer_Name,
        sum(t.Amount) as total_spent,
        sum(t.Quantity) as total_quantity
    from 
        L2_PROCESSING.STG_MAIN as t
    join 
        L2_PROCESSING.STG_CUSTOMERS as c
    on 
        t.Customer_ID = c.Customer_ID
    group by
        t.Customer_ID, 
        c.Customer_Name
)

select 
    Customer_ID,
    Customer_Name,
    total_spent,
    total_quantity
from 
    customer_transactions