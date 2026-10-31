select  
    sales_order_detail_id,
    net_sales
from 
    {{ ref("fact_sales") }} 
where 
    net_sales < 0