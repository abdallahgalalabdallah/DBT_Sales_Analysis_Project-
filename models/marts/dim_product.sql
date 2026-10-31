with Product as 
( 
    select * from {{ref("stg_products")}}
)
select 
    cast(product_id as int ) as product_id, 
    product_name , 
    product_number , 
    product_category_id , 
    list_price
from Product


