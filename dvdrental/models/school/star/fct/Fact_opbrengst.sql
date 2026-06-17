-- models/school/star/fct/Fact_opbrengst.sql

WITH opbrengst_per_klant AS (
    SELECT
        c.customer_id,
        klant_stad.city AS stad,
        SUM(p.amount)   AS opbrengst          -- totale opbrengst per klant
    FROM {{ source('dvdrental', 'payment') }} p
    JOIN {{ source('dvdrental', 'customer') }} c            ON p.customer_id = c.customer_id
    JOIN {{ source('dvdrental', 'address') }} klant_adres   ON c.address_id = klant_adres.address_id
    JOIN {{ source('dvdrental', 'city') }} klant_stad       ON klant_adres.city_id = klant_stad.city_id
    GROUP BY c.customer_id, klant_stad.city
)
SELECT
    stad,
    AVG(opbrengst) AS gemiddelde_opbrengst_per_klant,
    COUNT(*)       AS aantal_klanten          -- handig als context (zie hieronder)
FROM opbrengst_per_klant
GROUP BY stad
ORDER BY gemiddelde_opbrengst_per_klant DESC