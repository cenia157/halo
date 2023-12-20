create table QA_tbl(
    qa_seq number(3) primary key,
    qa_title varchar2(50 char) not null,
    qa_content varchar2(2000 char) null,
    qa_reg_date date null
);

create sequence QA_tbl_seq
  start with 1
  increment by 1;
  
insert into QA_tbl values (qa_seq.nextval, 'qa_title', 'qa_content', 'qa_reg_date');

select * from QA_tbl;