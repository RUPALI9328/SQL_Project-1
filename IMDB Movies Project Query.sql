use project_movie_database;

-- b) How do you get all data about directors?
select * from directors;

-- a) Can you get all data about movies? 
select * from movies;
alter table movies
drop column id;

-- c) Check how many movies are present in IMDB.
select title from movies;

select count(distinct(title)) as Total_Movies
from movies;

-- d) Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors 
where name in ('James Cameron', 'Luc Besson', 'John Woo');

-- e)	Find all directors with name starting with S.
select name from directors
where name like 'S%';

-- f)	Count female directors.
select name from directors
where gender = 1;
select count(*) as Female_Direct_Count
from directors
where gender = 1;

-- g)	Find the name of the 10th first women directors?
select name as Female_Direct
from directors  
where gender = 1 
limit 10;

-- h)	What are the 3 most popular movies?
select original_title as Popular_Movies 
from movies
order by popularity desc
limit 3;

-- i)	What are the 3 most bankable movies?
select original_title, (revenue - budget) as profitability
from movies
order by profitability desc
limit 3;

-- j)	What is the most awarded average vote since the January 1st, 2000?
select vote_average, sum(vote_count) as Total_vote
from movies
where release_date > '2000-01-01'
group by vote_average
order by Total_vote desc
limit 1;

-- k)	Which movie(s) were directed by Brenda Chapman?
select m.original_title
from movies m
join directors d on m.director_id = d.id
where d.name = 'Brenda Chapman';

-- l)	Which director made the most movies?
select d.name, count(m.id) as Movie_Count
from directors d
join movies m on d.id = m.director_id
group by d.name
order by Movie_Count desc
limit 1;

-- m)	Which director is the most bankable?
select d.name, sum(m.revenue - m.budget) as Profitability
from directors d 
join movies m on d.id = m.director_id
group by d.name
order by Profitability desc
limit 1;


