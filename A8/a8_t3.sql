/*  SCHEMAS
    Artists(id, name, birthDate, deathDate, bio)
    Collections(title, topic)
    Exhibitions(title, topic, room, startDate, endDate)
    Advertisements(exhibitionTitle, date, mediumName, cost, duration)
    Media(name, type)
    InfluencedBy(influenceeId, influencerId)
    ExhibitedAt(artifactId, exhibitionTitle)
    Artifacts(id, title, description, value, year, artistId, collectionTitle, collectionDate)
    ArtifactPaintings(id, canvas)
    ArtifactSculptures(id, material, color)
*/
-- 1. For every exhibition end date (if set) must be after its start date. Same holds for artists’ death and birth dates.
CREATE TABLE Exhibitions (
    title VARCHAR(50) PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    room VARCHAR(10) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE CHECK (startDate < endDate OR endDate is NULL));

CREATE TABLE Artists (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthDate DATE,
    deathDate DATE CHECK (birthDate < deathDate OR endDate is NULL),
    bio TEXT);

-- 2. Adding an unavailable artifact to an exhibition is not allowed if the dates of the two exhibitions overlap.
--    Hint: use a trigger, the easiest way to prevent the insertion is to set a NOT NULL attribute to NULL, 
--    and let the primary key constraint cancel the insertion of the artifact.
CREATE TRIGGER ArtifactsOverlappingExhibitons
    BEFORE INSERT ON ExhibitedAt
    REFERENCING NEW ROW AS newex
    FOR EACH ROW
    WHEN (0 <  (SELECT COUNT(title)
                FROM Exhibitions
                WHERE title IN (SELECT exhibitionTitle FROM ExhibitedAt WHERE newex.artifactId = artifactId)
                    AND endDate > (SELECT startDate FROM Exhibitions WHERE newex.exhibitionTitle = title)
                ))
    SET newex.artifactId = NULL;
    
-- 3. When a collection is deleted, all its artifacts should be automatically moved to the special collections 
--    with title ”General paintings” and ”General sculptures”, according to their type.
CREATE TRIGGER lostCollection
    BEFORE DELETE ON Collections
    REFERENCING OLD ROW AS oldcol
    FOR EACH ROW
    UPDATE FROM Artifacts SET collectionTitle = 'General paintings'
            WHERE old.col = collectionTitle AND id IN (SELECT id FROM ArtifactPaintings)
    AND 
    UPDATE FROM Artifacts SET collectionTitle = 'General sculptures'
            WHERE old.col = collectionTitle AND id IN (SELECT id FROM ArtifactSculptures)

-- 4. The museum keeps track of the total advertizing cost every artifact has received, 
--    i.e., the total amount of money spend to advertize the exhibitions it has appeared over the years. 
--    The information is stored inside table AdPerArtifact(id, cost); 
--    assume that the table already contains an entry for every artifact, even with 0 cost.
CREATE TRIGGER adcostsofartifacts
    AFTER INSERT ON Advertisements
    REFERENCING NEW ROW AS newad
    FOR EACH ROW
    UPDATE AdPerArtifact SET cost = cost + newad.cost
        WHERE id IN (SELECT artifactId FROM ExhibitedAt
                    WHERE newad.exhibitionTitle = exhibitionTitle)

CREATE TRIGGER adcostsofartifacts
    AFTER UPDATE OF cost ON Advertisements
    REFERENCING NEW ROW AS newad
    REFERENCING OLD ROW AS oldad
    FOR EACH ROW
    UPDATE AdPerArtifact SET cost = cost + newad.cost - oldad.cost
        WHERE id IN (SELECT artifactId FROM ExhibitedAt
                    WHERE newad.exhibitionTitle = exhibitionTitle)

CREATE TRIGGER adcostsofartifacts
    BEFORE DELETE OF cost ON Advertisements
    REFERENCING OLD ROW AS oldad
    FOR EACH ROW
    UPDATE AdPerArtifact SET cost = cost - oldad.cost
        WHERE id IN (SELECT artifactId FROM ExhibitedAt
                    WHERE newad.exhibitionTitle = exhibitionTitle)



-- 5. The museum has a fixed budget of 5000 Euros per month for advertizing on the web. 
--    After exceeding this budget for current month no new ad can be posted.
--    int: one way to keep only the month from a date is using the EXTRACT function.
CREATE TRIGGER budgetads
    INSTEAD OF INSERT ON Advertisements
    REFERENCING NEW ROW AS newad
    FOR EACH ROW 
    INSERT ON Advertisements
    WHERE 5000 - newad.cost <= (SELECT SUM(cost) FROM Advertisements WHERE date = newad.date) 
