-- Data Types - 
-- Storage Classes - NULL, INTEGER, REAL, TEXT, BLOB these are set to individual values
    -- NULL - nothing
    -- INTEGER - WHole number
    -- REAL - decimal point/float number
    -- TEXT - characters
    -- BLOB - Binary large object. data exactly as I give it, can be used for images, audio files, video files things that have structure we don't want to mess with.
-- Storage classes - INTEGER may sound like a data-type but, can hold several different data types. Like 0-byte integer, 1-byte integer...etc. SQLite takes care of what data type is used in the storage class. So the storage class is the umbrella that covers all the data types.

-- Type Affinities - columns don't always store one particular type. They will try to convert some value inserted into the type they have the affinity for. These are associated to columns.
    -- REAL - nothing
    -- INTEGER - WHole number
    -- NUMERIC - either integer or real values
    -- TEXT - characters
    -- BLOB - Binary large object. 

-- if you insert a value that is one one storage class into a column that has a different type of affinity it will be converted. So if you have a text string that has a number like "10" and put it into a column with a numeric affinity, it will be converted to the acutal number 10 instead of being a string of "10".

-- NOTE: instead of doing every step in the terminal, you can create a schema.sql file where the keywords are then syntax highlighted so you know what is going on inside of the file. 
    -- .read ./schema/schema1.sql - to run the commands inside the file, you can do this in the terminal when sqlite> is showing. 


-- Adds type affinities
-- Creates mbta.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";
DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "cards";

-- Creates tables with updated schema
--  will need to use the "drop table" from above to redo the table. 
-- DROP TABLE "riders"; - this will remove this table
CREATE TABLE "riders" (
    "id" INTEGER,
    "name" TEXT
);

-- name will be name of station and line is what line it is like blue line or red line
CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT,
    "line" TEXT
);

CREATE TABLE "visits" (
    "rider_id" INTEGER,
    "station_id" INTEGER
);
