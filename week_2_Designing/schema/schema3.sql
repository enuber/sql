-- Column Contraint. - applies to a single column. Like having certain data inside it
    -- CHECK - check to be sure something happens like this amount is greater than zero.
    -- DEFAULT - if a value isn't supplied use a default
    -- NOT NULL - can't insert Null or empty values
    -- UNIQUE - every row in the column is unique value.

-- Adds UNIQUE, NOT NULL as column constraints
-- Creates mbta.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";
DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "cards";

-- Creates tables with updated schema
-- when you apply the primary key to the id you are already applying column constraints so you don't have to add them. This also is the same for the foreign keys down below. 
CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "line" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "visits" (
    "rider_id" INTEGER,
    "station_id" INTEGER,
    FOREIGN KEY("rider_id") REFERENCES "riders"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);
