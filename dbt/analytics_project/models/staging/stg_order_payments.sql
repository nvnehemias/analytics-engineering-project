with order_payments as (

    select * from {{ source('raw','order_payments')}}

)

select 
*
from order_payments