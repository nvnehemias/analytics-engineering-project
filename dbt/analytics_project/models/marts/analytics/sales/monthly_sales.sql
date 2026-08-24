with orders as (

    select * from {{ ref('fct_orders') }}

)

select 
    date_trunc('month',order_purchase_timestamp::timestamp) as order_month 
    , count(*) as order_count 
    , sum(product_revenue) as total_product_revenue
    , sum(freight_value) as total_freight 
    , sum(total_payment_value) as total_payment_value
    , sum(total_payment_value) as average_order_value

from orders 
group by 1 
