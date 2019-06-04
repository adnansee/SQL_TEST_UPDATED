####################### CREATING DATABASE AND TABLES

CREATE database MovieDB;
USE MovieDB;
CREATE TABLE movie
(
    movie_id        integer primary key auto_increment,
    mov_title       char(50),
    mov_year        integer,
    mov_time        integer,
    mov_lang        char(50),
    mov_dt_rel      date,
    mov_rel_country char(50)
);

CREATE TABLE movie_genres
(
    mov_id integer references movie (movie_id),
    gen_id integer references genres (gen_id)
);

CREATE TABLE genres
(
    gen_id    integer primary key auto_increment,
    gen_title char(20)
);

CREATE TABLE rating
(
    mov_id       integer references movie (movie_id),
    rev_id       integer references reviewer (rev_id),
    rev_stars    integer,
    num_o_rating integer
);

CREATE TABLE reviewer
(
    rev_id   integer primary key auto_increment,
    rev_name char(30)
);

CREATE TABLE movie_direction
(
    dir_id integer references director (dir_id),
    mov_id integer references movie (movie_id)
);

CREATE TABLE director
(
    dir_id    integer primary key auto_increment,
    dir_fname char(20),
    die_lname char(20)
);

CREATE TABLE actor
(
    act_id    integer primary key auto_increment,
    act_fname char(20),
    act_lname char(20)
);

CREATE TABLE movie_cast
(
    act_id integer references actor (act_id),
    mov_id integer references movie (movie_id),
    role   char(30)
);

####################### ENTERING DATA INTO THE DATABASE TABLES


#INSERT MOVIES
INSERT INTO movie(movie_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country)
values (1, 'Pearl Harbor', 2001, 183, 'ENG', '2001-05-25', 'USA'),
       (2, 'Jumanji', 1995, 104, 'ENG', '1995-12-15', 'USA'),
       (3, 'Brave Heart', 1995, 178, 'ENG', '1995-05-24', 'UK'),
       (4, 'Eyes Wide Shut', 2001, 144, 'ENG', '2001-01-18', 'USA'),
       (5, 'Gladiator', 2001, 144, 'ENG', '2001-05-05', 'USA'),
       (6, 'Annie Hall', 1999, 129, 'ENG', '1999-06-01', 'EU'),
       (7, 'The Lost World', 1988, 129, 'ENG', '1988-05-23', 'USA'),
       (8, 'AI', 2001, 146, 'ENG', '2001-06-29', 'USA'),
       (9, 'American Beauty', 1997, 197, 'ENG', '1997-12-19', 'UK'),
       (10, 'Twister', 1996, 113, 'ENG', '1996-05-10', 'USA');

#INSERT ACTOR

INSERT INTO actor(act_id, act_fname, act_lname)
VALUES (1, 'Leo', 'DiCaprio'),
       (2, 'Woody', 'Allen'),
       (3, 'Leo', 'DiCaprio'),
       (4, 'John', 'Malcovich'),
       (5, 'Salma', 'Hayek'),
       (6, 'Al', 'Pagino'),
       (7, 'Chris', 'Tucker'),
       (8, 'Martin', 'Lawrence'),
       (9, 'Dave', 'Chappelle'),
       (10, 'Antonio', 'Bandarez');

#INSERT DIRECTOR
INSERT INTO director(dir_id, dir_fname, die_lname)
VALUES (1, 'Michal', 'Bay'),
       (2, 'Robert', 'Louis'),
       (4, 'Sherpa', 'SHIER'),
       (5, 'Sreven', 'Stielberg'),
       (6, 'Quentin', 'Tarantino'),
       (7, 'Stanley', 'Kubick'),
       (8, 'Christopher', 'Nolan'),
       (9, 'Alferd', 'Hitchcock'),
       (3, 'Peter', 'Jackson'),
       (10, 'James', 'Cameron');

