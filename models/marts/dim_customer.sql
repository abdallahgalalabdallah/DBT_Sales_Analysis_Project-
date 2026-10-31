with Customer as ( 
    select * from {{ ref('stg_customers') }}
) 
select distinct 
    cast (customer_id as int) as customer_id,
    concat(coalesce(first_name, ''), ' ', coalesce(last_name, '')) as customer_name,
    company_name,
    email_address
from 
    Customer 