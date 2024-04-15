-- we covered this earlier in the "where.sql" but using OR and AND. Also note that this does lead into range as we see that in the last query having to do a long list of OR statements isn't the best idea. 

-- Find titles from 2022 or 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2022 OR "year" = 2023;

-- Find hardcover books from 2022 and 2023
SELECT "title", "year" FROM "longlist" WHERE ("year" = 2022 OR "year" = 2023) AND "format" = 'hardcover';

-- Find books between 2019 and 2022
-- Using many ORs
SELECT "title", "year" FROM "longlist" 
WHERE "year" = 2019 OR "year" = 2020 OR "year" = 2021 OR "year" = 2022;