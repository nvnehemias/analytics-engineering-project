with geolocation as (

    select * from {{ source('raw','geolocation')}}

)

select 
*
from geolocation
