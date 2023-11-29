-- Bu kısımda Join konusu işlenecek
-- SELECT * FROM "sea_lions";
-- SELECT * FROM "migrations";

SELECT * FROM "sea_lions" INNER JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";



-- INNER JOIN

-- JOIN 
-- INNER JOIN 
-- LEFT JOIN 
-- RIGHT JOIN
-- FULL JOIN

SELECT * FROM "sea_lions" LEFT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";
-- SELECT * FROM "sea_lions" RIGHT JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";
-- SELECT * FROM "sea_lions" FULL JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- FULL OUTER JOIN


SELECT * FROM "sea_lions" NATURAL JOIN "migrations";

-- Sonraki konu data3.sql dosyasında











