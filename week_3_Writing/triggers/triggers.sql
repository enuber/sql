-- sqlite3 mfa.db
-- .read schema.sql

-- example - if you have two tables, a collection and a transactions table, if you removed a piece of art from the collections table, it would then appear in the transactions table as sold. This could be accomplished with a trigger.

-- CREATE TRIGGER <name>
-- AFTER or BEFORE - tells it when the trigger should happen.
-- INSERT ON <table> or UPDATE OF <column> ON <table> or DELETE ON <table>
-- FOR EACH ROW - should happen for each row it should happen on. 
-- BEGIN - here comes a statement I want to run 
-- END; - is the end when the statement is done.

-- Demonstrates triggers on delete and insert
-- Uses mfa.db

-- Creates a table to track buying and selling of items from collections
-- adding a transactions table to the schema. 
CREATE TABLE "transactions" (
    "id" INTEGER,
    "title" TEXT,
    "action" TEXT,
    PRIMARY KEY("id")
);

-- Creates a trigger to log selling items from collections
-- will run before you delete query...do this statement
-- OLD - is a keyword where we get access to the info that in this case was just deleted.
-- so old."title" gives us access to the title of the item just sold. 
-- notice the multiple ; one after the statement to end the statement and one after end
CREATE TRIGGER "sell" 
BEFORE DELETE ON "collections"
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;

-- Lists existing triggers
.schema

-- Deletes from collections
-- doing a normal delete will make the trigger happen.
DELETE FROM "collections" WHERE "title" = 'Profusion of flowers';

-- Creates a trigger to log buying items
-- NEW is a keyword that gives us access to the piece that was just added. so New."title" gives us the correct title.
CREATE TRIGGER "buy" 
AFTER INSERT ON "collections"
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", 'bought');
END;

-- Adds item to collections
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Profusion of flowers', '56.257', '1956-04-12');
