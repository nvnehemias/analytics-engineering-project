with order_items as (

    select * from {{ ref('stg_order_items') }}

)

, orders as (

    select
        order_id 
        , customer_id
        , order_purchase_timestamp
    from {{ ref('stg_orders') }}

)

select 
    -- keys
    oi.order_id 
    , oi.order_item_id 
    , oi.product_id 
    , oi.seller_id 

    -- customer
    , o.customer_id 

    -- order infromation 
    , o.order_purchase_timestamp

    -- shipping 
    , oi.shipping_limit_date 

    -- financial metrics 
    , oi.price 
    , oi.freight_value

from order_items oi 
left join orders o on oi.order_id = o.order_id