-- models/school/star/fct/Fact_Opbrengst.sql

SELECT
    klant_stad.city AS stad,
    c.customer_id,
    AVG(p.amount) AS gemiddelde_opbrengst
FROM {{ source('dvdrental', 'payment') }} p
JOIN {{ source('dvdrental', 'customer') }} c
    ON p.customer_id = c.customer_id
JOIN {{ source('dvdrental', 'address') }} klant_adres
    ON c.address_id = klant_adres.address_id
JOIN {{ source('dvdrental', 'city') }} klant_stad
    ON klant_adres.city_id = klant_stad.city_id
GROUP BY
    klant_stad.city,
    c.customer_id
