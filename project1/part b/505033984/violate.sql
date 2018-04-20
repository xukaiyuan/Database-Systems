
/* 	Violate primary key constraints in Actor since entry '1' in Actor already exists;
	Error message: Duplicate entry '1' for key 'PRIMARY'
*/
insert into Actor (id) values (1);

/* 	Violate primary key constraints Movie since id is primary key which can not be NULL;
	Error message: Column id cannot be NULL
*/
update Movie set id=NULL where id<=100;

/* 	Violate primary key constraints in Director since id is primary key which can not be NULL;
	Error message: Column id cannot be NULL
*/
update Director set id=NULL where id<=10000;

/* 	Violate referential integrity constraints in MovieGenre since mid references the foreign key
	id in Movie which is primary key and can not be duplicated;
	Error message: Cannot delete or update a parent row: a foreign key constraint fails
*/
update Movie set id=1 where id<=100;

/* 	Violate referential integrity constraints in MovieDirector since mid references the foreign key
	id in Movie which is primary key and can not be duplicated;
	Error message: Cannot delete or update a parent row: a foreign key constraint fails
*/
update Movie set id=1 where id<=100;

/* 	Violate referential integrity constraints in MovieDirector since did references the foreign key
	id in Director which is primary key and can not be NULL;
	Error message: Column did cannot be NULL
*/
update MovieDirector set did=null where did<=10000;

/* 	Violate referential integrity constraints in MovieActor since mid references the foreign key
	id in Movie which is primary key and can not be duplicated;
	Error message: Cannot delete or update a parent row: a foreign key constraint fails
*/
update Movie set id=0 where id<=100;

/* 	Violate referential integrity constraints in MovieActor since aid references the foreign key
	id in Actor which is primary key and can not be NULL;
	Error message: Column aid cannot be NULL
*/
update MovieActor set aid=null where aid<=100;

/* 	Violate referential integrity constraints in Review since mid references the foreign key
	id in Movie which is primary key and can not be duplicated;
	Error message: Cannot delete or update a parent row: a foreign key constraint fails
*/
update Movie set id=1 where id<=100;


-- Violate CHECK constraints (rating>=0 and rating<=5)
insert into Review (rating) values (6);

-- Violate CHECK constraints (sex='Male' or sex='Female')
update Actor set sex='N/A' where sex='Male';

-- Violate CHECK constraints (year >= 1800)
insert into Movie (id, title, year)
	values
	(444444, 'hhh', 1700);
	