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

-- Artists(id, name, birthDate, deathDate, bio)
insert into Artists values (1, 'Vincent van Gogh', '1853-01-03', '1890-01-02', 'male dutch artist'); 
insert into Artists values (2, 'Andy Warhol', '1928-05-12', '1987-03-13', 'male american pop artist'); 
insert into Artists values (3, 'Frida Kahlo', '1907-06-12', '1954-11-02','mexican female artist'); 
insert into Artists values (4, 'Jean Dubuffet', '1901-40-17', '1985-02-02', 'french male scuplure artist'); 
insert into Artists values (5, 'Paul Klee', '1879-05-18', '1940-12-11','german male artist. art movements: Expressionism, Cubism, Surrealism and Abstraction');

-- Collections(title, topic)
insert into Collections values ( 'Van Gogh Collection' , 'artifacts by Vincent van Gogh'); 
insert into Collections values ( 'Pop Art' , 'artifacts from pop art artist'); 
insert into Collections values ( 'Sculptures' , 'sculptures from various artists'); 
insert into Collections values ( 'Frida Kahlo Collection' , 'paintings of frida kahlo'); 
insert into Collections values ( 'German artists' , 'paintings of german artists');

-- Exhibitions(title, topic, room, startDate, endDate)
insert into Exhibitions values ( 'van Goghs paintings' , 'van Gogh' , '001' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'male artists' , 'man' , '002' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'female artists' , 'woman' , '001' , '2018-08-11' , '2018-09-21'); 
insert into Exhibitions values ( 'sculptures' , 'all sculptures' , '003' , '2018-05-11' , '2018-06-21'); 
insert into Exhibitions values ( 'paintings' , 'all paintings' , '003' , '2018-08-11' , '2018-09-21');

-- Advertisements(exhibitionTitle, date, mediumName, cost, duration)
insert into Advertisements values ( 'van Goghs paintings', '2018-01-23', 'Daily Planet', 1000 , 10); 
insert into Advertisements values ( 'van Goghs paintings', '2018-02-24', 'Radio One', 2000 , 10); 
insert into Advertisements values ( 'sculptures', '2018-04-25', 'Daily Planet', 3000 , 40); 
insert into Advertisements values ( 'male artists', '2018-04-26' , 'BBC', 4000 , 12); 
insert into Advertisements values ( 'female artists', '2018-04-27' , 'Times', 5000 , 8);

-- Media(name, type)
insert into Media values ( 'Radio One' , 'radio'); 
insert into Media values ( 'Daily Planet' , 'tv'); 
insert into Media values ( 'BBC' , 'tv'); 
insert into Media values ( 'Times' , 'newspaper'); 
insert into Media values ( 'Post' , 'newspaper');

-- InfluencedBy(influenceeId, influencerId)
insert into InfluencedBy values(1, 2); 
insert into InfluencedBy values(1, 3); 
insert into InfluencedBy values(1, 4); 
insert into InfluencedBy values(1, 5); 
insert into InfluencedBy values(2, 5); 
insert into InfluencedBy values(3, 5); 
insert into InfluencedBy values(4, 5); 

-- ExhibitedAt(artifactId, exhibitionTitle)
insert into ExhibitedAt values( 1, 'van Goghs paintings'); 
insert into ExhibitedAt values( 2, 'male artists'); 
insert into ExhibitedAt values( 3, 'female artists'); 
insert into ExhibitedAt values( 4, 'female artists');
insert into ExhibitedAt values( 5, 'paintings');
insert into ExhibitedAt values( 6, 'sculptures'); 
insert into ExhibitedAt values( 7, 'sculptures'); 
insert into ExhibitedAt values( 8, 'sculptures'); 
insert into ExhibitedAt values( 9, 'sculptures'); 
insert into ExhibitedAt values( 10, 'sculptures'); 

--     Artifacts(id, title, description, value, year, artistId, collectionTitle, collectionDate)
insert into Artifacts values(1, 'the starry night' , 'painting of bridge in the night' , 1000000 , 1889 , 1 , 'Van Gogh Collection' , '2011-04-01'); 
insert into Artifacts values(2, 'banana' , 'for the velvet underground' , 110000 , 1966 , 2 , 'Pop Art' , '2011-04-01'); 
insert into Artifacts values(3, 'the broken column' , 'self portrait' , 120000 , 1944 , 3 , 'Frida Kahlo Collection' , '2000-04-01'); 
insert into Artifacts values(4, 'diego and i' , 'self portrait ' , 130000 , 1945 , 3 , 'Frida Kahlo Collection' , '2013-04-01'); 
insert into Artifacts values(5, 'red balloon' , 'compositional design' , 140000 , 1992 , 5 , 'German artists' , '2011-04-01'); 
insert into Artifacts values(6, 'table de salon' , 'white sculpture' , 100000 , 1970 , 4 , 'Sculptures' , '2015-04-01'); 
insert into Artifacts values(7, 'l accueillant' , 'sculpture in white and red' , 10000 , 1973 , 4 , 'Sculptures' , '2013-04-01');
insert into Artifacts values(8, 'siphonus' , 'red white and blue sculpture' , 1000000 , 1971 , 4 , 'Sculptures' , '2014-04-01'); 
insert into Artifacts values(9, 'tetonette' , 'concrete sculture' , 1000 , 1954 , 4 , 'Sculptures' , '2011-04-01'); 
insert into Artifacts values(10,'gants no 23' , 'hand sculpture' , 100 , 1973 , 4 , 'Sculptures' , '2012-04-01');

-- ArtifactPaintings(id, canvas)
insert into ArtifactPaintings values ( 1, 'canvas'); 
insert into ArtifactPaintings values ( 2, 'canvas'); 
insert into ArtifactPaintings values ( 3, 'oil'); 
insert into ArtifactPaintings values ( 4, 'oil'); 
insert into ArtifactPaintings values ( 5, 'oil');

-- ArtifactSculptures(id, material, color)
insert into ArtifactSculptures values ( 6, 'white', 'wood'); 
insert into ArtifactSculptures values ( 7, 'red','wood'); 
insert into ArtifactSculptures values ( 8, 'silver','wood'); 
insert into ArtifactSculptures values ( 9, 'grey','concrete'); 
insert into ArtifactSculptures values ( 10, 'white','metal');