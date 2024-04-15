-- Import into an existing table using a CSV without primary keys
-- because we now took out the id so that SQL will do that automatically the schema doesn't match up to the import file csv as there are less columns than the schema. 

-- for this we import the data into a temp table and then take that data and put it into the table we want.

-- so we do the below. We don't add the --skip 1 because we want to take advantage of the header row. SQLite will take that header row and create the schema based off of that so we would get a temp file with ("title" text, "accession_number" text, "acquired" text) as the column names.
.import --csv mfa.csv temp

-- now we do this to move the temp into the collections table. 
INSERT INTO "collections" ("title", "accession_number", "acquired") 
SELECT "title", "accession_number", "acquired" FROM "temp";

-- then we no longer need the temp table so can use this to remove the table.
DROP TABLE "temp";