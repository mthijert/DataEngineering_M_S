-- models/school/star/dim/Dim_Payment.sql

SELECT
    *
FROM {{ source('dvdrental', 'payment') }}