with seller as (

    select * from {{ ref('stg_sellers') }}

)


select 
*
from sellers