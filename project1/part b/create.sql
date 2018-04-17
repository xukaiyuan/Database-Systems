DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Actor;
DROP TABLE IF EXISTS Director;
DROP TABLE IF EXISTS MovieGenre;
DROP TABLE IF EXISTS MovieDirector;
DROP TABLE IF EXISTS MovieActor;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS MaxPersonID;
DROP TABLE IF EXISTS MaxMovieID;

create table Movie(
	id					INT,
	title				varchar(100),
	yerar				INT,
	rating				varchar(10),
	company				varchar(50),

	primary key(id)

);

create table Actor(
	id					INT,
	last_name			varchar(20),
	first_name			varchar(20),
	sex					varchar(6),
	dob					date,
	dod					date,

	primary key(id)

);

create table Director(
	id					INT,
	last_name			varchar(20),
	first_name			varchar(20),
	sex					varchar(6),
	dob					date,
	dod					date,

	primary key(id)

);

create table MovieGenre(
	mid					INT,
	genre 				varchar(20)

	-- primary key(mid)
);

create table MovieDirector(
	mid					INT,
	did 				INT,

	primary key(mid)
);

create table MovieActor(
	mid					INT,
	aid 				INT,
	role				varchar(50),

	primary key(mid, aid, role)
);

create table Review(
	name 				varchar(20),
	time				timestamp,
	mid 				INT,
	rating				INT,
	comment				varchar(500)
);

create table MaxPersonID(
	id 					INT
);

create table MaxMovieID(
	id 					INT
);

