/*

*/
CREATE TABLE Artifacts (
    id              INT,
    title           VARCHAR(40),
    description     VARCHAR(60),
    value           INT,
    year            DATE,
    artistId        INT,
    collectionTitle VARCHAR(40),
    collectionDate  DATE
)

CREATE TABLE ArticactPaintings(
    id              INT,
    canvas          VARCHAR(30)
)

CREATE TABLE ArticactSculptures(
    id              INT,
    material        VARCHAR(30),
    color           VARCHAR(30)
)

CREATE TABLE Artists(
    id              INT,
    name            VARCHAR(30),
    birthDate       DATE,
    deathDate       DATE,
    bio             VARCHAR(100)
)

CREATE TABLE Collections(
    title           VARCHAR(40),
    topic           VARCHAR(40)
)

CREATE TABLE Exhibitions(
    title           VARCHAR(40),
    topic           VARCHAR(40),
    room            VARCHAR(15),
    startDate       DATE,
    endDate         DATE
)

CREATE TABLE Advertisements(
    exhibitionTitle VARCHAR(40),
    date            DATE,
    mediumName      VARCHAR(40),
    cost            FLOAT,
    duration        INT     
)

CREATE TABLE Media(
    name            VARCHAR(40), 
    type            VARCHAR(40)
)

CREATE TABLE InfluencedBy(
    influenceeId    VARCHAR(30),
    influencerId    VARCHAR(30)
)

CREATE TABLE ExhibitedAt(
    artifactId      INT,
    exhibitionTitle VARCHAR(40)
)