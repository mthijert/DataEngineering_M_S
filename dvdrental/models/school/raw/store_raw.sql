-- models/school/raw/store_raw.sql

SELECT * FROM {{ source('dvdrental', 'store') }}