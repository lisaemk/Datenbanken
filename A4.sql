/*  SCHEMAS
    Artifacts(id, title, description, value, year, artistId, collectionTitle, collectionDate)
    ArtifactPaintings(id, canvas)
    ArtifactSculptures(id, material, color)
    Artists(id, name, birthDate, deathDate, bio)
    Collections(title, topic)
    Exhibitions(title, topic, room, startDate, endDate)
    Advertisements(exhibitionTitle, date, mediumName, cost, duration)
    Media(name, type)
    InfluencedBy(influenceeId, influencerId)
    ExhibitedAt(artifactId, exhibitionTitle)
*/

/*
    Task 2
*/

-- 1. DONE What is the total cost for advertising per exhibition in newspapers?
    SELECT  SUM(cost)
    FROM    Advertisements
    WHERE   mediumName = name AND type = 'newspaper'
    GROUP BY exhibitionTitle;

-- 2. DONE Which artifacts (their id) have never been part of an exhibition?
    SELECT  id
    FROM    Artifacts
    WHERE   id NOT IN (SELECT  artifactId FROM ExhibitedAt);

-- 3. DONE Increase by 10% the value of sculptures with color either ‘white’ or ‘green’.
    UPDATE  Artifacts
    SET     value = value*1.1
    WHERE   id IN   (   SELECT id
                        FROM ArtifactSculptures
                        WHERE color = 'white' OR color = 'green');

-- 4. Which percentage of paintings are currently in some exhibition?
-- COUNT(*) zählt alle Reihen in der Tabelle
    SELECT  100*COUNT(*)/SELECT COUNT(*) FROM ArtifactPaintings)
    FROM    ArtifactPaintings P, ExhibitedAt A, Exhibitions E
    WHERE P.id = A.artifactId AND A.exhibitionTitle = E.title AND E.startDate <= CURDATE() AND E.endDate >= CURDATE();


-- 5. Display artists (their id) that have been influenced by at most 2 other artists; 
-- display the number of influences. Remember to include artists with no influences.
    SELECT  influenceeId, COUNT(influencerId)
    FROM    Artists LEFT JOIN InfluencedBy ON id = influenceeId
    GROUP BY id
    HAVING COUNT(influencerId) <= 2;

-- 6. Move upcoming exhibitions that include paintings from ‘Vincent Van Gogh’ to room ‘03-500’. 
    UPDATE Exhibitions
    SET room = '03-500'
    WHERE EXISTS (SELECT * FROM ExhibitedAt, ArtifactPaintings, Artists, Artifacts
        WHERE ExhibitedAt.artifactId = Artifacts.id AND Artifacts.id = ArtifactPaintings.id AND Artifacts.artistId = Artists.id
        AND Artists.name = 'Vincent Van Gogh' AND ExhibitedAt.exhibitionTitle = Exhibitions.title AND Exhibitions. startDate > CURDATE());  

-- 7. DONE Which sculptures (their ids) were part of some exhibition in 2018?
    SELECT  id
    FROM    ArtifactSculptures
    WHERE   id IN ( SELECT  artifactId 
                    FROM   ExhibitedAt
                    WHERE   exhibitionTitle IN ( SELECT  title 
                                            FROM    Exhibitions 
                                            WHERE   startDate >'2017-12-31'));

