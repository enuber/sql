-- Aggregate function 
-- COUNT 
-- AVG 
-- MIN
-- MAX
-- SUM
-- ROUND - ROUND(NUM, DECIMAL_PLACE) where NUM is the number to round to and, the DECIMAL_PLACE is how many digits should appear after the period (.)
-- AS - can be used to change the column title 
-- DISTINCT - allows us to get a list that doesn't include duplicates, where each is unique

-- Find the average rating of all longlisted books
-- gives us a really long list of numbers
SELECT AVG("rating") FROM "longlist";

-- Round the result
-- ROUND allows us to round to a specific decimals. 
SELECT ROUND(AVG("rating"), 2) FROM "longlist";

-- Rename column with AS
-- we can rename the column title using AS 
SELECT ROUND(AVG("rating"), 2) AS "Average Rating" FROM "longlist";

-- Find maximum rating
SELECT MAX("rating") FROM "longlist";

-- Find minimum rating
SELECT MIN("rating") FROM "longlist";

-- Find total number of votes
SELECT SUM("votes") AS "Total Votes" FROM "longlist";

-- Find total number of books
-- remember * means everything
SELECT COUNT(*) AS "Total Rows" FROM "longlist";

-- Find total number of translators
-- will be less than total rows because two of these were Null 
SELECT COUNT("translator") FROM "longlist";

-- Incorrectly count publishers
SELECT COUNT("publisher") FROM "longlist";

-- Correctly count publishers
SELECT COUNT(DISTINCT "publisher") FROM "longlist";