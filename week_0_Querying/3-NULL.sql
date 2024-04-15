-- NULL - the value doesn't exist, IS NULL - value is not there or IS NOT NULL - value is there.

-- Books without a translator
SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NULL;

-- Books with a translator
SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NOT NULL;