-- 회원 테이블
CREATE TABLE Member (
    m_idx INT PRIMARY KEY,
    m_name VARCHAR2(50) NOT NULL,
    m_nickname VARCHAR2(50) NOT NULL,
    m_email VARCHAR2(100) NOT NULL,
    m_pwd VARCHAR2(100) NOT NULL,
    m_zipcode VARCHAR2(100),
    m_addr VARCHAR2(100),
    m_rdate DATE DEFAULT SYSDATE,
    m_grade VARCHAR2(100)
);

DROP TABLE Member;
DROP TABLE Pet;
DROP TABLE Health;
DROP TABLE Feeding;
DROP TABLE Weight;
DROP TABLE Board;
DROP TABLE Reply;
DROP TABLE PostImages;
DROP TABLE Location;
DROP TABLE Note;

-- 관리자 계정 삽입
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    1,                                      -- 회원 인덱스 (Primary Key)
    '관리자',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '서울특별시 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '관리자'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    5,                                      -- 회원 인덱스 (Primary Key)
    '관리자',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '서울특별시 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '관리자'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    5,                                      -- 회원 인덱스 (Primary Key)
    '관리자',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '울산시 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '관리자'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    5,                                      -- 회원 인덱스 (Primary Key)
    '관리자',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '부산시 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '관리자'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    5,                                      -- 회원 인덱스 (Primary Key)
    '관리자',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '충청남도 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '관리자'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    6,                                      -- 회원 인덱스 (Primary Key)
    '관리자6',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin6@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '충청북도 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '일반'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    7,                                      -- 회원 인덱스 (Primary Key)
    '일반인',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin6@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '충청북도 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '일반'                                 -- 등급
);
INSERT INTO Member (m_idx, m_name, m_nickname, m_email, m_pwd, m_zipcode, m_addr, m_rdate, m_grade)
VALUES (
    8,                                      -- 회원 인덱스 (Primary Key)
    '일반인',                               -- 회원 이름
    'admin',                                -- 회원 ID 이름
    'admin6@example.com',                    -- 이메일
    'admin',                                -- 비밀번호
    '12345',                                -- 우편번호
    '충청북도 중구 을지로 100',            -- 주소
    CURRENT_DATE,                           -- 가입일
    '일반'                                 -- 등급
);

CREATE SEQUENCE Member_Seq
START WITH 10
INCREMENT BY 1
NOCACHE
NOCYCLE;



-- 반려동물 테이블
CREATE TABLE Pet (
    p_idx INT PRIMARY KEY,               -- 반려동물 인덱스
    p_name VARCHAR2(200) NOT NULL,        -- 반려동물 이름
    p_value VARCHAR2(200) NOT NULL,       -- 반려동물 종류
    p_breed VARCHAR2(200) NOT NULL,       -- 반려동물 품종
    p_birthday DATE,                     -- 생일
    p_gender VARCHAR2(100),                -- 성별
    p_serialNum VARCHAR2(100),            -- 시리얼 번호
    m_idx INT,                           -- 회원 인덱스 (외래키)
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx)
);

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'PET'
AND constraint_type = 'R';

ALTER TABLE Pet
DROP CONSTRAINT SYS_C004212;

ALTER TABLE Pet
ADD CONSTRAINT FK_PET_MEMBER
FOREIGN KEY (m_idx)
REFERENCES Member(m_idx)
ON DELETE CASCADE;

ALTER TABLE Pet ADD p_photo VARCHAR2(255);

CREATE SEQUENCE Pet_Seq
START WITH 21
INCREMENT BY 1
NOCACHE
NOCYCLE;

