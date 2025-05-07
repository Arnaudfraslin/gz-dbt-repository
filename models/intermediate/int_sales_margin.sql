WITH jointure_sales_product__product_id AS (
    SELECT * 
        FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} s
        LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} p
        USING (product_id)
)

SELECT 
    date_date,
    orders_id,
    product_id,
    purchase_price,
    quantity,
    revenue,
    ROUND((quantity * purchase_price),2) AS purchase_cost,
    ROUND(revenue - (quantity * purchase_price),2) AS margin

FROM jointure_sales_product__product_id