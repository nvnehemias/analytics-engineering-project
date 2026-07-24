with order_items as (

    select * from {{ source('raw','order_items')}}

)

select 
*
from order_items
