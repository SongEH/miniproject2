create table board (
	b_idx	int		NOT NULL,
	m_idx	int		NOT NULL,
	b_cate	varchar2(50)		NULL,
	b_title	varchar2(100)		NULL,
	b_content	clob	not NULL,
	b_rdate	date		NULL,
	b_udate	date		NULL,
	b_ddate	date		NULL,
	m_name	VARCHAR2(50)		NULL,
	b_readhit int null
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

select * from member
--회원번호 관리 객체 -> 시퀀스 생성
create sequence seq_member_m_idx;

create sequence member_seq;

--기본키 
alter table member 
	add constraint pk_member_idx primary key(m_idx);
	
--회원등급에 대한 check 제약
alter table member 
	add constraint ck_member_grade check(m_grade in('일반','관리자'));


	
	
-- 더미 데이터 삽입
insert into member values(seq_member_m_idx.nextVal,'일길동','일길동','hong@aaaa.com','1234','00000','서울시 관악구 남부순환로1',sysdate,'관리자')
insert into member values(seq_member_m_idx.nextVal,'김철수','김철수','kimcs@email.com','54321','00000','서울시 종로구',sysdate,'일반')
insert into member values(seq_member_m_idx.nextVal,'이영희','이영희','leeyh@email.com','98765','00000','부산시 해운대구',sysdate,'일반')


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
    10,                                      -- 회원 인덱스 (Primary Key)
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

ALTER TABLE Pet ADD p_photo VARCHAR2(255);


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



-- 건강 정보 테이블
CREATE TABLE Health (
    h_idx INT PRIMARY KEY,               -- 건강 정보 인덱스
    m_idx INT NOT NULL,                  -- 회원 인덱스 (외래키)
    p_idx INT NOT NULL,                  -- 반려동물 인덱스 (외래키)
    h_hospital VARCHAR2(100),             -- 병원명
    h_record VARCHAR2(200),               -- 진료 내역
    r_update DATE,                       -- 업데이트 날짜
    h_date DATE,                         -- 진료 날짜
    h_content VARCHAR2(2000),             -- 내용
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx),
    FOREIGN KEY (p_idx) REFERENCES Pet(p_idx)
);

-- 급여 정보 테이블
CREATE TABLE Feeding (
    f_idx INT PRIMARY KEY,               -- 급여 정보 인덱스
    m_idx INT NOT NULL,                  -- 회원 인덱스 (외래키)
    p_idx INT NOT NULL,                  -- 반려동물 인덱스 (외래키)
    r_update DATE,                       -- 업데이트 날짜
    f_date DATE,                         -- 급여 날짜
    f_name VARCHAR2(200),                 -- 급여 이름
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx),
    FOREIGN KEY (p_idx) REFERENCES Pet(p_idx)
);

-- 체중 정보 테이블
CREATE TABLE Weight (
    w_idx INT PRIMARY KEY,               -- 체중 정보 인덱스
    m_idx INT NOT NULL,                  -- 회원 인덱스 (외래키)
    p_idx INT NOT NULL,                  -- 반려동물 인덱스 (외래키)
    r_update DATE,                       -- 업데이트 날짜
    w_date DATE,                         -- 체중 기록 날짜
    w_weight NUMBER(5,2) NOT NULL,       -- 체중
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx),
    FOREIGN KEY (p_idx) REFERENCES Pet(p_idx)
);

-- 게시판 테이블
CREATE TABLE Board (
    b_idx INT PRIMARY KEY,               -- 게시판 인덱스
    m_idx INT NOT NULL,                  -- 회원 인덱스 (외래키)
    b_title VARCHAR(200),                -- 게시판 제목
    b_content VARCHAR(2000),             -- 게시판 내용
    r_update DATE,                       -- 업데이트 날짜
    b_date DATE,                         -- 게시 날짜
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx)
);

-- 댓글 테이블
CREATE TABLE Reply (
    r_idx INT PRIMARY KEY,               -- 댓글 인덱스
    b_idx INT NOT NULL,                  -- 게시판 인덱스 (외래키)
    m_idx INT NOT NULL,                  -- 회원 인덱스 (외래키)
    r_content VARCHAR(2000),             -- 댓글 내용
    r_update DATE,                       -- 업데이트 날짜
    r_date DATE,                         -- 댓글 작성 날짜
    FOREIGN KEY (b_idx) REFERENCES Board(b_idx),
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx)
);

-- 게시물 이미지 테이블
CREATE TABLE PostImages (
    img_idx INT PRIMARY KEY,             -- 이미지 인덱스
    b_idx INT NOT NULL,                  -- 게시판 인덱스 (외래키)
    filename VARCHAR(200),               -- 파일 이름
    FOREIGN KEY (b_idx) REFERENCES Board(b_idx)
);

-- 위치 정보 테이블
CREATE TABLE Location (
    l_idx INT PRIMARY KEY,               -- 위치 인덱스
    l_name VARCHAR(200),                 -- 카페명
    l_address VARCHAR(300),              -- 상세 주소
    l_latitude VARCHAR(200),             -- 위도
    l_longitude VARCHAR(200),            -- 경도
    l_url VARCHAR(200)                   -- 홈페이지 주소
);

-- 메모 테이블
CREATE TABLE Note (
    n_idx INT PRIMARY KEY,               -- 메모 인덱스
    m_idx INT NOT NULL,                  -- 회원 인덱스 (외래키)
    p_idx INT NOT NULL,                  -- 반려동물 인덱스 (외래키)
    r_update DATE,                       -- 업데이트 날짜
    n_time DATE,                         -- 시간
    n_content VARCHAR(2000),             -- 내용
    FOREIGN KEY (m_idx) REFERENCES Member(m_idx),
    FOREIGN KEY (p_idx) REFERENCES Pet(p_idx)
);
