with fct_order_items as (

    select * from {{ ref('fct_order_items') }}

)

, seller_items as (
    
    select 
        seller_id 
        , order_id 
        , order_item_id 
        , price 
        , freight_value
    
    from fct_order_items

)

select 
    seller_id
    , count(distinct order_id) as order_count 
    , count(*) as item_count 
    , sum(price) as total_product_revenue
    , sum(freight_value) as total_freight
    , avg(price) as average_item_price

from seller_items 
group by 1 