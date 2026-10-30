with Source as 
(
    select *  
    from 
        {{ source('saleslt','Customer') }}
)
select 
    CustomerID as customer_id,
    NameStyle as name_style,
    Title as title,
    FirstName as first_name,
    MiddleName as middle_name,
    LastName as last_name,
    Suffix as suffix,
    CompanyName as company_name,
    SalesPerson as sales_person,
    EmailAddress as email_address,
    Phone as phone,
    ModifiedDate as modified_date
from 
    Source s