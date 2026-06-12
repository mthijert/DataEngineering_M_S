-- models/school/star/dim/Dim_Address.sql

SELECT
    *
FROM {{ source('dvdrental', 'address') }}