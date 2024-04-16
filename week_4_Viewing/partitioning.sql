-- Part 3
-- partition - break it into smaller pieces. 
-- example - have a table for each year of books rather than just one list of all books.

-- Demonstrates views for partitioning data
-- Uses longlist.db

-- Queries for 2022 longlisted books
-- grabbing just books from year 2022 giving a table of id and titles
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

-- Creates view of 2022 longlisted books
-- doing same thing but saving it as a view for year 2022.
CREATE VIEW "2022" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

-- Queries for 2021 longlisted books
SELECT "id", "title" FROM "books"
WHERE "year" = 2021;

-- Creates view of 2021 longlisted books
CREATE VIEW "2021" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2021;
