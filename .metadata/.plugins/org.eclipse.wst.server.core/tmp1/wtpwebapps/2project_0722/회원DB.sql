/*

 drop table member cascade constraints
 drop sequence seq_member_m_idx
 
select * from member

select * from user_sequences

 --회원DB 등록테이블
create table member
(
	m_idx int,							--회원번호
	m_name varchar2(100) not null,		--회원이름
	m_nickname varchar2(100) not null, 	--회원닉네임
	m_email varchar2(100) not null,		--이메일(아이디)
	m_pwd varchar2(100) not null,		--비밀번호
	m_zipcode char(5) not null,			--우편번호
	m_addr varchar2(1000) not null,		--주소
	m_rdate date default sysdate,		--가입일자
	m_grade varchar2(100) default'일반'	--회원등급
)


--회원번호 관리 객체 -> 시퀀스 생성
create sequence seq_member_m_idx;

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


*/