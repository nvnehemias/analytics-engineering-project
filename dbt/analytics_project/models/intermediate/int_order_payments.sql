with payments as (

    select * from {{ ref('stg_order_payments') }}

)

select 
    order_id
    , count(*) as payment_count 
    , sum(payment_value) as total_payment_value
    , sum(case 
            when payment_type = 'credit_card' then payment_value
            else 0
        end) as boleto_value
    , sum(
        case
            when payment_type = 'voucher' then payment_value
            else 0
        end
    ) as voucher_value
    , sum(
        case 
            when payment_type = 'debit_card' then payment_value
            else 0
        end
    ) as debit_card_value

from payments 
group by 1 