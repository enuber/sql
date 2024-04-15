-- UPDATE table
-- SET <column(s)>
-- WHERE condition;

-- Demonstrates cleaning data from a CSV of votes for favorite artwork
-- Creates votes.db

-- Imports votes.csv - table of one column of titles peopel voted on.
.import votes.csv votes

-- Counts votes
-- we will find that there are typos and extra spaces so have issues.
SELECT "title", COUNT("title") FROM "votes" GROUP BY "title";

-- Removes trailing whitespace
-- removes leading and trailing white space.
UPDATE "votes" SET "title" = trim("title");

-- Forces to uppercase
-- makes everything capitalized
UPDATE "votes" SET "title" = upper("title");

-- Manually updates the titles of "Farmers working at dawn"
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" = 'FARMERS WORKING';

UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" = 'FAMERS WORKING AT DAWN';

-- Fixes misspellings of "Farmers working at dawn"
-- makes it easier to fix multiple mispellings, remember like is case-insensitive and % matches any pattern after. This works in small sets but be careful with large data 
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" LIKE 'Fa%';

-- Fixes misspellings of "Imaginative landscape"
UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE'
WHERE "title" LIKE 'Imag%';

-- Fixes misspellings of "Profusion of flowers"
UPDATE "votes" SET "title" = 'PROFUSION OF FLOWERS'
WHERE "title" LIKE 'Profusion%';
