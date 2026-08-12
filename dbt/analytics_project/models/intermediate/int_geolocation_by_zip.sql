with geolocation as (

    select * from {{ ref('stg_geolocation') }}

)

select 
    geolocation_zip_code_prefix
    , avg(geolocation_lat) as latitude
    , avg(geolocation_lng) as longitude

from geolocation 
group by geolocation_zip_code_prefix