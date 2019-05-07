/*
    TASK 1
*/
CREATE TABLE Artifacts (
    id              INT PRIMARY KEY,
    title           VARCHAR(40),
    description     TEXT,
    value           FLOAT,
    year            YEAR,
    artistId        INT,
    collectionTitle VARCHAR(40) NOT NULL,
    collectionDate  DATE NOT NULL
);

CREATE TABLE ArtifactPaintings(
    id              INT PRIMARY KEY,
    canvas          VARCHAR(30)
);

CREATE TABLE ArtifactSculptures(
    id              INT PRIMARY KEY,
    material        VARCHAR(30),
    color           VARCHAR(30)
);

CREATE TABLE Artists(
    id              INT PRIMARY KEY,
    name            VARCHAR(30) NOT NULL, 
    birthDate       DATE,
    deathDate       DATE,
    bio             TEXT
);

CREATE TABLE Collections(
    title           VARCHAR(40) PRIMARY KEY,
    topic           VARCHAR(40)
);

CREATE TABLE Exhibitions(
    title           VARCHAR(40) PRIMARY KEY,
    topic           VARCHAR(40),
    room            VARCHAR(15) NOT NULL,
    startDate       DATE,
    endDate         DATE
);

CREATE TABLE Advertisements(
    exhibitionTitle VARCHAR(40),
    date            DATE,
    mediumName      VARCHAR(40),
    cost            FLOAT,
    duration        INT,
    PRIMARY KEY (exhibitionTitle, date, mediumName)     
);

CREATE TABLE Media(
    name            VARCHAR(40) PRIMARY KEY, 
    type            ENUM
);

CREATE TABLE InfluencedBy(
    influenceeId    INT,
    influencerId    INT,
    PRIMARY KEY (influenceeId, influencerId)
);

CREATE TABLE ExhibitedAt(
    artifactId      INT,
    exhibitionTitle VARCHAR(40),
    PRIMARY KEY (artifactId, exhibitionTitle)
);

/*
    TASK 2
*/
-- 1. exchange rate on May 4 
SELECT          title, (value*1.12) AS value_in_USD
FROM            Artifacts
WHERE           value < 11
ORDER BY        value;

-- 2. 
SELECT DISTINCT collectionTitle
FROM            Artifacts
WHERE           title LIKE '%sun%';

-- 3. 
SELECT          COUNT(exhibitionTitle) AS quantity
FROM            Advertisements
WHERE           exhibitionTitle = 'Dutch painters' AND mediumName = 'Daily Planet';

-- 4. TODO
SELECT          InfluencerId
FROM            InfluencedBy
GROUP BY        InfluencerId
HAVING          COUNT(*) > 9;

-- 5.
SELECT          mediumName, AVG(cost) AS average_cost
FROM            Advertisements
GROUP BY        mediumName;

-- 6.
SELECT          title, topic
FROM            Exhibitions
WHERE           startDate >= '20170601 00:00:00.000'
                AND endDate < '20171231 23:59:59.000';