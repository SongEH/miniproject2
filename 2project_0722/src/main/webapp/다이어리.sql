-- 시퀀스
create sequence seq_member_m_idx ; 
create sequence seq_stoll_s_idx ;


-- 테이블 + 제약조건까지 삭제 (필요시)
drop table 태이블명  CASCADE CONSTRAINTS

-- 시퀀스 삭제  (필요시)
drop sequence 시퀀스명;

---


CREATE TABLE Board (
	b_idx INT NOT NULL,
	m_idx INT NOT NULL,
	b_cate varchar2(50) NULL,
	b_title varchar2(100) NULL,
	b_content varchar2(2000) NULL,
	b_filename varchar2(100) NULL,
	b_rdate date NULL,
	b_udate date NULL,
	b_ddate date NULL,
	m_name VARCHAR2(50) NULL
);

CREATE TABLE Reply (
	re_idx INT NOT NULL,
	b_idx2 INT NOT NULL,
	m_idx INT NOT NULL,
	re_content varchar2(2000) NULL,
	re_rdate date NULL,
	m_name VARCHAR2(50) NULL,
	b_idx INT NULL
);

CREATE TABLE Answer (
	a_idx INT NOT NULL,
	b_idx2 INT NOT NULL,
	m_idx INT NOT NULL,
	a_content varchar2(2000) NULL,
	a_rdate date NULL,
	a_udate date NULL,
	m_name VARCHAR2(50) NULL,
	b_idx INT NULL
);

CREATE TABLE Member (
	m_idx INT NOT NULL,
	m_name VARCHAR2(50) NULL,
	m_name2 VARCHAR2(50) NULL,
	m_email VARCHAR2(100) NULL,
	m_zipcode VARCHAR2(100) NULL,
	m_addr VARCHAR2(100) NULL,
	m_rdate DATE NULL,
	m_grade VARCHAR2(100) NULL
);

select * from member

CREATE TABLE Location (
	l_idx INT NOT NULL,
	l_cate varchar2(50) NULL,
	l_opentime varchar2(100) NULL,
	l_price varchar2(100) NULL,
	l_content varchar2(2000) NULL,
	l_addr varchar2(100) NULL,
	l_URL varchar2(100) NULL,
	Field VARCHAR(255) NULL
);

CREATE TABLE Feeding (
	f_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx VARCHAR2(50) NULL,
	f_type VARCHAR2(50) NOT NULL,
	f_rdate DATE NOT NULL,
	f_time DATE NULL,
	f_pname VARCHAR2(100) NULL
);

CREATE TABLE Health (
	h_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx VARCHAR2(50) NULL,
	h_type VARCHAR2(50) NOT NULL,
	h_rdate DATE NOT NULL,
	h_time DATE NULL,
	h_cost NUMBER(10, 2) NULL,
	h_content VARCHAR2(50) NOT NULL,
	h_hname VARCHAR2(100) NULL,
	h_ndate DATE NULL
);

CREATE TABLE Weight (
	w_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx VARCHAR2(50) NULL,
	w_rdate DATE NOT NULL,
	w_weight NUMBER(6,2) NOT NULL
);

CREATE TABLE Stoll (
	s_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx VARCHAR2(50) NULL,
	s_rdate DATE NOT NULL,
	s_etime DATE NOT NULL,
	s_stime DATE NOT NULL,
	s_distance INT NULL,
	s_memo VARCHAR2(100) NULL
);

CREATE TABLE Note (
	o_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx VARCHAR2(50) NULL,
	o_rdate DATE NOT NULL,
	o_time DATE NULL,
	o_content VARCHAR2(50) NOT NULL
);

ALTER TABLE Board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	b_idx,
	m_idx
);

ALTER TABLE Reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (
	re_idx,
	b_idx2,
	m_idx
);

ALTER TABLE Answer ADD CONSTRAINT PK_ANSWER PRIMARY KEY (
	a_idx,
	b_idx2,
	m_idx
);

ALTER TABLE Member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	m_idx
);

ALTER TABLE Location ADD CONSTRAINT PK_LOCATION PRIMARY KEY (
	l_idx
);

ALTER TABLE Feeding ADD CONSTRAINT PK_FEEDING PRIMARY KEY (
	f_idx,
	m_idx
);

ALTER TABLE Health ADD CONSTRAINT PK_HEALTH PRIMARY KEY (
	h_idx,
	m_idx
);

ALTER TABLE Weight ADD CONSTRAINT PK_WEIGHT PRIMARY KEY (
	w_idx,
	m_idx
);

ALTER TABLE Stoll ADD CONSTRAINT PK_STOLL PRIMARY KEY (
	s_idx,
	m_idx
);

ALTER TABLE Note ADD CONSTRAINT PK_NOTE PRIMARY KEY (
	o_idx,
	m_idx
);

ALTER TABLE Board ADD CONSTRAINT FK_Member_TO_Board_1 FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Reply ADD CONSTRAINT FK_Board_TO_Reply_1 FOREIGN KEY (
	b_idx2
)
REFERENCES Board (
	b_idx
);

ALTER TABLE Reply ADD CONSTRAINT FK_Board_TO_Reply_2 FOREIGN KEY (
	m_idx
)
REFERENCES Board (
	m_idx
);

ALTER TABLE Answer ADD CONSTRAINT FK_Board_TO_Answer_1 FOREIGN KEY (
	b_idx2
)
REFERENCES Board (
	b_idx
);

ALTER TABLE Answer ADD CONSTRAINT FK_Board_TO_Answer_2 FOREIGN KEY (
	m_idx
)
REFERENCES Board (
	m_idx
);

ALTER TABLE Feeding ADD CONSTRAINT FK_Member_TO_Feeding_1 FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Health ADD CONSTRAINT FK_Member_TO_Health_1 FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Weight ADD CONSTRAINT FK_Member_TO_Weight_1 FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Stoll ADD CONSTRAINT FK_Member_TO_Stoll_1 FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Note ADD CONSTRAINT FK_Member_TO_Note_1 FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);
