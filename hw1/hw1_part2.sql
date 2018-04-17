-- exercise(a)
select hour(DateTime) AS hour,
	   sum(Throughput) AS trips
from
	   rides2017
group by hour(DateTime);



-- exercise(b)
select * from 
(
	select origin, destination, s as Max_Throughput

	from(
		select origin, destination, sum(Throughput) as s

		from rides2017 as tmp1

		where weekday(DateTime) = 0 || weekday(DateTime) = 1 || weekday(DateTime) = 2 || weekday(DateTime) = 3 || weekday(DateTime) = 4

		group by origin, destination

	)as tmp2
	order by s DESC) as result limit 1;


-- exercise(c)
select * from 
(
	select destination, avg(Throughput) as average_Throughput

	from rides2017 as tmp

	where weekday(DateTime) = 0 and hour(DateTime) >=7 and hour(DateTime) < 10

	group by destination

	order by average_Throughput DESC)
	 
 as result limit 5; 


 -- exercise(d)
select origin from
(
select origin, max(Throughput) as max, avg(Throughput) as avg

from rides2017 as tmp

group by origin) as result

where max > 100 * avg;




