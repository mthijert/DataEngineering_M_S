-- models/school/star/fct/Fact_opbrengst_winkelstad_vergelijking.sql


SELECT
    CASE WHEN klant_stad.city_id = winkel_stad.city_id
         THEN 'Zelfde stad als winkel'
         ELSE 'Andere stad' END AS groep,
    SUM(p.amount) AS totale_opbrengst
FROM {{ source('dvdrental', 'payment') }} p
JOIN {{ source('dvdrental', 'rental') }} r               ON p.rental_id = r.rental_id
JOIN {{ source('dvdrental', 'staff') }} st               ON r.staff_id = st.staff_id
JOIN {{ source('dvdrental', 'store') }} s                ON st.store_id = s.store_id
JOIN {{ source('dvdrental', 'address') }} winkel_adres   ON s.address_id = winkel_adres.address_id
JOIN {{ source('dvdrental', 'city') }} winkel_stad       ON winkel_adres.city_id = winkel_stad.city_id
JOIN {{ source('dvdrental', 'customer') }} c             ON p.customer_id = c.customer_id
JOIN {{ source('dvdrental', 'address') }} klant_adres    ON c.address_id = klant_adres.address_id
JOIN {{ source('dvdrental', 'city') }} klant_stad        ON klant_adres.city_id = klant_stad.city_id
GROUP BY 1