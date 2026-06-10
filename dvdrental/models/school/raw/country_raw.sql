-- models/school/raw/country_raw.sql
SELECT * FROM {{ source('dvdrental', 'country') }}