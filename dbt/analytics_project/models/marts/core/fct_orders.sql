with orders as (

    select * from {{ ref('stg_orders') }}

)

, payments as (

    select * from {{ ref('int_order_payments') }}
)

, reviews as (

    select * from {{ ref('int_order_reviews') }}
)

, order_items as (

    select 
        order_id 
        , count(*) as item_count 
        , sum(price) as product_revenue 
        , sum(freight_value) as freight_value

    from {{ ref('fct_order_items') }}
    group by 1 

)

select 
    -- Order identifiers
    o.order_id
    , o.customer_id 

    -- Order status
    , o.order_status

    -- Order timestamps
    , o.order_purchase_timestamp
    , o.order_approved_at 
    , o.order_delivered_carrier_date 
    , o.order_delivered_customer_date 
    , o.order_estimated_delivery_date 

    -- Item Metrics
    , coalesce(oi.item_count,0) as item_count
    , coalesce(oi.product_revenue,0) as product_revenue
    , coalesce(oi.freight_value,0) as freight_value
    

    -- Payment Metrics
    , coalesce(p.payment_count,0) as payment_count 
    , coalesce(p.total_payment_value,0) as total_payment_value
    , coalesce(p.credit_card_value,0) as credit_card_value
    , coalesce(p.boleto_value,0) as boleto_value
    , coalesce(p.voucher_value,0) as voucher_value
    , coalesce(p.debit_card_value,0) as debit_card_value

    -- Review Metrics
    , coalesce(r.review_count,0) as review_count
    , r.average_review_score
    , r.minimum_review_score
    , r.maximum_review_score

from orders o 
left join order_items oi on o.order_id = oi.order_id 
left join payments p on o.order_id = p.order_id
left join reviews r on o.order_id = r.order_id