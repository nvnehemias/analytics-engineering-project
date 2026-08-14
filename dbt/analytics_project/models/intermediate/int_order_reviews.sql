with reviews as (

    select * from {{ ref('stg_order_reviews') }}

)

select 
    order_id
    , count(*) as review_count 
    , avg(review_score) as average_review_score
    , min(review_score) as minimum_review_score 
    , max(review_score) as maximum_review_score

from reviews 
group by 1 