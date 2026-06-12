-- models/school/star/dim/Dim_City.sql

SELECT
    *
FROM {{ source('dvdrental', 'city') }}