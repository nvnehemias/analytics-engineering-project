with products as (

    select * from {{ ref('stg_products')}}

)

, categories as (

    select * from {{ ref('stg_product_category_name_translation') }}

)

select 
    p.product_id
    , p.category_name
    , c.product_category_name_english 
    , p.weight_g
    , p.length_cm
    , p.height_cm
    , p.width_cm

from products p 
left join categories c on p.category_name = c.product_category_name 