drop database if EXISTS joindb;
create database joindb
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;
    
use joindb;

create table actor (
    id int not null AUTO_INCREMENT,
    name varchar(20),
    birthday date,
    PRIMARY KEY (id)
) ENGINE=INNODB
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;

create table movie (
    id int not null AUTO_INCREMENT,
    name varchar(20),
    aid int,
    PRIMARY KEY (id),
    FOREIGN KEY (aid) REFERENCES actor(id)
) ENGINE=INNODB
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;
    
    
insert into actor VALUES (1, '이병헌', '1970-07-12');
insert into actor VALUES (2, '황정민', '1970-09-01');
insert into actor VALUES (3, '강동원', '1981-01-18');
insert into actor VALUES (4, '권상우', '1976-08-05');
insert into actor VALUES (5, '유아인', '1986-10-06');
    
    
insert INTO movie VALUES (null, '남산의 부장들', 1);
insert INTO movie VALUES (null, '다만 악에서 구하소서', 2);
insert INTO movie VALUES (null, '반도', 3);
insert INTO movie VALUES (null, '히트맨', 4);
insert INTO movie VALUES (null, '테넷', null);

##########################################################

SELECT * from movie, actor where movie.aname = actor.aname;
select * from movie join actor on movie.aname = actor.aname;
select * from movie inner join actor on movie.aname = actor.aname;
select * from movie join actor using (aname);
select * from movie NATURAL join actor;

select * from movie left outer join actor on movie.aname = actor.aname;
select * from movie right outer join actor on movie.aname = actor.aname;

select * from movie left outer join actor on movie.aname = actor.aname
union
select * from movie right outer join actor on movie.aname = actor.aname;