with Source as ( 
    select * 
    From {{ source('saleslt','SalesOrderHeader') }}
) 
select 
    SalesOrderID as sales_order_id,
    RevisionNumber as revision_number,
    OrderDate as order_date,
    DueDate as due_date,
    ShipDate as ship_date,
    Status as order_status,
    OnlineOrderFlag as online_order_flag,
    SalesOrderNumber as sales_order_number,
    CustomerID as customer_id,
    ShipToAddressID as ship_to_address_id,
    BillToAddressID as bill_to_address_id,
    ShipMethod as ship_method,
    SubTotal as sub_total,
    TaxAmt as tax_amount,
    Freight as freight,
    TotalDue as total_due,
    ModifiedDate as modified_date
from 
    Source 