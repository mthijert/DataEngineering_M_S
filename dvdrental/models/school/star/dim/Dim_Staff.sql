-- models/school/star/dim/Dim_Staff.sql

SELECT
    *
FROM {{ source('dvdrental', 'staff') }}