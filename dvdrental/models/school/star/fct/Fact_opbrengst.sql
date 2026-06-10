-- models/school/star/fct/Fact_Opbrengst.sql

WITH opbrengst_per_klant AS (
    SELECT
        c.customer_id,
        a.city_id,
        SUM(p.amount) AS klant_opbrengst
    FROM {{ source('dvdrental', 'payment') }} p
    JOIN {{ source('dvdrental', 'customer') }} c
        ON p.customer_id = c.customer_id
    JOIN {{ source('dvdrental', 'address') }} a
        ON c.address_id = a.address_id
    GROUP BY c.customer_id, a.city_id
)

SELECT
    ci.city_id,
    ci.city,
    AVG(opk.klant_opbrengst) AS gemiddelde_opbrengst_per_klant
FROM opbrengst_per_klant opk
JOIN {{ source('dvdrental', 'city') }} ci
    ON opk.city_id = ci.city_id
GROUP BY ci.city_id, ci.city
ORDER BY gemiddelde_opbrengst_per_klant DESC