select * from pet;
-- 반려동물 예시
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (1, '바둑이', '개', '골든 리트리버', TO_DATE('2018-05-20', 'YYYY-MM-DD'), '수컷', 'SN123456', 1);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (2, '해피', '개', '래브라도 리트리버', TO_DATE('2017-08-15', 'YYYY-MM-DD'), '암컷', 'SN123457', 2);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (3, '초코', '개', '비글', TO_DATE('2019-12-01', 'YYYY-MM-DD'), '수컷', 'SN123458', 3);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (4, '루비', '개', '프렌치 불독', TO_DATE('2020-03-10', 'YYYY-MM-DD'), '암컷', 'SN123459', 4);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (5, '맥스', '개', '푸들', TO_DATE('2016-11-05', 'YYYY-MM-DD'), '수컷', 'SN123460', 5);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (6, '데이지', '개', '로트와일러', TO_DATE('2019-07-30', 'YYYY-MM-DD'), '암컷', 'SN123461', 1);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (7, '로키', '개', '시베리안 허스키', TO_DATE('2015-01-22', 'YYYY-MM-DD'), '수컷', 'SN123462', 2);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (8, '모모', '개', '복서', TO_DATE('2018-09-14', 'YYYY-MM-DD'), '암컷', 'SN123463', 3);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (9, '심바', '고양이', '페르시안', TO_DATE('2018-06-21', 'YYYY-MM-DD'), '수컷', 'SN123464', 4);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (10, '나나', '고양이', '샴', TO_DATE('2017-10-31', 'YYYY-MM-DD'), '암컷', 'SN123465', 5);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (11, '올리버', '고양이', '메인쿤', TO_DATE('2019-02-17', 'YYYY-MM-DD'), '수컷', 'SN123466', 1);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (12, '루나', '고양이', '래그돌', TO_DATE('2020-01-29', 'YYYY-MM-DD'), '암컷', 'SN123467', 2);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (13, '레오', '고양이', '브리티시 숏헤어', TO_DATE('2016-12-05', 'YYYY-MM-DD'), '수컷', 'SN123468', 3);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (14, '미아', '고양이', '스코티시 폴드', TO_DATE('2018-04-23', 'YYYY-MM-DD'), '암컷', 'SN123469', 4);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (15, '오스카', '고양이', '벵갈', TO_DATE('2017-07-11', 'YYYY-MM-DD'), '수컷', 'SN123470', 5);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (16, '코코', '고양이', '스핑크스', TO_DATE('2019-11-19', 'YYYY-MM-DD'), '암컷', 'SN123471', 1);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (17, '타이거', '고양이', '아비시니안', TO_DATE('2018-08-03', 'YYYY-MM-DD'), '수컷', 'SN123472', 2);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (18, '미미', '고양이', '버만', TO_DATE('2020-05-25', 'YYYY-MM-DD'), '암컷', 'SN123473', 3);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (19, '스모키', '고양이', '아메리칸 숏헤어', TO_DATE('2017-09-18', 'YYYY-MM-DD'), '수컷', 'SN123474', 4);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx) VALUES (20, '미시', '고양이', '오리엔탈 숏헤어', TO_DATE('2016-02-14', 'YYYY-MM-DD'), '암컷', 'SN123475', 5);
INSERT INTO Pet (p_idx, p_name, p_value, p_breed, p_birthday, p_gender, p_serialNum, m_idx)
VALUES (Pet_Seq.NEXTVAL, '초비', '고양이', '고양이', TO_DATE('2020-04-21', 'YYYY-MM-DD'), '수컷', 'SN1234123', 1);

-- 건강 정보 테이블
CREATE TABLE Health (
    h_idx INT NOT NULL,
    m_idx INT NOT NULL,
    p_idx INT NOT NULL,
    h_type VARCHAR2(50) NOT NULL,
    h_rdate DATE NOT NULL,
    h_time DATE NOT NULL,
    h_cost NUMBER(10, 2) NOT NULL,
    h_content VARCHAR2(50) NOT NULL,
    h_hname VARCHAR2(100) NULL,
    h_ndate DATE NULL,
    PRIMARY KEY (h_idx),
    CONSTRAINT FK_MEMBER_HEALTH FOREIGN KEY (m_idx) REFERENCES member(m_idx) ON DELETE CASCADE,
    CONSTRAINT FK_PET_HEALTH FOREIGN KEY (p_idx) REFERENCES pet(p_idx) ON DELETE CASCADE
);

CREATE SEQUENCE seq_h_idx
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE VIEW HealthView AS
SELECT 
    h.h_idx, 
    h.m_idx, 
    m.m_name,
    h.p_idx, 
    p.p_name AS pet_name, 
    h.h_type, 
    h.h_rdate, 
    h.h_time, 
    h.h_cost, 
    h.h_content, 
    h.h_hname, 
    h.h_ndate
