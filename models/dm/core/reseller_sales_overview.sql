{{ config(schema='L3_CONSUMPTION', materialized='table') }}

with reseller_sales as (
    select
        r.reseller_id,
        r.reseller_name,
        sum(rt.total_amount) as total_sales,
        sum(rt.total_amount * (r.commission_pct / 100)) as total_commission_earned
    from 
        L2_PROCESSING.STG_RESELLERS as r
    join 
        L2_PROCESSING.STG_RESELLERSTYPE1 as rt
    on 
        r.reseller_id = rt.reseller_id
    group by
        r.reseller_id, 
        r.reseller_name
)

select 
    reseller_id,
    reseller_name,
    total_sales,
    total_commission_earned
from 
    reseller_sales