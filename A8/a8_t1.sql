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

DROP DATABASE IF EXISTS Museum;
CREATE DATABASE Museum;

DROP TABLE IF EXISTS Artifacts;
CREATE TABLE Artifacts (
    id INTEGER PRIMARY KEY,canvasid
    title VARCHAR(50) NOT NULL,
    description TEXT,
    value REAL,
    year YEAR,
    artistId INTEGER,
    collectionTitle VARCHAR(50) NOT NULL,
    collectionDate DATE NOT NULL)

    CONSTRAINT identify_artist
    FOREIGN KEY (artistId) 
    REFERENCES Artists(id)
    ON DELETE SET NULL      -- if the artist is not in the database the artifacts artist is unknown
    ON UPDATE CASCADE,      -- a new id of the artist should also 

    CONSTRAINT collection_name
    FOREIGN KEY (collectionTitle) 
    REFERENCES Collections(title) 
    ON DELETE SET NULL      -- not part of a collection, but database should still know the artifact
    ON UPDATE CASCADE;      -- renaming of collection should get copied to the artifact


DROP TABLE IF EXISTS ArtifactPaintings;
CREATE TABLE ArtifactPaintings (
    id INTEGER PRIMARY KEY,
    canvas VARCHAR(30) NOT NULL)

    CONSTRAINT identify_painting
    FOREIGN KEY (id) 
    REFERENCES Artifacts(id)
    ON DELETE CASCADE      -- every painting is an artifact. Not in Artifacts -> not in ArtifactPaintings
    ON UPDATE CASCADE;     -- the painting has to reference the same artifact as before -> copy the id

DROP TABLE IF EXISTS ArtifactSculptures;
CREATE TABLE ArtifactSculptures (
    id INTEGER PRIMARY KEY,
    color VARCHAR(30) NOT NULL,
    material VARCHAR(30) NOT NULL)

    CONSTRAINT identify_sculpture
    FOREIGN KEY (id) 
    REFERENCES Artifacts(id)
    ON DELETE CASCADE      -- every sculpture is an artifact. Not in Artifacts -> not in ArtifactSculptures
    ON UPDATE CASCADE;     -- the sculpture has to reference the same artifact as before -> copy the id

DROP TABLE IF EXISTS Artists;
CREATE TABLE Artists (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birthDate DATE,
    deathDate DATE,
    bio TEXT);

DROP TABLE IF EXISTS Collections;
CREATE TABLE Collections (
    title VARCHAR(50) PRIMARY KEY,
    topic VARCHAR(50) NOT NULL);

DROP TABLE IF EXISTS Exhibitions;
CREATE TABLE Exhibitions (
    title VARCHAR(50) PRIMARY KEY,
    topic VARCHAR(50) NOT NULL,
    room VARCHAR(10) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE);

DROP TABLE IF EXISTS Advertisements;
CREATE TABLE Advertisements (
    exhibitionTitle VARCHAR(50),
    date DATE,
    mediumName VARCHAR(30),
    cost REAL NOT NULL,
    duration INTEGER NOT NULL,
    PRIMARY KEY(exhibitionTitle, date, mediumName))
    
    CONSTRAINT exhib
    FOREIGN KEY (exhibitionTitle) 
    REFERENCES Exhibitions(title)
    ON DELETE CASCADE      -- you can not advertise an exhibition which does not exist
    ON UPDATE CASCADE;     -- if exhibitionsname change the reference from advertisement to the right exhibition should remain

    CONSTRAINT media_name
    FOREIGN KEY (mediumName) 
    REFERENCES Media(name)
    ON DELETE NO ACTION      -- even if medium does not exist old advertisments should know the name
    ON UPDATE CASCADE;     -- the ad has to reference the same medium as before even when it is renamed -> copy the new name

;

DROP TABLE IF EXISTS Media;
CREATE TABLE Media (
    name VARCHAR(30) PRIMARY KEY,
    type ENUM ('newspaper', 'radio', 'website'));

