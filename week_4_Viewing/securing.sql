-- Part 4
-- Some columns may not be shared with anyone else. Common pracitce in security is to only give someone the information they need to know. Views allow you to reduce the number of columns someone might see.

-- PII / GDPR - personal identifiable information. 

-- in a ride sharing database "riders" would be considered PII as it has the name of person that took the ride. 

-- ANONYMOUS -  "Anonymous" fills a column with anonymous to indicate that info is there but you don't have access to see what is there. 

-- Demonstrates views for securing data
-- Uses rideshare.db

CREATE TABLE "rides" (
    "id" INTEGER,
    "origin" TEXT NOT NULL,
    "destination" INTEGER NOT NULL,
    "rider" TEXT NOT NULL,
    PRIMARY KEY("id")
);

INSERT INTO "rides" ("origin", "destination", "rider")
VALUES
('Good Egg Galaxy', 'Honeyhive Galaxy', 'Peach'),
('Castle Courtyard', 'Cascade Kingdom', 'Mario'),
('Metro Kingdom', 'Mushroom Kingdom', 'Luigi'),
('Seaside Kingdom', 'Deep Woods', 'Bowser');

-- Reveals all rides information
SELECT * FROM "rides";

-- Reveals only subset of columns
-- Could do this to create a table that omits the riders column.
SELECT "id", "origin", "destination" FROM "rides";

-- Makes clear that rider is anonymous
-- Anonymous leaves the riders column but fills it with "anonymous" so you don't see the names. 
SELECT "id", "origin", "destination", 'Anonymous' AS "rider" FROM "rides";

-- Creates a view
-- Stores this in a view called analysis. 
CREATE VIEW "analysis" AS
SELECT "id", "origin", "destination", 'Anonymous' AS "rider" FROM "rides";

-- Queries the view
SELECT "origin", "destination", "rider" FROM "analysis";

-- You can't set access controls so this data isn't very protected as still can query the "rides" table and get the rider name list if somoene really wanted to. Doing "anonymous" offers basic security as long as someone doesn't decide to just query the main table. 
