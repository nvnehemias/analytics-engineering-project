with fct_orders as (

    select * from {{ ref('fct_orders') }}

)

, customer_order as (

    select 
        customer_id
        , order_id
        , order_purchase_timestamp
        , product_revenue
        , freight_value
        , total_payment_value

    from fct_orders
)

select 
    customer_id 
    , count(distinct order_id) as order_count 
    , sum(product_revenue) as total_product_revenue
    , sum(freight_value) as total_freight
    , sum(total_payment_value) as total_spend
    , avg(total_payment_value) as average_order_value
    , min(order_purchase_timestamp::timestamp) as first_order_date
    , max(order_purchase_timestamp::timestamp) as last_order_date 
    
from customer_order
group by 1