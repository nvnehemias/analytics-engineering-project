with sellers as (

    select * from {{ ref('stg_sellers') }}

)

, geolocation as (

    select * from {{ ref('int_geolocation_by_zip') }}

)

select 
    s.seller_id 
    , s.zip_code as zip_code_prefix 
    , s.city 
    , s.state
    , g.latitude
    , g.longitude

from sellers s 
left join geolocation g on s.zip_code = g.geolocation_zip_code_prefix