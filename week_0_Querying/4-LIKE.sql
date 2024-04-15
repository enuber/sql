-- LIKE - when we want to roughly match some string in the DB.
-- % - match any character around a string
-- _ - match any single character 
--  like is case insensitive... so can be lower case and still get us enteries with capital letters and vice versa. This is as opposed to = which must be exactly as it appears.

-- Find all books with "love" in the title
-- we wrap love with % to show we want love where there is anything before it or anything after it. This means if love starts or ends the title we will still get it.
-- if we removed the trailering % we would only end up with books where love is the last word of the title
-- if we removed the first % we would get books where love is the start of the title
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';

-- Find all books that begin with "The" (includes "There", etc.)
-- this shows we have to be careful with words that may be within other words as this will give us words that include the like their there they...etc
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';

-- Find all books that begin with "The"
-- understands the space between the word and % meaning we want to match this format
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The %';

-- can also combine
-- this means any book that starts with 'love' that also has the word 'the' where the has something before it and could have something after it.
SELECT "title" FROM "longlist" WHERE "title" LIKE 'Love%The%';

-- Find a book whose title unsure how to spell
-- Note that this only works because there is a title that is a single word. Pyre. If there were multiple words it would not work. so Pyre on Fire would not come up as it doesn't dectinctly match the criteria.
SELECT "title" FROM "longlist" WHERE "title" LIKE 'P_re';

-- can combine everything where here we want books that have a word that begins and ends with L, E and is anywhere in the title
SELECT "title" FROM "longlist" WHERE "title" LIKE '%L__e%';