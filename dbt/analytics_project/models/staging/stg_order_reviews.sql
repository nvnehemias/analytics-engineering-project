with order_reviews as (

    select * from {{ source('raw','order_reviews')}}

)

select 
*
from order_reviews