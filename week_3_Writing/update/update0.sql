-- setup once in update folder
-- sqlite3 mfa.db
-- .read schema.sql

-- UPDATE table
-- SET <column(s)>
-- WHERE condition;

-- Demonstrates updating authorship
-- Uses mfa.db

-- Updates authorship (incorrectly) DO NOT DO THIS
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Li Yin'
);

-- Updates authorship (correctly) for a piece with a previously unknown authorship
-- this is correct way to update in created where we update the artist_id where the collection_id matches the piece we want to update. 
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Li Yin'
)
WHERE "collection_id" = (
    SELECT "id" FROM "collections"
    WHERE "title" = 'Farmers working at dawn'
);
