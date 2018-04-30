
-- part 1(a)
select highway, area from caltrans

where text like "%closed%" and (text like "%snow%" or text like "%winter%")

order by highway DESC, area DESC limit 20;

-- part 1(b)
-- join method

-- not join method
select highway, count(count) / 365 as percentage
from 
(
	select highway, date(reported) as count from caltrans as tmp

	where text like "%closed%" and (text like "%snow%" or text like "%winter%")

	group by highway, date(reported)

)as result group by highway order by percentage DESC limit 5;


-- part 3(a)

select a.trip_id, a.user_id, ifnull((unix_timestamp(b.time) - unix_timestamp(a.time)), 86400) as trip_length  from trip_starts a left join trip_ends b on a.trip_id = b.trip_id  limit 5;