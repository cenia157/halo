CREATE TABLE test (
    id NUMBER PRIMARY KEY,
    content_column_name CLOB
);
select * from test;






CREATE TABLE visitors (
  id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
  ip VARCHAR2(50) NOT NULL,
  user_agent VARCHAR2(255) NOT NULL,
  visit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

INSERT INTO visitors (ip, user_agent) VALUES ('asd', 'User 정보');

select * from visitors;






CREATE TABLE notice (
	update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);






CREATE TABLE notice (
    id NUMBER PRIMARY KEY,
	title VARCHAR2(30) NOT NULL,
	txt VARCHAR2(500) NOT NULL,    
	writer VARCHAR2(500),    
    update_date DATE DEFAULT SYSDATE,
	category VARCHAR2(30),
	img VARCHAR2(500)
);
	
create sequence notice_seq;

INSERT INTO notice (id, title, txt, writer, category, img) VALUES (notice_seq.nextval, '타이틀', '텍스트', '김진욱', '일반', '이미지');

select * from notice;






















// 여기서부터 진짜




CREATE TABLE announced_tbl (
    an_sql NUMBER PRIMARY KEY,
	an_title VARCHAR2(50) NOT NULL,
	an_content VARCHAR2(2000) NOT NULL,    
	an_writer VARCHAR2(20),    
    an_reg_date DATE DEFAULT SYSDATE,
	an_category VARCHAR2(50),
);
create sequence announced_tbl_seq;

INSERT INTO announced_tbl (an_sql, an_title, an_content, an_writer, an_category) VALUES (announced_tbl_seq.nextval, '타이틀', '텍스트', '김진욱', '일반');



select * from announced_tbl;





