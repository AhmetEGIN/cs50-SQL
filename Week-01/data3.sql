
--SELECT * FROM "translators";
--SELECT * FROM "authors";

--SELECT "name" FROM "translators" UNION SELECT "name" FROM "authors";
-- her yazar ve her çevirmen bir kere var. Yani hem çevirmen hem de yazar olanlar da bir kere yazılıyor


--SELECT 'author' AS "profession", "name" FROM "authors" UNION SELECT 'translators' AS "profession", "name" FROM "translators";


-- Hem author hem de translator olanlar:
SELECT "name" FROM "authors" INTERSECT SELECT "name" FROM "translators";


-- Ya author ya da translator olanlar. Yani ikisini de yapanlar yok
-- SELECT "name" FROM "authors" EXCEPT SELECT "name" FROM "translators";


SELECT "book_id" FROM "translated" WHERE "translator_id"  = (
    SELECT "id" FROM "translators" WHERE "name" = 'Sophie Hughes'
);


SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE "name" = 'Sophie Hughes'
) INTERSECT SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE "name" = 'Margaret Jull Costa'
);



SELECT "book_id", ROUND(AVG("rating"), 2) AS "Average Rating" FROM "ratings" GROUP BY "book_id" HAVING "Average Rating" > 4.0;

SELECT "book_id", COUNT("rating") AS "COUNT OF  Rating" FROM "ratings" GROUP BY "book_id";

SELECT "book_id", ROUND(AVG("rating"), 2) AS "Average Rating" FROM "ratings" GROUP BY "book_id" HAVING "Average Rating" > 4.0 ORDER BY "Average Rating" DESC;

 




