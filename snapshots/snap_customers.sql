{% snapshot snap_customers %} 

{{
    config(
        target_schema='dbo' , 
        unique_key='CustomerID' ,
        strategy='timestamp' ,
        updated_at='ModifiedDate',
        invalidate_hard_deletes=True 
    )
}} 


with Source as 
( 
    select * 
    from {{source('saleslt','Customer')}}
) 
select 
    cast(CustomerID as int) as CustomerID,
    FirstName,
    LastName,
    CompanyName,
    EmailAddress,
    Phone,
    ModifiedDate
from Source  


{% endsnapshot %}