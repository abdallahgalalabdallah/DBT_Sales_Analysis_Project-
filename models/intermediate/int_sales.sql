with Header as  ( 
    select * 
    From  {{ ref('stg_sales_order_headers') }}
) 
, Details as 
( 
    select * 
    from {{ ref('stg_sales_order_details') }}
) 
, Customer as  
(
    select *
    from {{ ref('stg_sales_order_headers') }}
) 
,Product as 
( 
    select * 
    from {{ ref('stg_products') }}
)
, Joins as 
( 
    select 
        d.sales_order_id,
        d.sales_order_detail_id,
        h.customer_id,
        d.product_id,
        h.order_date,
        h.modified_date,
        d.order_quantity,
        d.unit_price,
        d.unit_price_discount,
        d.line_total, 
        (d.order_quantity * d.unit_price) as gross_sales,
        ((d.order_quantity * d.unit_price) * d.unit_price_discount) as discount_amount, 
        {{ calculate_net_sales('d.order_quantity' ,'d.unit_price' , 'd.unit_price_discount') }} as net_sales 
    from 
        Header h
    join Details d 
    on d.sales_order_id=h.sales_order_id 
    join Product p 
        on p.product_id =d.product_id 
    join Customer c 
        on c.customer_id =h.customer_id 
    where d.order_quantity >  0 
    and d.unit_price >= 0 
) 
select * 
from Joins 