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
    WHERE   mediumName = 'newspaper';

-- 2. DONE Which artifacts (their id) have never been part of an exhibition?
    SELECT  id
    FROM    Artifacts
    WHERE   id NOT IN (SELECT  artifactId
                            FROM    ExhibitedAt);

-- 3. DONE Increase by 10% the value of sculptures with color either ‘white’ or ‘green’.
    UPDATE  Artifacts
    SET     value = value*1.1
    WHERE   id IN   (   SELECT id
                        FROM ArtifactSculptures
                        WHERE color = 'white' OR color = 'green');

-- 4. Which percentage of paintings are currently in some exhibition?
    SELECT  id
    FROM    ArtifactPaintings


-- 5. Display artists (their id) that have been influenced by at most 2 other artists; 
-- display the number of influences. Remember to include artists with no influences.
    SELECT  influenceeId, COUNT(influenceeId) as freq
    FROM    InfluencedBy
    GROUP BY influenceeId
    WHERE   freq < 3;

-- 6. Move upcoming exhibitions that include paintings from ‘Vincent Van Gogh’ to room ‘03-500’. 
    SELECT  

-- 7. DONE Which sculptures (their ids) were part of some exhibition in 2018?
    SELECT  id
    FROM    ArtifactSculptures
    WHERE   id IN ( SELECT  artifactId 
                    FROM   ExhibitedAt
                    WHERE   exhibitionTitle IN ( SELECT  title 
                                            FROM    Exhibitions 
                                            WHERE   startDate >'2017-12-31'));

