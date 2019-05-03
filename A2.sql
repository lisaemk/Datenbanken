CREATE TABLE Artifacts (
    id              ,
    title           ,
    description     ,
    value           ,
    year            ,
    artistId        ,
    collectionTitle ,
    collectionDate  
)

CREATE TABLE ArticactPaintings(
    id              ,
    canvas
)

CREATE TABLE ArticactSculptures(
    id          ,
    material    ,
    color
)

CREATE TABLE Artists(
    id          ,
    name        ,
    birthDate   ,
    deathDate   ,
    bio
)

CREATE TABLE Collections(
    title   ,
    topic
)

CREATE TABLE Exhibitions(
    title       ,
    topic       ,
    room        ,
    startDate   ,
    endDate
)

CREATE TABLE Advertisements(
    exhibitionTitle     ,
    date                ,
    mediumName          ,
    cost                ,
    duration
)

CREATE TABLE Media(
    name            , 
    type
)

CREATE TABLE InfluencedBy(
    influenceeId        ,
    influencerId
)

CREATE TABLE ExhibitedAt(
    artifactId          ,
    exhibitionTitle
)