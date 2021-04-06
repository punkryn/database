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