FROM 
    Health h
JOIN 
    Member m ON h.m_idx = m.m_idx
JOIN 
    Pet p ON h.p_idx = p.p_idx;

-- 예제 데이터 추가
INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 1, 1, '진료', TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('10:00:00', 'HH24:MI:SS'), 100.00, '기본 진료', '서울병원', TO_DATE('2024-07-15', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 2, 2, '검진', TO_DATE('2024-07-02', 'YYYY-MM-DD'), TO_DATE('11:00:00', 'HH24:MI:SS'), 200.00, '정기 검진', '강남병원', TO_DATE('2024-07-16', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 3, 3, '치료', TO_DATE('2024-07-03', 'YYYY-MM-DD'), TO_DATE('12:00:00', 'HH24:MI:SS'), 300.00, '치료 방문', '연세병원', TO_DATE('2024-07-17', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 4, 4, '수술', TO_DATE('2024-07-04', 'YYYY-MM-DD'), TO_DATE('13:00:00', 'HH24:MI:SS'), 400.00, '수술 예약', '삼성병원', TO_DATE('2024-07-18', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 5, 5, '상담', TO_DATE('2024-07-05', 'YYYY-MM-DD'), TO_DATE('14:00:00', 'HH24:MI:SS'), 500.00, '건강 상담', '서울병원', TO_DATE('2024-07-19', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 1, 6, '진료', TO_DATE('2024-07-06', 'YYYY-MM-DD'), TO_DATE('15:00:00', 'HH24:MI:SS'), 600.00, '기본 진료', '강남병원', TO_DATE('2024-07-20', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 2, 7, '검진', TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('16:00:00', 'HH24:MI:SS'), 700.00, '정기 검진', '연세병원', TO_DATE('2024-07-21', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 3, 8, '치료', TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('17:00:00', 'HH24:MI:SS'), 800.00, '치료 방문', '삼성병원', TO_DATE('2024-07-22', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 4, 9, '수술', TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('18:00:00', 'HH24:MI:SS'), 900.00, '수술 예약', '서울병원', TO_DATE('2024-07-23', 'YYYY-MM-DD'));

INSERT INTO Health (h_idx, m_idx, p_idx, h_type, h_rdate, h_time, h_cost, h_content, h_hname, h_ndate)
VALUES (seq_h_idx.NEXTVAL, 5, 10, '상담', TO_DATE('2024-07-10', 'YYYY-MM-DD'), TO_DATE('19:00:00', 'HH24:MI:SS'), 1000.00, '건강 상담', '강남병원', TO_DATE('2024-07-24', 'YYYY-MM-DD'));





------------ 천태광님 sql----------------------------
----------------BOARD------------------------------
create table board (
	b_idx	int		NOT NULL,
	m_idx	int		NOT NULL,
	b_cate	varchar2(50)		NULL,
	b_title	varchar2(100)		NULL,
	b_content	clob	not NULL,
	b_rdate	date		NULL,
	b_udate	date		NULL,
	b_ddate	date		NULL,
	m_name	VARCHAR2(50)		NULL
)
----------------BOARD-------------------------------

----------------BOARD_IMAGES-----------------------
create table board_images 
(
img_idx	int	not null,
b_idx int	not null,
b_filename varchar2(100)		not null
)
----------------BOARD_IMAGES------------------------

----------------REPLY--------------------------------
create table reply
(
re_idx 				int 					not null,
re_content			varchar2(2000) 	not null,
re_rdate				date 	default sysdate,
re_depth			int					null,
b_idx					int					not null,
m_idx				int					not null,
m_name				varchar2(50)		not null

)
----------------REPLY--------------------------------

CREATE OR REPLACE VIEW reply_view AS
SELECT
    re.re_idx,
    re.b_idx,
    re.m_idx,
    re.re_content,
    re.re_rdate,
    m.m_name,
    b.b_title
FROM
    reply re
JOIN
    member m ON re.m_idx = m.m_idx
JOIN
    board b ON re.b_idx = b.b_idx;


----------------Answer--------------------------------
create table answer
(
a_idx int not null,
b_idx int not null,
m_idx int not null,
a_content clob not null,
a_rdate date default sysdate,
a_udate date,
m_name varchar2(50) not null
)

----------------Answer--------------------------------

------------------DB 데이터 확인용----------------
select * from board
select * from board_images
select * from reply
select * from answer
------------------DB 데이터 확인용----------------

------------------DB 삭제----------------
drop table board cascade constraints
drop table board_images cascade constraints
drop table reply cascade constraints
------------------DB 삭제----------------

--sequence 
create sequence seq_board_b_idx

create sequence seq_board_images_img_idx

create sequence seq_reply_re_idx

create sequence seq_answer_a_idx


-----------------------PRIMARY KEY 설정-------------------------------
alter table board
add constraint pk_board_b_idx primary key (b_idx)

alter table board_images
add constraint pk_board_images_img_idx primary key (img_idx)

alter table reply
add constraint pk_reply_re_idx primary key (re_idx)

alter table answer
add constraint pk_answer_a_idx primary key (a_idx)

-----------------------PRIMARY KEY 설정-------------------------------



-----------------------FOREIGN KEY  설정-------------------------------
--post + post_images foreign key 설정

alter table board
add constraint fk_board_m_idx foreign key (m_idx) references member (m_idx)
												on delete cascade

ALTER TABLE board_images
ADD CONSTRAINT fk_board_images_b_idx FOREIGN KEY (b_idx) REFERENCES board (b_idx)
												  on delete cascade
												  
alter table reply
add constraint fk_reply_b_idx foreign key (b_idx) references board (b_idx)
												on delete cascade
												
alter table reply
add constraint fk_reply_m_idx foreign key (m_idx) references member(m_idx)
												on delete cascade 
												
alter table answer
add constraint fk_answer_b_idx foreign key (b_idx) references board (b_idx)
												on delete cascade
												
alter table answer
add constraint fk_answer_m_idx foreign key (m_idx) references member(m_idx)
												on delete cascade 
												
-----------------------FOREIGN KEY  설정-------------------------------
												  
												  
												  


drop table board cascade constraints

drop table board	

drop table board_images cascade constraints

select * from board_all_view

select * from board

select * from board_images

create sequence seq_idx

SELECT *FROM post
ORDER BY b_idx DESC

select * from MEMBER

drop table post

	SELECT v.*
		FROM (
		    SELECT
		        p.*, 
		        RANK() OVER (ORDER BY b_idx DESC) AS no
		    FROM (
		        SELECT * FROM post_all_view
		    ) p
		) v
		WHERE no BETWEEN 1 AND 5
		
		
		create view post_all_view as
			select p.*, i.b_filename 
			from post p 
			join post_images i 
			on p.b_idx = i.b_idx
	
		INSERT INTO board (b_idx, m_idx, b_title, b_content, m_name)
VALUES (1, 1, 'Sample Title', 'This is a sample content.', 'John Doe')
	
			SELECT seq_board_b_idx.nextval FROM dual
			alter sequence seq_board_b_idx increment by +1
	
			select seq_board_images_img_idx.nextVal from dual
			
			alter sequence seq_board_images_img_idx increment by +1
			
-- 임시 데이터 삽입

INSERT INTO board_images (img_idx, b_idx, b_filename)
VALUES (1, 1, 'image_path.jpg');
			
-- 테스트

select * from board_images where b_idx=2 

select * from board

select * from board_images


--페이징 테스트
select
rank() over(order by b_idx desc) as no, b.*
from 
	(select * from board) b


desc member


-- 삭제 연습
delete * form board where b=ix-7;

delete from board where b_idx = 7
select * from board



ALTER TABLE board_images
DROP CONSTRAINT fk_board_b_idx

DELETE FROM board_images
WHERE b_idx NOT IN (SELECT b_idx FROM board)


-- 페이지 카테고리 분류 테스트
		select
			rank() over(order by b_idx desc) as no, b.*
			from 
			(select * from board where b_cate = free)

			select * from board where b_cate = 'medical'
			
			select p.*
			from(
				select
				rank() over(order by b_idx desc) as no, b.*
				from 
					(select * from board where b_cate = 'free') b
 			)p
			where no between 1 and  5
			
			
select * from board where b_idx = 1
