with product_category_name_translation as (

    select * from {{ source('raw','product_category_name_translation')}}

)

select 
*
from product_category_name_translation