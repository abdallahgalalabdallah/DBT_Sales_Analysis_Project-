with Source as (
    select * 
    from {{ source('saleslt','SalesOrderDetail') }}
) 
select 
    SalesOrderID as sales_order_id,
    SalesOrderDetailID as sales_order_detail_id,
    OrderQty as order_quantity,
    ProductID as product_id,
    UnitPrice as unit_price,
    UnitPriceDiscount as unit_price_discount,
    LineTotal as line_total,
    ModifiedDate as modified_date
from 
    Source 