#INSERT MOVIE DIRECTION
INSERT INTO movie_direction(dir_id, mov_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (1, 4),
       (4, 5),
       (4, 5),
       (6, 6),
       (7, 7),
       (7, 8),
       (9, 9),
       (1, 10);

#INSERT REVIEWER
INSERT INTO reviewer(rev_id, rev_name)
VALUES (1, 'ROTTEN TOMATOES'),
       (2, 'IMDB'),
       (3, '5STARS'),
       (5, 'OSCAR'),
       (6, 'LUX'),
       (7, 'CANES'),
       (8, 'TV'),
       (9, 'AMAZON'),
       (10, 'NETFLIX'),
       (4, 'HULU');

#MOVIE GENRE
INSERT INTO genres(gen_title)
VALUES ('ACTION'),
       ('DRAMA'),
       ('MYSTRY');

#INSERT MOVIE_CAST
INSERT INTO movie_cast(act_id, mov_id, role)
VALUES (1, 1, 'MAIN HERO'),
       (2, 2, 'Villan'),
       (3, 3, 'Extra'),
       (4, 4, 'Main Herien'),
       (5, 5, 'Snitch'),
       (6, 6, 'Cop'),
       (7, 7, 'Detective'),
       (8, 8, 'Production'),
       (9, 9, 'News Castor'),
       (10, 10, 'Priest');

#INSERT RATING
INSERT INTO rating(mov_id, rev_id, rev_stars, num_o_rating)
VALUES (1, 1, 8, 2),
       (2, 2, 7, 3),
       (3, 3, 4, 4),
       (4, 4, 1, 2),
       (5, 5, 2, 3),
       (6, 6, 3, 1),
       (7, 7, 2, 3),
       (8, 8, 3, 6),
       (9, 9, 5, 3),
       (10, 10, NULL, 2);

#INSERT GENRE

INSERT INTO movie_genres(mov_id, gen_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 2),
       (5, 1),
       (6, 1),
       (7, 1),
       (8, 2),
       (9, 3),
       (10, 2)
;

############# QUESTIONS NUMBERED AND BRIEFED

# 1 NAME AND YEAR

SELECT mov_title, mov_year
from movie;

# 2 Year when American Beauty came
SELECT mov_year
FROM movie
WHERE mov_title = 'American Beauty';

# 3 FILM RELEASE DATE 1999
SELECT *
FROM movie
where mov_year = 1999;

# 4 FILM RELEASED BEFORE 1999
SELECT *
FROM movie
where mov_year < 1998;

# 5 MERGE REVIEWER AND MOVIE
select CONCAT(mov_title, ' ', rev_name) AS REVIEWERMOVIE
from movie
join rating r on movie.movie_id = r.mov_id
join reviewer r2 on r.rev_id = r2.rev_id
order by mov_title;


# 6 REVIEWERS WHERE LESS THEN 7 rating
SELECT *
FROM movie
JOIN rating r on movie.movie_id = r.mov_id
where rev_stars < 7;


# 7 NO REVIEWS
SELECT *
FROM movie
JOIN rating r on movie.movie_id = r.mov_id
WHERE rev_stars is null;


# 8 TITLE WITH ID 5,7,9
SELECT *
FROM movie
WHERE movie_id = 5
   OR movie_id = 7
   OR movie_id = 9;


# 9 WOODY ALLEN AS MAIN ACTOR
SELECT actor.act_id
FROM actor
WHERE act_fname LIKE 'Woody';

#10 SUBQUERY DIRECTOR FIRST NAME AND LAST FOR MOVIE EYES WIDE SHUT
SELECT dir_fname, die_lname FROM director
WHERE dir_id IN (SELECT movie_id FROM movie
WHERE mov_title LIKE 'Eyes Wide Shut');


# 11 Movies outside the UK
SELECT *
FROM movie
where mov_rel_country <> 'UK';

# 12 Movies with less then 3 stars order by stars
select *
FROM movie
JOIN rating r on movie.movie_id = r.mov_id
WHERE rev_stars < 3
ORDER BY rev_stars;

# 13 Reviewer Name film title and stars
select mov_title, rev_name, rev_stars
from movie
join rating r on movie.movie_id = r.mov_id
join reviewer r2 on r.rev_id = r2.rev_id
order by mov_title;

# 14 Movie title and highest reviews
select mov_title, MAX(rev_stars)
from rating
         join movie m on rating.mov_id = m.movie_id;


# 15 First and Last name of the actors and the movie titles
SELECT act_fname, act_lname, mov_title
FROM actor
         join movie_cast mc on actor.act_id = mc.act_id
         join movie m on mc.mov_id = m.movie_id;

# 15 Cast of movie Annie
SELECT act_fname, act_lname
FROM actor
         join movie_cast mc on actor.act_id = mc.act_id
         join movie m on mc.mov_id = m.movie_id
WHERE mov_title LIKE 'Annie Hall';

# 16 ACTORS WHO ACTED BETWEEN 1990 - 2000
select act_fname, act_lname
from actor
         join movie_cast mc on actor.act_id = mc.act_id
         join movie m on mc.mov_id = m.movie_id
WHERE mov_year > 1990
  AND mov_year < 2000;
;

# 17 Directors with the genres
select die_lname, gen_title
from director
join movie_direction md on director.dir_id = md.dir_id
join movie m on md.mov_id = m.movie_id
join movie_genres mg on m.movie_id = mg.mov_id
join genres g on mg.gen_id = g.gen_id
ORDER BY die_lname;

# 18 All movies with year and genre
select *
FROM movie
join movie_genres mg on movie.movie_id = mg.mov_id
join genres g on mg.gen_id = g.gen_id
order by mov_id;


# 19 MOVIE AND DIRECTORS
select movie.movie_id, movie.mov_title, movie.mov_year, movie.mov_time, movie.mov_lang, movie.mov_dt_rel, director.dir_fname, director.die_lname
FROM movie,director
join movie_direction md on director.dir_id = md.dir_id
join movie m on md.mov_id = m.movie_id
join movie_cast mc on m.movie_id = mc.mov_id;





#20 Movies with rating 3, 4
select *
from movie
         join rating r on movie.movie_id = r.mov_id
where rev_stars = 3
   or rev_stars = 4;
