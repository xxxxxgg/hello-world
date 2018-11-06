create table member
(
  id varchar(50) not null primary KEY,
  password varchar(50) not null,
  name varchar(50),
  gender varchar(10),
  mail varchar(100),
  phone varchar(11),
  address varchar(200),
  regdate timestamp not null default now()
);