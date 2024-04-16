-- Part 4
-- Some columns may not be shared with anyone else. Common pracitce in security is to only give someone the information they need to know. Views allow you to reduce the number of columns someone might see.

-- PII / GDPR - personal identifiable information. 

-- in a ride sharing database "riders" would be considered PII as it has the name of person that took the ride. 


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
SELECT "id", "origin", "destination" FROM "rides";

-- Makes clear that rider is anonymous
SELECT "id", "origin", "destination", 'Anonymous' AS "rider" FROM "rides";

-- Creates a view
CREATE VIEW "analysis" AS
SELECT "id", "origin", "destination", 'Anonymous' AS "rider" FROM "rides";

-- Queries the view
SELECT "origin", "destination", "rider" FROM "analysis";
