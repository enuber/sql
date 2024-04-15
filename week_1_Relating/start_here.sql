-- sqlite3 <databasename>
-- once in sqlite>  you can see what is inside you can use .tables to see a list of the tables inside the db. This is apart of sqllite...
-- Relational DB - we have multiple tables. The tables have some relationship between them. One table may be authors one may be books. So how do we know what author wrote what book.
-- Author writes only one book it's considered one to one relationship
-- Author writes many books it's considered one to many relationship
-- Author writes many books and some books are written by multiple authors, this is a many to many relationship

-- In our DB we have authors, publishers, ratings, translators...etc. These are the entities. Things we are trying to represent.
-- when diagraming this out, we have different types of lines between the entities. This is how we can represent relationships.
--  Diagraming helps show the relationships. So when you design a DB you could design it so you can show others what the relationships are in this way.

--    -----O-  this is zero has nothing that relates
--    -----|-  this is one has one thing than relates
--    -----<-  (should look like crows foot with three lines) but means many
--    -----O-<- could be combined where could be zero or many like a book doesn't need a transltor but could also end up with many translators.

-- ex: Author -|-----|- Book - an author writes one book and a book has to have one author
-- ex: Author ->------<- Book - an author can write at least one book but they could write many and a book can be written by at least one author but could be written by multiple authors

-- Keys - idea in DB where we relate tables from one to another.
-- Primary Key - ISBN for books where each book has a unique number that relates to one book. 
-- Foreing Key - Taking a primary key from one table and including it in a column of another table. Like taking the ISBN and putting it into a ratings table. Then when you want to know the rating for a book with an ISBN, we can take that ISBN and search the ratings table to then get the ratio.

-- if we take the primary key and relate it to something simpler like for ISBN which is like 16 digits + dashes and just say that the first book is book 1 and second is book 2 and so forth, we are creating our own primary key. So now we have an "id" and can use that as long as they are unique.

-- many-to-many relationship - say we have a table of authors where each author has a unique id and a table of books also has a unique id. So we have author_id and book_id that are primary keys. So if we had an Authored table that had just two columns of author_id and book_id, we can denote what author wrote what book by the two id's this would also allow an author to represent multiple books and for books with multiple authors, it can also easily be shown.
