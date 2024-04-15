-- WHERE - keyword that lets you to get back some rows where a condition is true. 
-- = is equal, != is not equal, <> - is same as !=
-- NOT - keyword that is also used to be not something, same as != or <>
-- AND, OR and () - change conditionals to be more complex. () is used to suggest order like what happens first or together. 

-- By leaving off semi-colon you can continue query on next line if it starts to get to long

-- Select all books nominated in 2023
SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;

-- Prove selected only books nominated in 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2023;

-- Select all books by Fernanda Melchor
SELECT "title", "author" FROM "longlist" WHERE "author" = 'Fernanda Melchor';

-- Select all books not released in hardcover format
-- The next three of these are the same != <> and NOT
SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE NOT "format" = 'hardcover';

-- Select all books released in either 2022 or 2023
SELECT "title", "author" FROM "longlist" WHERE "year"=2022 OR "year"=2023;
SELECT "title", "author" FROM "longlist" WHERE "year"=2022 
  OR "year"=2023;

-- Select all books released in either 2022 or 2023
-- note the use of () as well as 'hardcover' is in single quotes as it's a string and not a column
SELECT "title", "format" FROM "longlist" 
  WHERE ("year"=2022 OR "year"=2023)
  AND "format" != 'hardcover';


