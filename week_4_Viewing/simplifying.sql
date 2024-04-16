-- PART 1

-- View - a virtual table defined by a query. Could use to simplify aggregate, partion or secure data. 

-- example. If we had an author table, a book title table, and an authored table that shows what author wrote what book... we end up with just a table that shows authors and books with no id's. the result is still a table. 

-- CREATE VIEW <name> AS
-- SELECT...; - lets us create a view that uses a query and will store the info into <name> and is apart of the schema.

-- Can't modify a view because its a combination of data from underlying tables. it is assembling data from other parts of the database and putting them into a single view. so you can't update that data because the pieces are in multiple individual tables found in the database. Should update the underlying table which you can do with update and set.  

-- Demonstrates views for simplifying data access
-- Uses longlist.db

-- Finds books written by Fernanda Melchor
-- this is a subquery where we use information from one table to give us information to be used in another table.
-- this is one way to get info wanted where we get books written by an author.
-- this also works for one author at a time so not as beneficial.

-- step 1: -gives us the book_id's of the books written by a specific author. We get the author id  and pass it into the authored tabled to get the book id's
SELECT "book_id" FROM "authored"
WHERE "author_id" = (
    SELECT "id" FROM "authors"
    WHERE "name" = 'Fernanda Melchor'
)
-- step 2: given the previous information, we then grab the titles of books using the "IN" keyword.
SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "authored"
    WHERE "author_id" = (
        SELECT "id" FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);

-- Joins authors with their book titles
-- another way to get similar info.
-- this joins the tables together where author id matches authored author it and books id to authored books id. 
-- so we get a single table back of just names and titles without all the id's. But we can't store this info doing it this way. 

SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";

-- Creates a view from the query to join authors with their book titles
-- doing this will create a VIEW and you can see that view in the .schema. 
-- to see a view, you do normal querying SELECT * FROM "longlist";
-- could add an ORDER BY "title" at the end of the join and the view would show books alphabetized.
CREATE VIEW "longlist" AS
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";

-- Returns first five rows from view
SELECT * FROM "longlist" LIMIT 5;

-- Finds books written by Fernanda Melchor, now using a view
-- this query simplifies the process of finding information versus where we started at the top of this file.
SELECT "title" FROM "longlist" WHERE "name" = 'Fernanda Melchor';
