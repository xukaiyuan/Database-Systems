CREATE TABLE user(
	user_id					char(6) NOT NULL,
		--users' indentifier with fixed digits, which is the primary key so that it shouldn't be null, no more than 500000 in this case
	creditCard_no			char(16),
		--credit card number with 16 digits
	exp_date				char(5),
		--expired data with the format of MM/YY so that to be 5 digits as length
	email_add				varchar(150) NOT NULL,
		--email address whose length is depends on the users, which should also be not null when regeristing

	PRIMARY KEY(user_id)


);


CREATE TABLE scooter(
	scooter_id				char(5) NOT NULL,
		--scooter identifier which is the primary key, range from 0 to 10000
	flag					char(1) NOT NULL,
		--flag to reflect the status, which shouldn't be null and can be 0, 1, 2 which represents offline, online and lost, respectively
	home_location			varchar(20) NOT NULL,
		--location information which shouldn't be null
	PRIMARY KEY(scooter_id)


);

CREATE TABLE trip(
	trip_id					char(10) NOT NULL,
		--trip id which is the primary key
	user_id					char(6) NOT NULL,
		--users' indentifier with fixed digits, which is the primary key so that it shouldn't be null
	scooter_id				char(5) NOT NULL,
		--scooter identifier which is the primary key, range from 0 to 10000
	start_time				TIMESTAMP,
		--start time of the trip
	end_time				TIMESTAMP,
		--end time of the trip
	charge					decimal(6, 2),
		--amount of charge, where the max length to be 6 and max length after point to be 2, like $xxxx.xx
	start_location 			char(13),
		--start GPS location, as xxx.xx/xxx.xx  ->  longitude/latitude
	end_location			char(13),
		--end GPS location as previous attribute
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	FOREIGN KEY(scooter_id) REFERENCES scooter(scooter_id),
	PRIMARY KEY(trip_id)


);