DROP TABLE IF EXISTS InfluencedBy;
CREATE TABLE InfluencedBy (
    influenceeId INTEGER,
    influencerId INTEGER,
    PRIMARY KEY(influenceeId, influencerId))
     
    CONSTRAINT influencee_id
    FOREIGN KEY (influenceeId) 
    REFERENCES Artists(id)
    ON DELETE CASCADE      -- you can not influence "no artist" -> delete the influence 
    ON UPDATE CASCADE      -- reference the same artist that is influenced

    CONSTRAINT influencer_id
    FOREIGN KEY (influencerId) 
    REFERENCES Artists(id)
    ON DELETE CASCADE      -- you can not be influenced by nobody -> delete the influence 
    ON UPDATE CASCADE      -- reference the same artist that influences
;

DROP TABLE IF EXISTS ExhibitedAt;
CREATE TABLE ExhibitedAt (
    artifactId INTEGER,
    exhibitionTitle VARCHAR(50),
    PRIMARY KEY(artifactId, exhibitionTitle))
     
    CONSTRAINT artifact_id
    FOREIGN KEY (artifactId) 
    REFERENCES Artifacts(id)
    ON DELETE CASCADE      -- if the artifact does not exist, it can not be exhibited -> delete the reference to exhibition 
    ON UPDATE CASCADE      -- reference the same artifact that is exhibited
;

-- Artists(id, name, birthDate, deathDate, bio)
INSERT INTO Artists VALUES (1, 'Vincent van Gogh', '1853-01-03', '1890-01-02', 'male dutch artist'); 
INSERT INTO Artists VALUES (2, 'Andy Warhol', '1928-05-12', '1987-03-13', 'male american pop artist'); 
INSERT INTO Artists VALUES (3, 'Frida Kahlo', '1907-06-12', '1954-11-02','mexican female artist'); 
INSERT INTO Artists VALUES (4, 'Jean Dubuffet', '1901-40-17', '1985-02-02', 'french male scuplure artist'); 
INSERT INTO Artists VALUES (5, 'Paul Klee', '1879-05-18', '1940-12-11','german male artist. art movements: Expressionism, Cubism, Surrealism and Abstraction');

-- Media(name, type)
INSERT INTO Media VALUES ( 'Radio One' , 'radio'); 
INSERT INTO Media VALUES ( 'Daily Planet' , 'newspaper'); 
INSERT INTO Media VALUES ( 'BBC' , 'website'); 
INSERT INTO Media VALUES ( 'Times' , 'newspaper'); 
INSERT INTO Media VALUES ( 'Post' , 'newspaper');

-- Collections(title, topic)
INSERT INTO Collections VALUES ( 'Van Gogh Collection' , 'artifacts by Vincent van Gogh'); 
INSERT INTO Collections VALUES ( 'Pop Art' , 'artifacts from pop art artist'); 
INSERT INTO Collections VALUES ( 'Sculptures' , 'sculptures from various artists'); 
INSERT INTO Collections VALUES ( 'Frida Kahlo Collection' , 'paintings of frida kahlo'); 
INSERT INTO Collections VALUES ( 'German artists' , 'paintings of german artists');

-- Exhibitions(title, topic, room, startDate, endDate)
INSERT INTO Exhibitions VALUES ( 'van Goghs paintings' , 'van Gogh' , '001' , '2018-05-11' , '2018-06-21'); 
INSERT INTO Exhibitions VALUES ( 'male artists' , 'man' , '002' , '2018-05-11' , '2018-06-21'); 
INSERT INTO Exhibitions VALUES ( 'female artists' , 'woman' , '001' , '2018-08-11' , '2018-09-21'); 
INSERT INTO Exhibitions VALUES ( 'sculptures' , 'all sculptures' , '003' , '2018-05-11' , '2018-06-21'); 
INSERT INTO Exhibitions VALUES ( 'paintings' , 'all paintings' , '003' , '2018-08-11' , '2018-09-21');

