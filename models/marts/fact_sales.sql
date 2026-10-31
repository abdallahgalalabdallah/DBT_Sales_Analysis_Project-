{{ config(
    materialized='incremental',
    unique_key='sales_order_detail_id',
    incremental_strategy='delete+insert'
) }}

with sales_intermediate as (
    select * from {{ ref('int_sales') }}
)

select
    sales_order_detail_id,
    sales_order_id,
    customer_id,
    product_id,
    cast(format(order_date, 'yyyyMMdd') as int) as date_key,
    order_quantity,
    unit_price,
    unit_price_discount,
    gross_sales,
    discount_amount,
    net_sales,
    modified_date
from sales_intermediate

{% if is_incremental() %}
    where modified_date > (select max(modified_date) from {{ this }})
{% endif %}