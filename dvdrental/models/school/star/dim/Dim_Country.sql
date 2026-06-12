-- models/school/star/dim/Dim_Country.sql

SELECT
    *
FROM {{ source('dvdrental', 'country') }}