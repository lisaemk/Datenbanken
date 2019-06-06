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

insert into Artists values (1, 'Vincent van Gogh', '1853-01-03', '1890-01-02', 'male dutch artist'); 
insert into Artists values (2, 'Andy Warhol', '1928-05-12', '1987-03-13', 'male american pop artist'); 
insert into Artists values (3, 'Frida Kahlo', '1907-06-12', '1954-11-02','mexican female artist'); 
insert into Artists values (4, 'Jean Dubuffet', '1901-40-17', '1985-02-02', 'french male scuplure artist'); 
insert into Artists values (5, 'Paul Klee', '1879-05-18', '1940-12-11','german male artist. art movements: Expressionism, Cubism, Surrealism and Abstraction');

insert into Collections values ( 'title1' , 'topic1'); 
insert into Collections values ( 'title2' , 'topic2'); 
insert into Collections values ( 'title3' , 'topic3'); 
insert into Collections values ( 'title4' , 'topic4'); 
insert into Collections values ( 'title5' , 'topic5');

insert into Exhibitions values ( 'exhibition1' , 'topic1' , 'room1' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'exhibition2' , 'topic2' , 'room2' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'exhibition3' , 'topic3' , 'room3' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'exhibition4' , 'topic4' , 'room4' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'exhibition5' , 'topic5' , 'room5' , '2018-05-11' , '2018-06-21');

insert into Advertisements values ( 'exhibition1', '2018-04-23', 'name1', 10 , 4); 
insert into Advertisements values ( 'exhibition2', '2018-04-24', 'name2', 20 , 4); 
insert into Advertisements values ( 'exhibition3', '2018-04-25', 'name3', 30 , 4); 
insert into Advertisements values ( 'exhibition4', '2018-04-26' , 'name4', 40 , 4); 
insert into Advertisements values ( 'exhibition5', '2018-04-27' , 'name5', 50 , 4);

insert into Media values ( 'name1' , 'type1'); 
insert into Media values ( 'name2' , 'type2'); 
insert into Media values ( 'name3' , 'type3'); 
insert into Media values ( 'name4' , 'type4'); 
insert into Media values ( 'name5' , 'type5');

insert into InfluencedBy values(1, 2); 
insert into InfluencedBy values(1, 3); 
insert into InfluencedBy values(1, 4); 
insert into InfluencedBy values(1, 5); 
insert into InfluencedBy values(2, 5); 
insert into InfluencedBy values(3, 5); 
insert into InfluencedBy values(4, 5); 

insert into ExhibitedAt values( 1, 'exhibition1'); 
insert into ExhibitedAt values( 2, 'exhibition2'); 
insert into ExhibitedAt values( 3, 'exhibition3'); 
insert into ExhibitedAt values( 4, 'exhibition4'); 
insert into ExhibitedAt values( 5, 'exhibition5');

insert into Artifacts values(1, 'artifact1' , 'description_A' , 10 , 2001 , 1 , 'title1' , '2018-04-01'); 
insert into Artifacts values(2, 'artifact2' , 'description_B' , 11 , 2002 , 2 , 'title2' , '2018-04-01'); 
insert into Artifacts values(3, 'artifact3' , 'description_C' , 12 , 2003 , 3 , 'title3' , '2018-04-01'); 
insert into Artifacts values(4, 'artifact4' , 'description_D' , 13 , 2004 , 4 , 'title4' , '2018-04-01'); 
insert into Artifacts values(5, 'artifact5' , 'description_E' , 14 , 2005 , 5 , 'title5' , '2018-04-01'); 
insert into Artifacts values(6, 'artifact1' , 'description_A' , 10 , 2001 , 1 , 'title1' , '2018-04-01'); 
insert into Artifacts values(7, 'artifact1' , 'description_A' , 10 , 2001 , 1 , 'title1' , '2018-04-01');
insert into Artifacts values(8, 'artifact1' , 'description_A' , 10 , 2001 , 1 , 'title1' , '2018-04-01'); 
insert into Artifacts values(9, 'artifact1' , 'description_A' , 10 , 2001 , 1 , 'title1' , '2018-04-01'); 
insert into Artifacts values(10,'artifact1' , 'description_A' , 10 , 2001 , 1 , 'title1' , '2018-04-01');

insert into ArtifactPaintings values ( 1, 'canvas1'); 
insert into ArtifactPaintings values ( 2, 'canvas2'); 
insert into ArtifactPaintings values ( 3, 'canvas3'); 
insert into ArtifactPaintings values ( 4, 'canvas4'); 
insert into ArtifactPaintings values ( 5, 'canvas5');

insert into ArtifactSculptures values ( 6, 'braun', 'Holz'); 
insert into ArtifactSculptures values ( 7, 'grau','Holz'); 
insert into ArtifactSculptures values ( 8, 'silber','Holz'); 
insert into ArtifactSculptures values ( 9, 'rot','Holz'); 
insert into ArtifactSculptures values ( 10, 'weiss','Holz');