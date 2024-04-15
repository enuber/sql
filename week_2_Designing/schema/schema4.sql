-- Charile Cards - are used in Boston to track fair, balance. you swipe them in. So we will use this to make the schema more efficient. 

-- So how to improve the schea, so now we have entities of CARD -|---O-<- SWIPE ->-O---|- STATION, a card may be swiped many times at different stations. A Swipe can only happen at a single time and being used at a single station. 

-- ALTER TABLE - allows us to alter a table without DROPing the table
    -- RENAME TO ...
    -- ADD COLUMN ...
    -- RENAME COLUMN ... TO ...
    -- DROP COLUMN ...


-- Updates schema to represent CharlieCard usage
-- Creates mbta.db

-- Delete sprior tables if they exist
DROP TABLE IF EXISTS "riders";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "visits";
DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "cards";

-- Creates tables with updated schema
CREATE TABLE "cards" (
    "id" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "line" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- ALTER TABLE "visits" RENAME TO "swipes";
-- ALTER TABLE "swipes" ADD COLUMN "ttpe" TEXT; <-- typo on purpose
-- ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";
-- ALTER TABLE "swipes" DROP COLUMN "type";
CREATE TABLE "swipes" (
    "id" INTEGER,
    "card_id" INTEGER,
    "station_id" INTEGER,
    "type" TEXT,
    "datetime" NUMERIC,
    "amount" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id"),
    FOREIGN KEY("card_id") REFERENCES "cards"("id")
);
