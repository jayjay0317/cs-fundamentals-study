-- Lecture 1: Relating
-- Databases: longlist.db, sea_lions.db
-- Source: Harvard CS50 SQL

-- Subqueries
SELECT "title"
FROM "books"
WHERE "publisher_id" = (
    SELECT "id"
    FROM "publishers"
    WHERE "publisher" = 'MacLehose Press'
);

SELECT AVG("rating")
FROM "ratings"
WHERE "book_id" = (
    SELECT "id"
    FROM "books"
    WHERE "title" = 'In Memory of Memory'
);

-- Nested subqueries
SELECT "name" 
FROM "authors"
WHERE "id" = (
    SELECT "author_id" 
    FROM "authored"
    WHERE "book_id" = (
        SELECT "id"
        FROM "books"
        WHERE "title" = 'The Birthday Party'
    )
);

-- Subquery with multiple values using IN
SELECT "title" 
FROM "books"
WHERE "id" IN (
    SELECT "book_id"
    FROM "authored"
    WHERE "author_id" = (
        SELECT "id"
        FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);

-- INNER JOIN: matching rows from both tables
SELECT *
FROM "sea_lions"
JOIN "migrations"
ON "migrations"."id" = "sea_lions"."id";

-- LEFT JOIN: all rows from the left table
SELECT *
FROM "sea_lions"
LEFT JOIN "migrations"
ON "migrations"."id" = "sea_lions"."id";

-- RIGHT JOIN: all rows from the right table
SELECT *
FROM "sea_lions"
RIGHT JOIN "migrations"
ON "migrations"."id" = "sea_lions"."id";

-- FULL JOIN: all rows from both tables
SELECT *
FROM "sea_lions"
FULL JOIN "migrations"
ON "migrations"."id" = "sea_lions"."id";

-- NATURAL JOIN: automatically join on common column names
SELECT *
FROM "sea_lions"
NATURAL JOIN "migrations";

-- UNION: combine results and remove duplicates
SELECT "name"
FROM "translators"
UNION
SELECT "name"
FROM "authors";

-- UNION with additional labels
SELECT 'author' AS "profession", "name" 
FROM "authors"
UNION
SELECT 'translator' AS "profession", "name" 
FROM "translators";

-- INTERSECT: return common rows
SELECT "name"
FROM "translators"
INTERSECT
SELECT "name"
FROM "authors";

-- EXCEPT: return rows found only in the first result
SELECT "name"
FROM "authors"
EXCEPT
SELECT "name"
FROM "translators";

-- INTERSECT with subqueries
SELECT "book_id"
FROM "translated"
WHERE "translator_id" = (
    SELECT "id"
    FROM "translators" 
    WHERE "name" = 'Sophie Hughes'
)
INTERSECT
SELECT "book_id"
FROM "translated"
WHERE "translator_id" = (
    SELECT "id"
    FROM "translators" 
    WHERE "name" = 'Margaret Jull Costa'
);

-- Group and filter aggregated results
SELECT "book_id", ROUND(AVG("rating"), 2) AS "average rating"
FROM "ratings"
GROUP BY "book_id"
HAVING "average rating" > 4.0;

-- Count non-NULL ratings per book
SELECT "book_id", COUNT("rating") AS "ratings"
FROM "ratings"
GROUP BY "book_id";

-- Sort filtered aggregate results
SELECT "book_id", ROUND(AVG("rating"), 2) AS "average rating"
FROM "ratings"
GROUP BY "book_id"
HAVING "average rating" > 4.0
ORDER BY "average rating" DESC;