-- models/school/star/fct/Fact_Opbrengst_Klant_Stad_Winkel.sql

SELECT
    SUM(p.amount) AS totale_opbrengst
FROM {{ source('dvdrental', 'payment') }} p
JOIN {{ source('dvdrental', 'customer') }} c
    ON p.customer_id = c.customer_id
JOIN {{ source('dvdrental', 'address') }} klant_adres
    ON c.address_id = klant_adres.address_id
JOIN {{ source('dvdrental', 'store') }} s
    ON c.store_id = s.store_id
JOIN {{ source('dvdrental', 'address') }} winkel_adres
    ON s.address_id = winkel_adres.address_id
WHERE klant_adres.city_id = winkel_adres.city_id