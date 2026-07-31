with customers as (

    select * from {{ref('stg_customers')}}
)

, orders as (

    select * from {{ref('stg_orders')}}   
)

, customer_orders as (

    select 
        customer_id
        , min(order_purchase_timestamp) as first_order_date
        , max(order_purchase_timestamp) as last_order_date
        count(order_id) as total_orders

    from orders
    group by 1

)

select 
    c.customer_id
    , c.customer_unique_id
    , c.city 
    , c.state 
    , co.first_order_date
    , co.last_order_date
    , coalesce(co.total_orders,0) as total_orders
    
from customers c 
left join customer_orders co on c.customer_id = co.customer_id