--     Artifacts(id, title, description, value, year, artistId, collectionTitle, collectionDate)
INSERT INTO Artifacts VALUES(1, 'the starry night' , 'painting of bridge in the night' , 1000000 , 1889 , 1 , 'Van Gogh Collection' , '2011-04-01'); 
INSERT INTO Artifacts VALUES(2, 'banana' , 'for the velvet underground' , 110000 , 1966 , 2 , 'Pop Art' , '2011-04-01'); 
INSERT INTO Artifacts VALUES(3, 'the broken column' , 'self portrait' , 120000 , 1944 , 3 , 'Frida Kahlo Collection' , '2000-04-01'); 
INSERT INTO Artifacts VALUES(4, 'diego and i' , 'self portrait ' , 130000 , 1945 , 3 , 'Frida Kahlo Collection' , '2013-04-01'); 
INSERT INTO Artifacts VALUES(5, 'red balloon' , 'compositional design' , 140000 , 1992 , 5 , 'German artists' , '2011-04-01'); 
INSERT INTO Artifacts VALUES(6, 'table de salon' , 'white sculpture' , 100000 , 1970 , 4 , 'Sculptures' , '2015-04-01'); 
INSERT INTO Artifacts VALUES(7, 'l accueillant' , 'sculpture in white and red' , 10000 , 1973 , 4 , 'Sculptures' , '2013-04-01');
INSERT INTO Artifacts VALUES(8, 'siphonus' , 'red white and blue sculpture' , 1000000 , 1971 , 4 , 'Sculptures' , '2014-04-01'); 
INSERT INTO Artifacts VALUES(9, 'tetonette' , 'concrete sculture' , 1000 , 1954 , 4 , 'Sculptures' , '2011-04-01'); 
INSERT INTO Artifacts VALUES(10,'gants no 23' , 'hand sculpture' , 100 , 1973 , 4 , 'Sculptures' , '2012-04-01');

-- ArtifactPaintings(id, canvas)
INSERT INTO ArtifactPaintings VALUES ( 1, 'canvas'); 
INSERT INTO ArtifactPaintings VALUES ( 2, 'canvas'); 
INSERT INTO ArtifactPaintings VALUES ( 3, 'oil'); 
INSERT INTO ArtifactPaintings VALUES ( 4, 'oil'); 
INSERT INTO ArtifactPaintings VALUES ( 5, 'oil');

-- ArtifactSculptures(id, material, color)
INSERT INTO ArtifactSculptures VALUES ( 6, 'white', 'wood'); 
INSERT INTO ArtifactSculptures VALUES ( 7, 'red','wood'); 
INSERT INTO ArtifactSculptures VALUES ( 8, 'silver','wood'); 
INSERT INTO ArtifactSculptures VALUES ( 9, 'grey','concrete'); 
INSERT INTO ArtifactSculptures VALUES ( 10, 'white','metal');

-- Advertisements(exhibitionTitle, date, mediumName, cost, duration)
INSERT INTO Advertisements VALUES ( 'van Goghs paintings', '2018-01-23', 'Daily Planet', 1000 , 10); 
INSERT INTO Advertisements VALUES ( 'van Goghs paintings', '2018-02-24', 'Radio One', 2000 , 10); 
INSERT INTO Advertisements VALUES ( 'sculptures', '2018-04-25', 'Daily Planet', 3000 , 40); 
INSERT INTO Advertisements VALUES ( 'male artists', '2018-04-26' , 'BBC', 4000 , 12); 
INSERT INTO Advertisements VALUES ( 'female artists', '2018-04-27' , 'Times', 5000 , 8);

-- InfluencedBy(influenceeId, influencerId)
INSERT INTO InfluencedBy VALUES(1, 2); 
INSERT INTO InfluencedBy VALUES(1, 3); 
INSERT INTO InfluencedBy VALUES(1, 4); 
INSERT INTO InfluencedBy VALUES(1, 5); 
INSERT INTO InfluencedBy VALUES(2, 5); 
INSERT INTO InfluencedBy VALUES(3, 5); 
INSERT INTO InfluencedBy VALUES(4, 5); 

-- ExhibitedAt(artifactId, exhibitionTitle)
INSERT INTO ExhibitedAt VALUES( 1, 'van Goghs paintings'); 
INSERT INTO ExhibitedAt VALUES( 2, 'male artists'); 
INSERT INTO ExhibitedAt VALUES( 3, 'female artists'); 
INSERT INTO ExhibitedAt VALUES( 4, 'female artists');
INSERT INTO ExhibitedAt VALUES( 5, 'paintings');
INSERT INTO ExhibitedAt VALUES( 6, 'sculptures'); 
INSERT INTO ExhibitedAt VALUES( 7, 'sculptures'); 
INSERT INTO ExhibitedAt VALUES( 8, 'sculptures'); 
INSERT INTO ExhibitedAt VALUES( 9, 'sculptures'); 
INSERT INTO ExhibitedAt VALUES( 10, 'sculptures'); 
