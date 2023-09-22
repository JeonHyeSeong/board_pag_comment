-- board 테이블 생성
create table board(
bno int auto_increment not null,
title varchar(200) not null,
writer varchar(100) not null,
content text,
regdate datetime default now(),
moddate datetime default now(),
readcount int default 0,
image_File varchar(500),
primary key(bno));

-- member 테이블 생성
create table member(
id varchar(100),
pwd varchar(100) not null,
email varchar(100) not null,
age int default 0,
regdate datetime default now(),
lastlogin datetime default now(),
primary key(id));

-- comment 테이블 생성
create table comment(
cno int auto_increment,
bno int not null,
writer varchar(200) not null default "unknown",
content varchar(1000),
regdate datetime default now(),
primary key(cno));
