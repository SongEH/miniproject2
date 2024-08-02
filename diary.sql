

--------------------- 테스트용 start --------------------

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

select * from member

 -- 테이블 + 제약조건까지 삭제 (필요시)
drop table feeding  CASCADE CONSTRAINTS


-- 시퀀스 삭제  (필요시)
drop sequence 시퀀스명;
 --------------------- 테스트용 end--------------------             

-- 시퀀스
create sequence seq_weight_w_idx ;
create sequence seq_stoll_s_idx ;
create sequence seq_feeding_f_idx ;
create sequence seq_health_h_idx ;
create sequence seq_note_o_idx ;

---


CREATE TABLE Feeding (
	f_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	f_type VARCHAR2(50) NOT NULL,
	f_rdate DATE NOT NULL,
	f_time DATE,
	f_pname VARCHAR2(100)
);

CREATE OR REPLACE VIEW feeding_p_name_view AS
SELECT
    f.f_idx,
    f.m_idx,
    f.p_idx,
    f.f_type,
    f.f_rdate,
    f.f_time,
    f.f_pname,
    p.p_name AS p_name
FROM
    Feeding f
JOIN
    Pet p ON f.p_idx = p.p_idx
    
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

CREATE OR REPLACE VIEW health_p_name_view AS
SELECT
    h.h_idx,
    h.m_idx, 
    h.p_idx,
    h.h_type,
    h.h_rdate,
    h.h_time,
    h.h_cost,
    h.h_content,
    h.h_hname,
    h.h_ndate,
    p.p_name AS p_name
FROM
    Health h
LEFT JOIN
    Pet p ON h.p_idx = p.p_idx
    
    
CREATE TABLE Weight (
	w_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	w_rdate DATE NOT NULL,
	w_weight NUMBER(6,2) NOT NULL
);

CREATE OR REPLACE VIEW weight_p_name_view AS
SELECT
    w.w_idx,
    w.m_idx,  
    w.p_idx,
    w.w_rdate,
    w.w_weight,
    p.p_name AS p_name
FROM
    Weight w
LEFT JOIN
    Pet p ON w.p_idx = p.p_idx

    
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

CREATE OR REPLACE VIEW stoll_p_name_view AS
SELECT
    s.s_idx,
    s.m_idx,  
    s.p_idx,
    s.s_rdate,
    s.s_stime,
    s.s_etime,
    s.s_distance,
    s.s_memo,
    p.p_name AS p_name
FROM
    Stoll s
LEFT JOIN
    Pet p ON s.p_idx = p.p_idx

    
CREATE TABLE Note (
	o_idx INT NOT NULL,
	m_idx INT NOT NULL,
	p_idx INT NOT NULL,
	o_rdate DATE NOT NULL,
	o_time DATE,
	o_content VARCHAR2(50) NOT NULL
);

CREATE OR REPLACE VIEW note_p_name_view AS
SELECT
    o.o_idx,
    o.m_idx,  
    o.p_idx,
    o.o_rdate,
    o.o_time,
    o.o_content,
    p.p_name AS p_name
FROM
    Note o
LEFT JOIN
    Pet p ON o.p_idx = p.p_idx


------- 기본키, 외래키 설정 -----------------------------


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


-- 외래키 설정 

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




