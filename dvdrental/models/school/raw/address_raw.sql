-- models/school/raw/address_raw.sql
SELECT * FROM {{ source('dvdrental', 'address') }}