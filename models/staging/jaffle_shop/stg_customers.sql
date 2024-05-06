with 
source as (

select * from {{ source('jaffle_shop', 'raw_customers') }}
),

staged as (

    select
        id as customer_id,
        name

    from source

)

select * from staged