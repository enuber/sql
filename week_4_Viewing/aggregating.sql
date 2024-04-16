-- PART 2
-- Aggregating - find AVG, MIN, MAX inside a view. 

-- CREATE TEMPORARY VIEW ... - allows you to create a view that can be used until you type .quit or exit out of the .db when you go back into the database the temp view would be gone.

-- Demonstrates views for aggregating data
-- Uses longlist.db

-- Views ratings table
SELECT * FROM "ratings";

-- Returns book IDs and unrounded ratings
SELECT "book_id", AVG("rating") AS "rating" FROM "ratings"
GROUP BY "book_id";

-- Returns book IDs and rounded ratings
SELECT "book_id", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
GROUP BY "book_id";

-- Adds book IDs, rounded ratings, title, and year columns
-- have to join the lists at this point becuase ratings alone doesn't have the title and year.
SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

-- Defines book IDs, rounded ratings, title, and year columns as a view
-- creating the view now, remember view will be available in the schema.
-- also remember this alone doesn't do anything other than create the view. 
CREATE VIEW "average_book_ratings" AS
SELECT "book_id" AS "id", "title", "year", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
JOIN "books" ON "ratings"."book_id" = "books"."id"
GROUP BY "book_id";

-- if data is later inserted info a list, if you run a query you will get the updated info.

-- Finds average book ratings by year nominated
SELECT "year", ROUND(AVG("rating"), 2) AS "rating" FROM "average_book_ratings" 
GROUP BY "year";

-- Creates temporary view of average ratings by year
-- Allows you to create a view that is just temporary.
CREATE TEMPORARY VIEW "average_ratings_by_year" ("year", "rating") AS
SELECT "year", ROUND(AVG("rating"), 2) AS "rating" FROM "average_book_ratings" 
GROUP BY "year";

-- Drops the view "average_book_ratings"
-- droping this view so we can do the CTE below.
DROP VIEW "average_book_ratings";

-- Shows that CTEs are views accessible for the duration of a query
-- Common Table Expression - CTE - exists for a single query.
-- WITTH <name> AS (
--   SELECT...
-- ), ...
-- SELECT ... FROM name;
-- useful if you want a temp view that you don't want to store in your schema but you do want to use for this particular query.
-- note that the as () inside the () is the query and you can do (),(),() to do multiple queries.

WITH "average_book_ratings" AS (
  SELECT "book_id", "title", "year", ROUND(AVG("rating"), 2) AS "rating" FROM "ratings"
  JOIN "books" ON "ratings"."book_id" = "books"."id"
  GROUP BY "book_id"
)
SELECT "year", ROUND(AVG("rating"), 2) AS "rating" FROM "average_book_ratings"
GROUP BY "year";
