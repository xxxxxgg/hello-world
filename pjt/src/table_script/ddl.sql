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

select * from tb_member2;
insert into tb_member2(id, pw, name) values ('admin1', 'admin1pw', 'zzz');
insert into tb_member2(id, pw, name) values ('a', 'a', 'xxx');


CREATE TABLE tb_order2
(
    `no`          INT              NOT NULL    AUTO_INCREMENT, 
    `state`       VARCHAR(20)      NOT NULL, 
    `mno`         INT              NOT NULL    COMMENT '주문자번호', 
    `orderdate`   TIMESTAMP        NOT NULL, 
    `comment`     VARCHAR(1000)    NULL, 
    `totalprice`  INT              NOT NULL, 
    PRIMARY KEY (no)
);

ALTER TABLE tb_order2 ADD CONSTRAINT FK_tb_order_mno_tb_member2_no FOREIGN KEY (mno)
 REFERENCES tb_member2 (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE tb_ordereditem2
(
    `no`          INT    NOT NULL    AUTO_INCREMENT, 
    `order_no`    INT    NOT NULL, 
    `item_no`     INT    NOT NULL, 
    `count`       INT    NOT NULL, 
    `totalprice`  INT    NOT NULL, 
    PRIMARY KEY (no)
);

ALTER TABLE tb_ordereditem2 ADD CONSTRAINT FK_tb_ordereditem2_order_no_tb_order2_no FOREIGN KEY (order_no)
 REFERENCES tb_order2 (no)  ON DELETE RESTRICT ON UPDATE RESTRICT;