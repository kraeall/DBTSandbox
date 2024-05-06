with source as (

select * from {{ source('jaffle_shop', 'raw_orders') }}

),

renamed as (

    select
         ----------  ids
        id as order_id,
        user_id as customer_id,
        status,

        ---------- store_id as location_id,
        ---------customer as customer_id,

        ---------- numerics
        --------subtotal as subtotal_cents,
        --------tax_paid as tax_paid_cents,
        --------order_total as order_total_cents,
        -------------user_id as customer_id,
        ----------{{ cents_to_dollars('subtotal') }} as subtotal,
        ---------{{ cents_to_dollars('tax_paid') }} as tax_paid,
        -----------{{ cents_to_dollars('order_total') }} as order_total,

        ---------- timestamps
        {{ dbt.date_trunc('day','order_date') }} as order_date

    from source

)

select * from renamed