-- models/school/raw/customer_raw.sql

SELECT * FROM {{ source('dvdrental', 'customer') }}