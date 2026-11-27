-- Lecture 0: Querying
-- Database: longlist.db
-- Source: Harvard CS50 SQL

-- Limit the number of rows
SELECT "title"
FROM "longlist"
LIMIT 5;

-- Filter rows
SELECT "title"
FROM "longlist"
WHERE "year" = 2023;

-- Inequality operators
SELECT "title", "format"
FROM "longlist"
WHERE "format" != 'hardcover';

SELECT "title", "format"
FROM "longlist"
WHERE "format" <> 'hardcover';

SELECT "title", "format"
FROM "longlist"
WHERE NOT "format" = 'hardcover';

-- Combine conditions
SELECT "title", "format"
FROM "longlist"
WHERE ("year" = 2022 OR "year" = 2023)
AND "format" != 'hardcover';

-- Check for NULL values
SELECT "title", "translator"
FROM "longlist"
WHERE "translator" IS NULL;

-- Pattern matching with wildcards (%, _)
SELECT "title"
FROM "longlist"
WHERE "title" LIKE '%love%';

SELECT "title"
FROM "longlist"
WHERE "title" LIKE 'The %';

SELECT "title"
FROM "longlist"
WHERE "title" LIKE 'P_re';

SELECT "title"
FROM "longlist"
WHERE "title" LIKE 'T___';

-- Filter by an inclusive range
SELECT "title", "year"
FROM "longlist"
WHERE "year" >= 2019 AND "year" <= 2022;

SELECT "title", "year"
FROM "longlist"
WHERE "year" BETWEEN 2019 AND 2022;

-- Sort in ascending and descending order
SELECT "title", "rating"
FROM "longlist"
ORDER BY "rating"
LIMIT 10;

SELECT "title", "rating"
FROM "longlist"
ORDER BY "rating" DESC
LIMIT 10;

-- Sort by multiple columns
SELECT "title", "rating", "votes"
FROM "longlist"
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;

-- Sort alphabetically
SELECT "title"
FROM "longlist"
ORDER BY "title";

-- Aggregate functions
SELECT ROUND(AVG("rating"), 2) AS "average rating"
FROM "longlist";

SELECT MAX("title"), MIN("title")
FROM "longlist";

SELECT COUNT(*)
FROM "longlist";

-- Retrieve and count distinct values
SELECT DISTINCT "publisher"
FROM "longlist";

SELECT COUNT(DISTINCT "publisher")
FROM "longlist";