create table question_tbl(
    q_seq number(5) primary key,
    q_title varchar2(50 char) not null,
    q_content varchar2(2000 char) null,
    q_reg_date date null,
    q_contact_number number(20) not null,
    q_email varchar2(50 char) null,
    q_name varchar2(20 char) not null,
    q_password varchar2(20 char) not null,
    q_category varchar2(20 char) null
);

create sequence question_tbl_seq
  start with 1
  increment by 1;
  
insert into question_tbl values (question_tbl_seq.nextval, 'q_title', 'q_content', sysdate, 'q_contact_number','q_email', 'q_name', 'q_password', 'q_category');

select * from question_tbl order by desc;