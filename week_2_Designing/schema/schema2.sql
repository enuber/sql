-- Table constraint - some values have to be a certain way. Like a primary key must be unique. In our case they must be integers. A foreign key must be inside another table otherwise violate the constraint of having a foreign key. 

-- Primary Keys 
-- Foreign Keys


-- Adds primary and foreign key table constraints
-- Creates mbta.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";
DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "cards";

-- Creates tables with updated schema
-- PRIMARY KEY("id") - sets the primary key in this table so the schema knows what value to look at and the "id" has the table constraint set up.
CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT,
    "line" TEXT,
    PRIMARY KEY("id")
);

-- joint PRIMARY KEY constraint - PRIMARY KEY("rider_id", "station_id") - this would mean that if the same rider_id and station_id were used in a second row, there would be a constraint violation. Every row of the combination has to have unique id's. This is not the best scenario as we want a rider to be able to visit a station more than one time. 
--  FOREIGN KEY("rider_id") REFERENCES "riders"("id") - To make foreign key y9ou need to use the reference so it knows how to hook it up properly. 
CREATE TABLE "visits" (
    "rider_id" INTEGER,
    "station_id" INTEGER,
    FOREIGN KEY("rider_id") REFERENCES "riders"("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
);
