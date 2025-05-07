with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_product') }}

),

renamed as (

    select
        products_id,
        purchse_price

    from source

)

SELECT CAST(products_id AS FLOAT64) AS product_id,
CAST(purchse_price AS FLOAT64) AS purchase_price from renamed

