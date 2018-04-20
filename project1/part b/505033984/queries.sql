-- the names of all the actors in the movie 'Die Another Day'
select concat(first_name, ' ', last_name) as name

from Actor 

join MovieActor on

Actor.id = MovieActor.aid

join Movie on 

MovieActor.mid = Movie.id

where Movie.title = 'Die Another Day';



-- the count of all the actors who acted in multiple movies
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



-- query the title of the movie with the most actors
select title, count(aid) as numberofactor
from MovieActor join Movie on MovieActor.mid=Movie.id
group by mid
order by count(aid) desc
limit 1
;




