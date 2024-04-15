-- GROUP BY - allows us to create groups based on differences in a column. So in an ID column, all the id's that match 1 or match 2 ... etc would be grouped together 
-- HAVING - another keyword similar to where but because I have a group you can't use where anymore. 

-- Demonstrates aggregation by groups with GROUP BY
-- Uses longlist.db

-- Finds average rating for each book
SELECT "book_id", ROUND(AVG("rating"), 2) AS "average rating" FROM "ratings"
GROUP BY "book_id";

-- Joins titles
SELECT "title", ROUND(AVG("rating"), 2) AS "average rating" FROM "ratings"
JOIN "books" ON "books"."id" = "ratings"."book_id"
GROUP BY "book_id";

-- Chooses books with a rating of 4.0 or higher
SELECT "title", ROUND(AVG("rating"), 2) AS "average rating" FROM "ratings"
JOIN "books" ON "books"."id" = "ratings"."book_id"
GROUP BY "book_id"
HAVING "average rating" > 4.0;
