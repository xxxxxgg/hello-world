create table tb_member(
	no int auto_increment not null,
	id varchar(50) not null,
	pw varchar(50) not null,
	name varchar(50) not null,
	email varchar(50) not null,
    address varchar(200) not null,
    grade tinyint not null,
	regdate timestamp default now(),
	updatedate timestamp default now(),
	primary key(no)
);

create table tb_member2(
	no int auto_increment not null,
	id varchar(50) not null,
	pw varchar(50) not null,
	name varchar(50) not null,
	regdate timestamp default now(),
	updatedate timestamp default now(),
	primary key(no)
);

select * from tb_member;
insert into tb_member(id, pw, name) values ('user00', 'user00', 'iron', 'i@i', '');
insert into tb_member(id, pw, name) values ('user01', 'user00', 'captain');
insert into tb_member(id, pw, name) values ('user02', 'user00', 'hulk');
insert into tb_member(id, pw, name) values ('user03', 'user00', 'thor');
insert into tb_member(id, pw, name) values ('user10', 'user10', 'quick');
drop table tb_member;

select * from tb_member2;
insert into tb_member2(id, pw, name) values ('admin1', 'admin1pw', 'zzz');
insert into tb_member2(id, pw, name) values ('a', 'a', 'xxx');

create table tb_product(
	no int auto_increment not null,
	name varchar(50) not null,
	seller varchar(50) not null,
	company varchar(100) not null,
	description text,
    image1 varchar(200) not null,
    image2 varchar(200) not null,
    image3 varchar(200) not null,
	regdate timestamp default now(),
	primary key(no)
);

create table tb_admin(
	no int auto_increment not null,
	name varchar(50) not null,
    pw varchar(50) not null,
	regdate timestamp default now(),
	primary key(no)
);

CREATE TABLE tb_order
(
    `no`          INT              NOT NULL    AUTO_INCREMENT, 
    `state`       VARCHAR(20)      NOT NULL, 
    `mno`         INT              NOT NULL, 
    `orderdate`   timestamp default now() NOT NULL, 
    `comment`     VARCHAR(1000)    NULL, 
    `totalprice`  INT              NOT NULL, 
    PRIMARY KEY (no)
);

ALTER TABLE tb_order ADD CONSTRAINT FK_tb_order_mno_tb_member2_no FOREIGN KEY (mno)
 REFERENCES tb_member2 (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;

drop table tb_order;
drop table tb_ordereditem;

CREATE TABLE tb_ordereditem
(
    `no`          INT    NOT NULL    AUTO_INCREMENT, 
    `order_no`    INT    NOT NULL, 
    `item_no`     INT    NOT NULL, 
    `count`       INT    NOT NULL, 
    `totalprice`  INT    NOT NULL, 
    PRIMARY KEY (no)
);

ALTER TABLE tb_ordereditem ADD CONSTRAINT FK_tb_ordereditem_order_no_tb_order_no FOREIGN KEY (order_no)
 REFERENCES tb_order (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE tb_itemcart
(
    `no`          INT    NOT NULL    AUTO_INCREMENT, 
    `item_no`     INT    NOT NULL, 
    `count`       INT    NOT NULL, 
    `totalprice`  INT    NOT NULL, 
    PRIMARY KEY (no)
);

select * from tb_order;
select * from tb_order, tb_ordereditem where tb_order.no = 1;
select * from tb_ordereditem;

delete from tb_ordereditem where tb_order_no = 2;

select tb_order.no, tb_member2.id, tb_order.totalprice
from tb_order
inner join tb_member2 on tb_order.mno = tb_member2.no;

update tb_order set state = '�����' where no = 3;
update tb_ordereditem set totalprice = 20000 where no = 1;

INSERT INTO tb_order (state, mno, comment, totalprice) VALUES ('state 01', 01, 'comment 01', 1000);
INSERT INTO tb_order (state, mno, comment, totalprice) VALUES ('state 02', 01, 'comment 02', 2000);
INSERT INTO tb_order (state, mno, comment, totalprice) VALUES ('state 03', 01, 'comment 03', 03);
INSERT INTO tb_order (state, mno, orderdate, comment, totalprice) VALUES ('state 04', 01, 'orderdate 04', 'comment 04', 04);
INSERT INTO tb_order (state, mno, orderdate, comment, totalprice) VALUES ('state 05', 01, 'orderdate 05', 'comment 05', 05);
INSERT INTO tb_order (state, mno, orderdate, comment, totalprice) VALUES ('state 06', 01, 'orderdate 06', 'comment 06', 06);
INSERT INTO tb_order (state, mno, comment, totalprice) VALUES ('state 07', 02, 'comment 07', 7000);
INSERT INTO tb_order (state, mno, comment, totalprice) VALUES ('state 08', 02, 'comment 08', 80000);
INSERT INTO tb_order (state, mno, orderdate, comment, totalprice) VALUES ('state 09', 09, 'orderdate 09', 'comment 09', 09);
INSERT INTO tb_order (state, mno, orderdate, comment, totalprice) VALUES ('state 10', 10, 'orderdate 10', 'comment 10', 10);

INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (01, 01, 01, 1000);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (01, 02, 02, 2000);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (01, 03, 03, 3000);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (01, 04, 02, 4000);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (01, 05, 05, 5000);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (01, 06, 02, 6000);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (02, 07, 07, 07);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (02, 08, 08, 08);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (09, 09, 09, 09);
INSERT INTO tb_ordereditem (order_no, item_no, count, totalprice) VALUES (10, 10, 10, 10);