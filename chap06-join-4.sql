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
    PRIMARY KEY (id)
) ENGINE=INNODB
    DEFAULT CHARACTER set utf8
    DEFAULT COLLATE utf8_general_ci;

create table starring(
    mid int not null,
    aid int not null,
    FOREIGN KEY(mid) REFERENCES movie(id),
    FOREIGN KEY(aid) REFERENCES actor(id)
) ENGINE = INNODB
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

insert into movie values (1, '남산의 부장들');
insert into movie values (2, '다만 악에서 구하소서');
insert into movie values (3, '반도');
insert into movie values (4, '히트맨');
insert into movie values (5, '테넷');

insert into actor values (1, '이병헌', '1970-07-12');
insert into actor values (2, '황정민', '1970-09-01');
insert into actor values (3, '강동원', '1981-01-18');
insert into actor values (4, '권상우', '1976-08-05');
insert into actor values (5, '유아인', '1986-10-06');

insert into starring (mid, aid) values (1, 1);
insert into starring (mid, aid) values (2, 2);
insert into starring (mid, aid) values (3, 3);
insert into starring (mid, aid) values (4, 4);


##########################################################

select * from movie
    left outer join starring on movie.id = starring.mid
    left outer join actor on starring.aid = actor.id;
