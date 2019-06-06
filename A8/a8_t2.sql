/* 
    VIEW 1 for all the paintings 
    - often queries only on the paintings not all artifacts
    - a lot of artifacts and paintings -> query would need a lot of processing power every time 
    - use cases: 
        - exhibitions of (specific) paintings searched
    - materialized because
        - not often modified just often adding entries
        - queries often only on painings and materialized views make queries faster
        - (periodically recomputings not an issue)
*/
CREATE MATERIALIZED VIEW Paintings AS
    SELECT *
    FROM ArtifactPaintings, Artifacts
    WHERE ArtifactPaintings.id = Artifacts.id;

/* 
    VIEW 2 for all the artifacts that are going to be exhibited
    - queries often on only upcoming exhibitons
    - when database used for a longer time, there would be al lot of exhibitions -> query slow
    - use cases: 
        - upcoming exhibitons sorted by number of artifacts?
        - which artifacts are not in an planned exhibition?
    - not materialized because:
        - often modified (room, artifact, duration, ...)
        - a lot of columns to save duplicated
        - (periodically recomputings could be not exact enough)
*/
CREATE MATERIALIZED VIEW UpcomingExhibition AS
    SELECT * 
    FROM ExhibitedAt, Exhibitions, Artifacts
    WHERE   ExhibitedAt.artifactId = Artifacts.id 
            AND ExhibitedAt.exhibitionTitle = Exhibitions.title 
            AND Exhibitions. startDate > CURDATE());  
