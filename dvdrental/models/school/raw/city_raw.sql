-- models/school/raw/city_raw.sql
SELECT * FROM {{ source('dvdrental', 'city') }}