-- Database - a collection of data organized for creating, reading, updating and delting. (CRUD)
-- Database Mangement System - software via which you can interact with a database
-- examples of DMS - MySQL, Oracle, PostgresSQL, SQLite...
-- why you choose one or another... one may cost more money but you get more support. Or you may have open software that are free but you are responisble for implememtig the DB. some are heavier weight but have more fetures. Or less features but allows you to do most of what others do. 
-- SQL - a language via which you can CRUD in a database. Stands for structured query langauge. 
-- Querying - asking questions of data. 
-- ex of query... are daily users growing, which songs are played the most...


-- to open a databasein SQLite, use ... sqlite3 longlist.db, will change the prompt to sqlite> 
-- .exit or .quit to quit out


-- use ctrl-l to clear the terminal
-- how do we find out what data is in the database?
-- to do this we need to use SELECT a keyword that lets us select some rows, or all the rows
-- use double quotes around table names and column names. These are SQL identifiers. For strings we use single quotes to denote the difference between what we are doing. 
-- it is convention to put keywords in captial letters. It still works without doing so.


-- Select all columns from "longlist" table
-- * means everything, FROM is another keyword used to tell SQL which table to select from. and finally is the name of the .db file.
SELECT * FROM "longlist";

-- Select "title" column from "longlist" table
-- title is the name of a column, so we can get less data but shows everything in one column
SELECT "title" FROM "longlist";

-- Select "title" and "author" column from "longlist" table
-- notice the comma separating this query so you can get back multiple columns
SELECT "title", "author" FROM "longlist";

-- Select "title", "author", and "translator" column from "longlist" table
SELECT "title", "author", "translator" FROM "longlist";