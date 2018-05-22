/*
#part 1
select 
	company,
	sum(if(value = 'bonded-by-product', 1, 0)) as 'bonded-by-product',
	sum(if(value = 'project-ownership', 1, 0)) as 'project-ownership',
	sum(if(value = 'friends-outside-work', 1, 0)) as 'friends-outside-work',
	sum(if(value = 'feedback', 1, 0)) as 'feedback',
	sum(if(value = 'impressive-teammates', 1, 0)) as 'impressive-teammates',
	sum(if(value = 'personal-growth', 1, 0)) as 'personal-growth',
	sum(if(value = 'fast-paced', 1, 0)) as 'fast-paced',
	sum(if(value = 'lunch-together', 1, 0)) as 'lunch-together',
	sum(if(value = 'remote-ok', 1, 0)) as 'remote-ok',
	sum(if(value = 'customer-first', 1, 0)) as 'customer-first',
	sum(if(value = 'many-hats', 1, 0)) as 'many-hats',
	sum(if(value = 'quality-code', 1, 0)) as 'quality-code',
	sum(if(value = 'open-communication', 1, 0)) as 'open-communication',
	sum(if(value = 'internal-promotion', 1, 0)) as 'internal-promotion',
	sum(if(value = 'retention', 1, 0)) as 'retention',
	sum(if(value = 'product-driven', 1, 0)) as 'product-driven',
	sum(if(value = 'worklife-balance', 1, 0)) as 'worklife-balance',
	sum(if(value = 'light-meetings', 1, 0)) as 'light-meetings',
	sum(if(value = 'flex-hours', 1, 0)) as 'flex-hours',
	sum(if(value = 'inclusive', 1, 0)) as 'inclusive',
	sum(if(value = 'psychologically-safe', 1, 0)) as 'psychologically-safe',
	sum(if(value = 'diverse-team', 1, 0)) as 'diverse-team',
	sum(if(value = 'eq-iq', 1, 0)) as 'eq-iq',
	sum(if(value = 'parents', 1, 0)) as 'parents',
	sum(if(value = 'open-source', 1, 0)) as 'open-source',
	sum(if(value = 'continuous-delivery', 1, 0)) as 'continuous-delivery',
	sum(if(value = 'engages-community', 1, 0)) as 'engages-community',
	sum(if(value = 'cross-dep', 1, 0)) as 'cross-dep',
	sum(if(value = 'safe-env', 1, 0)) as 'safe-env',
	sum(if(value = 'rapid-growth', 1, 0)) as 'rapid-growth',
	sum(if(value = 'new-tech', 1, 0)) as 'new-tech',
	sum(if(value = 'creative-innovative', 1, 0)) as 'creative-innovative',
	sum(if(value = 'data-driven', 1, 0)) as 'data-driven',
	sum(if(value = 'flat-organization', 1, 0)) as 'flat-organization',
	sum(if(value = 'engineering-driven', 1, 0)) as 'engineering-driven',
	sum(if(value = 'agile-dev', 1, 0)) as 'agile-dev',
	sum(if(value = 'pair-programs', 1, 0)) as 'pair-programs',
	sum(if(value = 'team-oriented', 1, 0)) as 'team-oriented',
	sum(if(value = 'internal-mobility', 1, 0)) as 'internal-mobility',
	sum(if(value = 'physical-wellness', 1, 0)) as 'physical-wellness',
	sum(if(value = 'benefit-company', 1, 0)) as 'benefit-company',
	sum(if(value = 'interns', 1, 0)) as 'interns',
	sum(if(value = 'junior-devs', 1, 0)) as 'junior-devs',
	sum(if(value = 'risk-taking', 1, 0)) as 'risk-taking',
	sum(if(value = 'good-beer', 1, 0)) as 'good-beer',
	sum(if(value = 'office-layout', 1, 0)) as 'office-layout'
from
	keyvalues
group by company;
*/

#part 2
tee part_2.txt
#method 0
Explain 
SELECT
    highway,
    area,
    COUNT(DISTINCT DAYOFYEAR(reported)) * 100 / 365 AS percentage_of_days_closed_365,
    COUNT(DISTINCT DAYOFYEAR(reported)) * 100 / 353 AS percentage_of_days_closed_353
FROM caltrans
WHERE text LIKE '%CLOSED%DUE TO SNOW%' OR text LIKE '%CLOSED%FOR THE WINTER%'
GROUP BY highway, area
ORDER BY percentage_of_days_closed_365 DESC;

#method 1
Explain
SELECT
    highway,
    stretch,
    COUNT(1) AS days_closed,
    100 * COUNT(1) / 365 AS pct_closed_365,
    100 * COUNT(1) / 353 AS pct_closed_353
FROM ( SELECT
        highway AS highway,
        area AS stretch,
        DATE(reported) AS closure
    FROM caltrans
    WHERE text LIKE '%CLOSED%' AND (
        text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO SNOW%')
    GROUP BY highway, stretch, closure
) result GROUP BY highway, stretch ORDER BY pct_closed_365 DESC;

#method 2
Explain
SELECT
    highway,
    stretch,
    COUNT(1) AS days_closed,
    100 * COUNT(1) / 365 AS pct_closed_365,
    100 * COUNT(1) / 353 AS pct_closed_353
FROM ( SELECT
        c.highway AS highway,
        c.area AS stretch,
        DATE(c.reported) AS closure
    FROM caltrans c
    JOIN (
        SELECT
            DISTINCT
highway,
            area
        FROM caltrans
        WHERE text like '%CLOSED%' AND (
            text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO NOW%')
    ) snow_highways ON c.highway = snow_highways.highway
    WHERE text like '%CLOSED%' AND (
        text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO SNOW%')
    GROUP BY highway, stretch, closure
) closures
GROUP BY highway, stretch
ORDER BY pct_closed_365 DESC;

#method 3
Explain
SELECT
    highway,
    stretch,
    COUNT(1) AS days_closed,
    100 * COUNT(1) / 365 AS pct_closed_365,
    100 * COUNT(1) / 353 AS pct_closed_353
FROM ( SELECT
        c.highway AS highway,
        c.area AS stretch,
                DATE(c.reported) AS closure
    FROM caltrans c
    WHERE (highway, area) IN (
        SELECT
        DISTINCT
            highway,
            area
        FROM caltrans
        WHERE text like '%CLOSED%' AND (
            text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO SNOW%')
    ) AND text LIKE '%CLOSED%' AND (text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO SNOW%')
    GROUP BY highway, stretch, closure
) closures
GROUP BY highway, stretch
ORDER BY pct_closed_365 DESC;

#method 4
Explain
SELECT
    highway,
    stretch,
    COUNT(1) AS days_closed,
    100 * COUNT(1) / 365 AS pct_closed_365,
    100 * COUNT(1) / 353 AS pct_closed_353
FROM ( SELECT
        c.highway AS highway,
        c.area AS stretch,
        DATE(c.reported) AS closure
    FROM caltrans c
    WHERE EXISTS (
SELECT 1
        FROM caltrans
        WHERE text like '%CLOSED%' AND (
            text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO SNOW%')
    ) AND text LIKE '%CLOSED%' AND (text LIKE '%FOR THE WINTER%' OR text LIKE '%DUE TO SNOW%')
    GROUP BY highway, stretch, closure
) closures
GROUP BY highway, stretch
ORDER BY pct_closed_365 DESC;

exit
