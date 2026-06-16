-- models/school/raw/rental_raw.sql
SELECT * FROM {{ source('dvdrental', 'rental') }}