CREATE TABLE reservation_information (
    sa_seq number(5) PRIMARY KEY,
    sa_applicant varchar2(20 char) NULL,
    sa_phone_number VARCHAR2(20 char) NOT NULL,
    sa_user_name varchar2(20 char) NOT NULL,
    sa_gender char(1 char) NOT NULL,
    sa_birth_date varchar2(20 char) NOT NULL,
    sa_year varchar2(4 char) NOT NULL,
    sa_month varchar2(2 char) NOT NULL,
    sa_days varchar2(200 char) NOT NULL,
    sa_time varchar2(50 char) NOT NULL,
    sa_addr varchar2(200 char) NULL,
    sa_start_place varchar2(200 char) NULL,
    sa_end_place varchar2(200 char) NULL,
    sa_reservation_check char(1 char) NOT NULL,
    sa_car_no varchar2(10) NULL,
    sa_nurssing_info varchar2(200 char) NULL,
    sa_taxi_info varchar2(200 char) NULL,
    sa_service_completion_status char(1 char) NOT NULL,
    sa_feedback varchar2(200 char) NULL,
    sa_registration_date varchar2(30 char) NOT NULL
);


CREATE SEQUENCE reservation_information_seq START WITH 1 INCREMENT BY 1;


DROP SEQUENCE reservation_information_seq;


select * from reservation_information;

INSERT INTO reservation_information (
    sa_seq,
    sa_applicant,
    sa_phone_number,
    sa_user_name,
    sa_gender,
    sa_birth_date,
    sa_year,
    sa_month,
    sa_days,
    sa_time,
    sa_addr,
    sa_start_place,
    sa_end_place,
    sa_reservation_check,
    sa_car_no,
    sa_nurssing_info,
    sa_taxi_info,
    sa_service_completion_status,
    sa_feedback,
    sa_registration_date
)
VALUES (
    reservation_information_seq.nextval,
    'John Doe',
    1234567890,
    'john_doe',
    'M',
    '1990-01-01',
    '1990',
    '01',
    'Monday',
    '10:00 AM',
    '123 Main St',
    'Park',
    'Airport',
    'Y',
    'ABC123',
    NULL,
    NULL,
    'C',
    NULL,
    SYSDATE
);