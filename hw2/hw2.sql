
-- part 1(a)
select distinct highway, area from caltrans

where text like "%closed%" and (text like "%snow%" or text like "%winter%")

order by highway DESC, area DESC limit 20;

-- part 1(b)
-- join method
select highway, count(count) / 365 as percentage
from
(
	select a.highway as highway, date(a.reported) as count from

	caltrans a join caltrans b 

	on a.hash = b.hash and 

	a.text like "%closed%" and (b.text like "%snow%" or b.text like "%winter%")

	group by a.highway, date(a.reported)

)as result group by highway order by percentage DESC limit 5;

-- not join method
select highway, count(count) / 365 as percentage
from 
(
	select highway, date(reported) as count from caltrans as tmp

	where text like "%closed%" and (text like "%snow%" or text like "%winter%")

	group by highway, date(reported)

)as result group by highway order by percentage DESC limit 5;


-- part 3(a)
select a.trip_id, a.user_id, ifnull((unix_timestamp(b.time) - unix_timestamp(a.time)), 86400) as trip_length from trip_starts a left join trip_ends b on a.trip_id = b.trip_id limit 5;

-- part 3(b)
select a.trip_id, a.user_id, 1 + 0.15 * ceil(ifnull((unix_timestamp(b.time) - unix_timestamp(a.time)), 86400)/60) as trip_charge from trip_starts a left join trip_ends b on a.trip_id = b.trip_id  limit 5;


-- part 3(c)

select user_id, sum(daily_total) as monthly_total
from
(	
	select a.user_id, Least(sum(1 + 0.15 * ceil(ifnull((unix_timestamp(b.time) - unix_timestamp(a.time)), 86400)/60)), 100) as daily_total  

	from trip_starts a left join trip_ends b on a.trip_id = b.trip_id where month(a.time) = 3 group by a.user_id, day(a.time)
)
as result group by user_id limit 5;




