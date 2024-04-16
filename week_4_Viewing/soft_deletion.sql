-- Part 5
-- use a deleted column to 0 or 1 to represent it's been deleted but keeping the info in the table. 

-- Soft deletions
-- mfa.db

-- View data
SELECT * FROM "collections";

-- View updated schema of collections table
.schema collections

-- Add a "deleted" column to "collections" table
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- View data
-- will now show the new deleted columnn.
SELECT * FROM "collections";

-- View updated schema of collections table
.schema collections

-- Instead of deleting an item, update its deleted column to be 1
UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';

-- Select all items from collections that are not deleted
-- removes the soft deleted column
SELECT * FROM "collections" WHERE "deleted" = 0;

-- Create a view with the same name as the collections table
-- creating a view where we are removing the soft deleted column 
CREATE VIEW "current_collections" AS
SELECT "id", "title", "accession_number", "acquired" FROM "collections" WHERE "deleted" = 0;

-- Select all from collections to see non-deleted items
SELECT * FROM "current_collections";

-- Fail to delete an item from the view
-- can't delete data because it is a view. same as why we can't update/insert.
DELETE FROM "current_collections" WHERE "title" = 'Imaginative landscape';

-- Create trigger to delete items from a view
-- create a trigger that will allow us to do the soft delete where it's actually do this on the table we go the data from.

-- INSTEAD OF - key phrase that lets us do something rather than what normally would happen.
-- FOR EACH ROW - tells us where to run the statement between the BEGIN and END on...

-- OLD."id" gives us the id of what we are referring to. The row we would have deleted so we have access to it with "OLD"
CREATE TRIGGER "delete"
INSTEAD OF DELETE ON "current_collections"
FOR EACH ROW
BEGIN
    UPDATE "collections" SET "deleted" = 1 WHERE "id" = OLD."id";
END;

-- Create trigger to revert an item's deletion
-- Trigger when we want to insert.
-- WHEN - a keyword to check if a condition is true. in this way, we can check to see if it exists and then udpate what we need to or, if it doesn't exist we can add a whole new item as shown below.
-- accession_number is a unique idea from the museum that references a piece of art. Different than our primary key ID.
CREATE TRIGGER "insert_when_exists"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW 
WHEN NEW."accession_number" IN (SELECT "accession_number" FROM "collections")
BEGIN
    UPDATE "collections" SET "deleted" = 0 WHERE "accession_number" = NEW."accession_number";
END;

-- Create trigger to insert a new item to collections
CREATE TRIGGER "insert_when_new"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW
WHEN NEW."accession_number" NOT IN (SELECT "accession_number" FROM "collections")
BEGIN
    INSERT INTO "collections" ("title", "accession_number", "acquired")
    VALUES (NEW."title", NEW."accession_number", NEW."acquired");
END;

INSERT INTO "current_collections" ("title", "accession_number", "acquired")
VALUES ("Imaginative landscape", '56.496', NULL);