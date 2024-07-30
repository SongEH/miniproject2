

--- 테스트용 

select * from member

select * from weight
drop table weight

select * from stoll
drop table stoll

select * from feeding

select * from health
delete from health where p_idx = 201

select * from note
delete from note where o_idx = 1


 -- 테이블 + 제약조건까지 삭제 (필요시)
drop table 태이블명  CASCADE CONSTRAINTS


-- 시퀀스 삭제  (필요시)
drop sequence 시퀀스명;
              

-- 시퀀스
create sequence seq_member_m_idx ; 

create sequence seq_weight_w_idx ;
create sequence seq_stoll_s_idx ;
create sequence seq_feeding_f_idx ;
create sequence seq_health_h_idx ;
create sequence seq_note_o_idx ;

---

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

CREATE TABLE Feeding (
	f_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	f_type VARCHAR2(50) NOT NULL,
	f_rdate DATE NOT NULL,
	f_time DATE,
	f_pname VARCHAR2(100)
);

CREATE TABLE Health (
	h_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	h_type VARCHAR2(50) NOT NULL,
	h_rdate DATE NOT NULL,
	h_time DATE,
	h_cost NUMBER(10, 2),
	h_content VARCHAR2(50) NOT NULL,
	h_hname VARCHAR2(100),
	h_ndate DATE
);

CREATE TABLE Weight (
	w_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	w_rdate DATE NOT NULL,
	w_weight NUMBER(6,2) NOT NULL
);

CREATE TABLE Stoll (
	s_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	s_rdate DATE NOT NULL,
	s_stime DATE NOT NULL,
	s_etime DATE NOT NULL,
	s_distance INT,
	s_memo VARCHAR2(100)
);

CREATE TABLE Note (
	o_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	o_rdate DATE NOT NULL,
	o_time DATE,
	o_content VARCHAR2(50) NOT NULL
);


ALTER TABLE Member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	m_idx
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




ALTER TABLE Feeding ADD CONSTRAINT FK_Member_TO_Feeding FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Health ADD CONSTRAINT FK_Member_TO_Health_ FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Weight ADD CONSTRAINT FK_Member_TO_Weight FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Stoll ADD CONSTRAINT FK_Member_TO_Stoll FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);

ALTER TABLE Note ADD CONSTRAINT FK_Member_TO_Note FOREIGN KEY (
	m_idx
)
REFERENCES Member (
	m_idx
);
