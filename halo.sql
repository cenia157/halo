CREATE TABLE customer_information (
    ci_seq NUMBER(5) PRIMARY KEY,
    ci_applicant VARCHAR2(20) NOT NULL,
    ci_user_name VARCHAR2(20) NOT NULL,
    ci_birth_date DATE NOT NULL,
    ci_gender CHAR(1) NOT NULL,
    ci_phone_number NUMBER(20) NOT NULL
);
CREATE TABLE taxi_reservation_information (
    ti_seq NUMBER(5) PRIMARY KEY,
    ci_seq NUMBER(5) NOT NULL,
    ti_car_no VARCHAR2(10),
    ti_start_place VARCHAR2(200) NOT NULL,
    ti_end_place VARCHAR2(200) NOT NULL,
    ti_reservation_start DATE NOT NULL,
    ti_reservation_end DATE NOT NULL,
    ti_reservation_time VARCHAR2(50) NOT NULL,
    ti_reservation_check CHAR(1) NOT NULL,
    ti_registration_date DATE NOT NULL,
    ti_additional_info VARCHAR2(200),
    ti_service_completion_status CHAR(1) NOT NULL,
    ti_feedback VARCHAR2(200),
    FOREIGN KEY (ci_seq) REFERENCES customer_information(ci_seq)
);

CREATE TABLE nursing_reservation_information (
    ni_seq NUMBER(5) PRIMARY KEY,
    ci_seq NUMBER(5) NOT NULL,
    ni_addr VARCHAR2(200) NOT NULL,
    ni_reservation_start DATE NOT NULL,
    ni_reservation_end DATE NOT NULL,
    ni_reservation_time VARCHAR2(50) NOT NULL,
    ni_reservation_check CHAR(1) NOT NULL,
    ni_registration_date DATE NOT NULL,
    ni_additional_info VARCHAR2(200),
    ni_service_completion_status CHAR(1) NOT NULL,
    ni_feedback VARCHAR2(200),
    FOREIGN KEY (ci_seq) REFERENCES customer_information(ci_seq)
);




CREATE SEQUENCE customer_information_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE taxi_reservation_information_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE nursing_reservation_information_seq START WITH 1 INCREMENT BY 1;

DROP SEQUENCE customer_information_seq;
DROP SEQUENCE taxi_reservation_information_seq;
DROP SEQUENCE nursing_reservation_information_seq;

select * from customer_information;
select * from taxi_reservation_information;
select * from nursing_reservation_information;

-- Taxi_reservation_information 테이블에 새로운 예약 추가
INSERT INTO Taxi_reservation_information (ti_seq, ci_seq, ti_car_no, ti_start_place, ti_end_place, ti_reservation_start, ti_reservation_end, ti_reservation_time, ti_reservation_check, ti_registration_date, ti_additional_info, ti_service_completion_status, ti_feedback)
VALUES (taxi_reservation_information_seq, customer_information_seq, 'ABC123', '출발지', '도착지', '2023-12-31', '2024-01-01', '10:00', 'Y', '2023-12-25 08:00:00', '특별 요청사항', 'N', '서비스 후 피드백');

-- Customer_Information 테이블에 새로운 고객 정보 추가
INSERT INTO Customer_Information (ci_seq, ci_applicant, ci_user_name, ci_birth_date, ci_gender, ci_phone_number)
VALUES (customer_information_seq, '신청자1', '대상자1', '1990-01-01', 'M', '01012345678');

-- Nursing_reservation_information 테이블에 새로운 간호 예약 추가
INSERT INTO Nursing_reservation_information (ni_seq, ci_seq, ni_addr, ni_reservation_start, ni_reservation_end, ni_reservation_time, ni_reservation_check, ni_registration_date, ni_additional_info, ni_service_completion_status, ni_feedback)
VALUES (nursing_reservation_information_seq, customer_information_seq, '출발지', '2023-12-31', '2024-01-01', '10:00', 'Y', '2023-12-25 08:00:00', '특별 요청사항', 'N', '서비스 후 피드백');
