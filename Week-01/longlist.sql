-- SELECT * FROM authors
-- terminalde sqlite3 longlist.db yazdığımız zaman artık terminalden SQL Query'si yazabiliriz
-- DB' nin içerisindeki tabloları görebilmek için .tables kommutu kullanılabilir


-- Relational Database
-- bir tane authors ve bir tane de books adında tablolarımız olsun. 
-- bu durumda hangi kitabın hangi yazara ait olduğunu belirtmemiz lazım
-- Peki bir tablo içerisinde bir sutünda author diğer sutünda da book verilerini tutsak?
-- Bu durumda bir yazarın birden fazla kitabı olması durumunda o yazarın adını da o kadar yazmamız gerekecek. 
-- Bir veriyi gereksiz yere birden fazla kez yazmak maliyetleri arttıracaktır. 

-- Eğer bir yazar bir kitap yazıyorsa veya bir kitabın sadece bir yazarı varsa burada authors ve books tabloları arasında One-To-One ilişkisi vardır. 
-- Bir yazarın birden fazla kitabı varsa burada One-To-Many ilişkisi vardır. 
-- Bir kitabın birden fazla yazarı varsa ve bir yazarın birden fazla kitabı varsa bu durumda Many-To-Many ilişkisi vardır. 
-- Bu ilişkilere Entitiy-Relationship denir. (Entity Relationship diyagramları önemli)

-- KEY kullanarak bu ilişkileri tablolar içerisinde tanımlayabiliriz. 
-- Primary-Key. Her veri bir unique key değerine sahiptir. 
-- Foreign-Key. Tablolar arasında ilişki kurmak istediğimiz zaman bir tablodaki key değerini diğer tabloya verebiliriz
-- Mesela kitaplar için ISBN verisi unique bir key'dir. Ancak eğer biz primary key olarak ISBN' yi seçersek hafıza problemleri ile karşılaşabiliriz. 
-- Bunun yerine bir id değeri verebiliriz. 1,2,3.. gibi.

-- Subqueries
-- Örneğin book tablosuna bakarak kitabı kimin yayınladığını bulmak için Subquery yazmamız lazımç. 
-- Bu durumda önce book tablosundan publisher_id' yi bulup sonra publishers tablosunda bu id'nin kime ait olduğuna bakabiliriz
-- Veya bir başka durum: Önce publishers tablosundan bir tane id buluruz ve bu publisher_id değeri ile books tablosunda title değerini çekebiliriz. 
--SELECT "id" FROM "publishers" WHERE "publisher" = 'Fitzcarraldo Editions';
-- Yukarıdaki SQL komutu ile publisher' ın id değerini bulduk. 
-- Sonraki adımda bu id değeri ile books tablosuna bir query atabiliriz. 
--SELECT "title" FROM "books" WHERE "publisher_id" = 5;
-- Ancak bu durumda iki tane query gönderdik ve asıl sıkıntı publisher'ın id değerini aklımızda veya başka bir yerde tutmamız gerekiyor. 
-- Yani sistem dinamik değil. 
-- Burada SQL bize Subquery imkanı sunuyor. Yani iki query' i birleştirebiliyoruz. 
-- SELECT "title" FROM "books" WHERE "publisher_id" = (SELECT "id" FROM "publishers" WHERE "publisher" = 'Fitzcarraldo Editions');
SELECT "id" FROM "publishers" WHERE "publisher" = 'MacLehose Press';

SELECT "title" FROM "books" WHERE "publisher_id" = 12;

SELECT "title" FROM "books" WHERE "publisher_id" = (
    SELECT "id" FROM "publishers" WHERE "publisher" = 'MacLehose Press'
);


SELECT "rating" FROM "ratings" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'In Memory of Memory'
);


SELECT AVG("rating") AS "Average Rating" FROM "ratings" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'In Memory of Memory'
);


SELECT "name" FROM "authors" WHERE "id" = (
    SELECT "author_id" FROM "authored" WHERE "book_id" = (
        SELECT "id" FROM "books" WHERE "title" = 'Flights'
    )
);

--SELECT "id" FROM "authors" WHERE "name" = "Fernanda Melchor";

-- Bir yazarın yazdığı kitap sayısı birden fazla ise bu durumda elimizde birden fazla book_id değeri olacaktır. 
-- Bu durumda IN keyword ü ile elimizdeki book_id' lerin tamamına bakmış oluruz. 
SELECT "title" FROM "books" WHERE "id" IN (
    SELECT "book_id" FROM "authored" WHERE "author_id" = (
        SELECT "id" FROM "authors" WHERE "name" = 'Fernanda Melchor'
    )
);


-- JOIN 

--Join konusu sea_lions isimli dosyada anlatıldı. 









