-- ORDER BY - keyword that lets us take the results of the query and order it by some column itself
-- sorts by least to greatest as default. 
-- ASC - least to greatest
-- DESC - greatest to least
-- ASC and DESC are used after what we are ordering by. So "rating" DESC or "votes" DESC


-- Top 10 books by rating (incorrectly)
-- This doesn't work as it's going from smallest rating to larger ratings.
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" LIMIT 10;

-- Top 10 books by rating (correctly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" DESC LIMIT 10;

-- Ordering by more than one column
-- as there is a tie for ratings, we can break this down by adding in a second order by 
SELECT "title", "rating", "votes" FROM "longlist" 
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;



-- Ordering with a condition
SELECT "title", "rating" FROM "longlist" 
WHERE "votes" > 10000 ORDER BY "rating" DESC 
LIMIT 10;