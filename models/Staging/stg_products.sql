with Product as 
(
    select * 
    from {{ source('saleslt','Product') }}  
)

select 
    ProductID as product_id,
    Name as product_name,
    ProductNumber as product_number,
    coalesce(Color, 'N/A') as color,
    StandardCost as standard_cost,
    ListPrice as list_price,
    coalesce(Size, 'N/A') as size,
    coalesce(Weight, 0) as weight,
    ProductCategoryID as product_category_id,
    ProductModelID as product_model_id,
    SellStartDate as sell_start_date,
    SellEndDate as sell_end_date,
    DiscontinuedDate as discontinued_date,
    ModifiedDate as modified_date
from 
    Product