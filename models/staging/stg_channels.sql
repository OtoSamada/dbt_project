{{ config(schema='L2_PROCESSING', materialized='table') }}

select 
    CHANNEL_ID as channel_id,
    CHANNEL_NAME as channel_name
from 
    L1_LANDING.CHANNELS