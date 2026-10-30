with Source as ( 
    select * 
    from 
        {{ source('saleslt','ProductCategory') }} 
)
select 
    ProductCategoryID as product_category_id,
    ParentProductCategoryID as parent_product_category_id,
    Name as category_name,
    ModifiedDate as modified_date
from 
   Source 