{{ config(schema='L2_PROCESSING', materialized='table') }}

select 
    RESELLER_ID as reseller_id,
    RESELLER_NAME as reseller_name,
    COMMISSION_PCT as commission_pct
from 
    L1_LANDING.RESELLERS