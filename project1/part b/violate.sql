-- primary key constraints Actor
insert into Actor (id)
	values
	(NULL);

-- primary key constraints Movie
update Movie set id=NULL where id<=100;

-- primary key constraints Director
update Director set id=NULL where id<=10000;

--- referential integrity constraints MovieGenre mid
update Movie set id=1 where id<=100;

-- referential integrity constraints MovieDirector mid
update Movie set id=1 where id<=100;

-- referential integrity constraints MovieDirector did
update Director set id=1 where id<=10000;

-- referential integrity constraints MovieActor mid
update Movie set id=1 where id<=100;

-- referential integrity constraints MovieActor aid
update Actor set id=1 where id<=10000;

-- referential integrity constraints Review mid
update Movie set id=1 where id<=100;

-- CHECK constraints (rating>=0 and rating<=5)
insert into Review (rating) values (6);

-- CHECK constraints (sex='male' or sex='female')
update Actor set sex='Unknown' where sex='Male';

-- CHECK constraints (year >= 1800)
insert into Movie (id, title, year)
	values
	(444444, 'hhh', 1700);