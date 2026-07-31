with products as (

    select * from {{ source('raw','products')}}

)

select 
    product_id
    , product_category_name as category_name
    , product_photo_qty as photo_qty 
    , product_weight_g as weight_g
    , product_length_cm as length_cm
    , product_height_cm as height_cm 
    , product_width_cm as width_cm
    
from products