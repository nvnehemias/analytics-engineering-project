with sellers as (

    select * from {{ source('raw','sellers')}}

)

select 
*
from sellers