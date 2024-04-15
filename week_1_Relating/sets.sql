-- Sets - when you run a query you get back a set of values. 

-- ex. If we are looking at a set of Authors and a set of translators, what is the area where they overlap called? This is where Authors and Translators "intersect". Done with the INTERSECT keyword
-- If a diagram was full of color with an intersection this would mean you are either an Author, Translator, or both. This is a UNION.
-- If you are in the set that shows just authors but not intersecting with translators and not a translator it means you are only an author and can't also be a translator. This is done using the EXCEPT keyword So would be Authors EXCEPT Translators
-- if you are either an author or translator but not in the area where they intersect.


-- either authors or translators
SELECT "name" FROM "translators";
SELECT "name" FROM "authors";

-- gives us the full list of authors and translators but only one time each. 
SELECT "name" FROM "translators"
UNION
SELECT "name" FROM "authors";


-- Demonstrates set operations
-- Uses longlist.db

-- UNION
-- Selects all authors, labeling as authors
-- gives back two columns that shows just the authors. 
SELECT 'author' AS "profession", "name" FROM "authors";

-- Selects all translators, labeling as translators
SELECT 'translator' AS "profession", "name" FROM "translators";

-- Combines authors and translators into one result set
-- will give two columns with all authors/translators listed.
SELECT 'author' AS "profession", "name" FROM "authors";
UNION
SELECT 'translator' AS "profession", "name" FROM "translators";

-- INTERSECT (Assume names are unique)
-- Finds authors and translators
-- shows who is both an author and translator
SELECT "name" FROM "authors"
INTERSECT
SELECT "name" FROM "translators";

-- Finds books translated by Sophie Hughes
-- just one author at this point
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE name = 'Sophie Hughes'
);

-- Finds books translated by Margaret Jull Costa
-- just the other author at this point. 
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE name = 'Margaret Jull Costa'
);

-- Finds intersection of books
-- Remember INTERSECT is the area where two things overlap so we are looking if these two have translated any books together.
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE name = 'Sophie Hughes'
)
INTERSECT
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE name = 'Margaret Jull Costa'
);

-- Finds intersection of books
SELECT "title" FROM "books" WHERE "id" = (
    SELECT "book_id" FROM "translated" WHERE "translator_id" = (
        SELECT "id" FROM "translators" WHERE name = 'Sophie Hughes'
    )
    INTERSECT
    SELECT "book_id" FROM "translated" WHERE "translator_id" = (
        SELECT "id" FROM "translators" WHERE name = 'Margaret Jull Costa'
    )
);

-- EXCEPT (Assume names are unique)
-- Finds translators who are not authors
-- this gives us a list of that doesn't include people that are both author and translator
SELECT "name" FROM "translators"
EXCEPT
SELECT "name" FROM "authors";
