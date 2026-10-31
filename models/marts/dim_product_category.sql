with ProuctCat as 
( 
    select * from {{ ref('stg_product_categories') }}
)  
, SeedMapping as 
( 
    select * from {{ ref('product_category_mapping') }}
)
select 
    cast(p.product_category_id as int ) product_category_id , 
    Category_name , 
    parent_product_category_id , 
   coalesce ( s.business_category,'Others') as business_category 
from ProuctCat p 
left join SeedMapping s 
    on p.product_category_id = s.product_category_id 




