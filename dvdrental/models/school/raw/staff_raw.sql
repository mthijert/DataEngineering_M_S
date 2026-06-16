-- models/school/raw/staff_raw.sql
SELECT * FROM {{ source('dvdrental', 'staff') }}