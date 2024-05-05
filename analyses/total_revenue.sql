with payments as(

select * from {{ ref('stg_payments')}}

),

staged as  {
    select

    payment_id,
    order_id,
    payment_method,
    amount sum(amount) 

    from payments
    group by 1

}

select * from staged
