-- models/school/star/dim/Dim_Rental.sql

SELECT
    *
FROM {{ source('dvdrental', 'rental') }}