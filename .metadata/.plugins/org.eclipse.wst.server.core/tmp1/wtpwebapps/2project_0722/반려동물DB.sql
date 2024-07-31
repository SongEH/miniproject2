/*
 --반려동물 DB 등록테이블
 
create table pet
(
	p_idx int not null,                          --반려동물번호
	p_name varchar2(100) not null,               --반려동물 이름
	p_value varchar2(100) not null,              --반려동물종류(강아지, 고양이)
	p_breed varchar2(100) not null,              --반려동물 품종
	p_birthday date sysdate,                     --반려동물 생일날짜
	p_gender varchar2(100) not null,             --반려동물 성별
	p_resistration_no varchar2(100) not null,    --반려동물 등록번호
	m_idx int not null                           --회원번호
)

--반려동물번호 관리객체 -> 시퀀스 생성
create sequence seq_pet_p_idx;

--기본키 생성
alter table pet
	add constraint pk_pet_idx primary key(p_idx);

--외래키 생성
alter table pet 
	add constraint fk_pet_m_idx foreign key (m_idx) references member(m_idx) on delete cascade;

--반려동물성별에 대한 check 제약
alter table pet
	add constraint ck_pet_gender check(p_gender in('수컷','암컷');
	
*/