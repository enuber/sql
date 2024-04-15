-- Subqueries - nested query. Puts one query inside another.
-- one to many - if you have a table of books with an publisher_id and title, then you have a publishers table with the publishers_id and list of publishers that they go with. So you need to first query publishers to get the publisher_id to get the correct publisher that the ID is associated to and then look at the book table and use that ID to then get the books published by that publisher. 

-- Below is how we would think this out. 
  SELECT "id" FROM "publishers" WHERE "publisher" = 'Fitzcarraldo Editions';
  SELECT "title" FROM "books" WHERE "publisher_id" = 5;

-- Corrected to subquery
-- Note that we start the first query and then in () add the next query to nest it in. The first query is reliant on the second queries answer. So the second query is sending us back the publisher_id which is what the books table needs to get us the title(s).
-- Also you use indents to keep it clean and to show that the inner query is a separate query. Makes it more readable and understandable.
SELECT "title" FROM "books" 
WHERE "publisher_id" = (
  SELECT "id" FROM "publishers"
  WHERE "publisher" = 'Fitzcarraldo Editions'
);

-- For Many to Many 
SELECT "name" FROM "authors" WHERE 'id' = (
    SELECT "author_id" FROM "authored" WHERE "book_id" = (
        SELECT "id" FROM "books" WHERE "title" = "flights"
    )
);




-- Demonstrates subqueries
-- Uses longlist.db

-- Finds all books published by MacLehose Press, with hard-coded id
SELECT "id" FROM "publishers" WHERE "publisher" = 'MacLehose Press';

SELECT "title" FROM "books" WHERE "publisher_id" = 12;

-- Finds all books published by MacLehose Press, with a nested query
SELECT "title" FROM "books" WHERE "publisher_id" = (
    SELECT "id" FROM "publishers" WHERE "publisher" = 'MacLehose Press'
);


-- Finds all ratings for "In Memory of Memory"
SELECT "rating" FROM "ratings" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'In Memory of Memory'
);


-- Finds average rating for "In Memory of Memory"
SELECT AVG("rating") FROM "ratings" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'In Memory of Memory'
);



-- Finds author who wrote "The Birthday Party"
-- first find the id of a given book
SELECT "id" FROM "books" WHERE "title" = 'The Birthday Party';


-- use that id to now get the author_id 
SELECT "author_id" FROM "authored" WHERE "book_id" = (
    SELECT "id" FROM "books" WHERE "title" = 'The Birthday Party'
);

-- finally use all that to get the authors name(s)
SELECT "name" FROM "authors" WHERE "id" = (
    SELECT "author_id" FROM "authored" WHERE "book_id" = (
        SELECT "id" FROM "books" WHERE "title" = 'The Birthday Party'
    )
);



-- Finds all books by Fernanda Melchor, using IN
-- IN - used to say maybe some key or column is in some set of values. Not equal to just one. So multiple values where = refers to just one
-- Use = if know you only have one of something. Use IN if you may or know there are multiple of something.


-- here we are just getting one author
SELECT "id" FROM "authors" WHERE "name" = 'Fernanda Melchor';


-- getting books authored by this specific author. Which in this case we get two books.
SELECT "book_id" FROM "authored" WHERE "author_id" = (
    SELECT "id" FROM "authors" WHERE "name" = 'Fernanda Melchor'
);

-- using IN we now will get the title of books for the multiple books that were authored by a specific author.
SELECT "title" FROM "books" WHERE "id" IN (
    SELECT "book_id" FROM "authored" WHERE "author_id" = (
        SELECT "id" FROM "authors" WHERE "name" = 'Fernanda Melchor'
    )
);

-- Uses IN to search for multiple authors
SELECT "title" FROM "books" WHERE "id" IN (
    SELECT "book_id" FROM "authored" WHERE "author_id" IN (
        SELECT "id" FROM "authors" WHERE "name" IN ('Fernanda Melchor', 'Annie Ernaux')
    )
);
