CREATE TABLE list(
	num int primary key auto_increment,
	title varchar(50) default '제목없음',
	writer varchar(15) default '이름없음',
	content text not null,
	regdate date default (current_date),
	visitcnt int default 0
);
    

DROP TABLE list;
select * from list; 
select * from list where title= 'test01';
INSERT INTO list VALUES(0, 'test01', 'user1', 'testing ', current_date , 0);
INSERT INTO list VALUES(0, 'test02','user2', 'testing testing', current_date , 0);
INSERT INTO list VALUES(0, 'test03','user3', 'testing testing testing', current_date , 0);
INSERT INTO list VALUES(0, 'test04', 'user4','testing testing testing testing', current_date , 0);
INSERT INTO list VALUES(0, 'test05', 'user5','testing testing testing testing testing', current_date , 0);