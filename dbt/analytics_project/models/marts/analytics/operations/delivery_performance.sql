with orders as (

    select * from {{ ref('fct_orders') }}

)

, orders_filtered as (

    select 
        order_id
        , customer_id
        , order_status
        , order_purchase_timestamp
        , order_delivered_customer_date 
        , order_estimated_delivery_date 

    from orders 

)

select 
    order_id 
    , customer_id
    , order_status
    , order_purchase_timestamp
    , order_delivered_customer_date
    , order_estimated_delivery_date

    -- Actual delivery time 
    , case when order_delivered_customer_date is not null then (order_delivered_customer_date::date - order_purchase_timestamp::date) end as delivery_days

    -- Expected delivery time 
    , case when order_estimated_delivery_date is not null then (order_estimated_delivery_date::date - order_purchase_timestamp::date) end as estmiated_delivery_date 

    -- Days early/late compated with estimate 
    , case when (order_delivered_customer_date is not null and order_estimated_delivery_date is not null) then (order_delivered_customer_date::date - order_estimated_delivery_date::date) end as days_late 

    -- on time delivery flag 
    , case 
        when (order_delivered_customer_date is null or order_estimated_delivery_date is null) then null  
        when order_delivered_customer_date::date <= order_estimated_delivery_date::date then true 
        else false 
    end as delivered_on_time

from orders_filtered
