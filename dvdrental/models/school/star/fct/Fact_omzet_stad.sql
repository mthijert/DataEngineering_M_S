-- models/school/star/fct/Fact_Omzet_Stad.sql

SELECT
    ci.city_id,
    ci.city,
    SUM(p.amount) AS total_omzet
FROM {{ source('dvdrental', 'payment') }} p
JOIN {{ source('dvdrental', 'customer') }} c        ON p.customer_id = c.customer_id
JOIN {{ source('dvdrental', 'address') }} a         ON c.address_id = a.address_id
JOIN {{ source('dvdrental', 'city') }} ci           ON a.city_id = ci.city_id
GROUP BY ci.city_id, ci.city
ORDER BY total_omzet DESC