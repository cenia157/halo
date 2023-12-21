create table question_tbl(
    q_seq number(5) primary key,
    q_title varchar2(50 char) not null,
    q_content varchar2(2000 char) null,
    q_reg_date date null,
    q_contact_number varchar2(20 char) not null,
    q_email varchar2(50 char) null,
    q_name varchar2(20 char) not null,
    q_password varchar2(20 char) not null,
    q_category varchar2(20 char) null
);

CREATE SEQUENCE question_tbl_seq
  START WITH 1
  INCREMENT BY 1;
  
drop table question_tbl;
drop sequence question_tbl_seq;
  

insert into question_tbl values (question_tbl_seq.nextval, 'q_title', 'q_content', sysdate, '00000000000', 'q_email', 'q_name', 'q_password', 'Q1'); 



select * from question_tbl order by q_seq desc;