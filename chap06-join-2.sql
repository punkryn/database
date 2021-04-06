drop database if EXISTS joindb;
create database joindb
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;
    
use joindb;

create table movie (
    mname varchar(20),
    aname varchar(20),
    PRIMARY KEY (mname)
) ENGINE=INNODB
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;
    
create table actor (
    aname varchar(20),
    birthday date,
    PRIMARY KEY (aname)
) ENGINE=INNODB
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;
    
insert INTO movie VALUES ('남산의 부장들', '이병헌');
insert INTO movie VALUES ('다만 악에서 구하소서', '황정민');
insert INTO movie VALUES ('반도', '강동원');
insert INTO movie VALUES ('히트맨', '권상우');
insert INTO movie VALUES ('테넷', null);

insert into actor VALUES ('이병헌', '1970-07-12');
insert into actor VALUES ('황정민', '1970-09-01');
insert into actor VALUES ('강동원', '1981-01-18');
insert into actor VALUES ('권상우', '1976-08-05');
insert into actor VALUES ('유아인', '1986-10-06');

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