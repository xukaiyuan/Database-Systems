-- query 1
select concat(first_name, ' ', last_name) as name

from Actor 

join MovieActor on

Actor.id = MovieActor.aid

join Movie on 

MovieActor.mid = Movie.id

where Movie.title = 'Die Another Day';





-- query 2
select count(movies) as number_of_actors_multi_movies 

from
(
	select count(id) as movies

	from Actor 

	join MovieActor on

	Actor.id = MovieActor.aid

	group by id

	
) as result

where movies >= 2;




