-- models/school/star/dim/Dim_Store.sql

SELECT
    *
FROM {{ source('dvdrental', 'store') }}