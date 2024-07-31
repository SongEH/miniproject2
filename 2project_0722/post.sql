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

----------------Answer-------------------------------


----------------MEMBER------------------------------
create table member
(
m_idx 		int,
m_name 	varchar2(100),
m_id 			varchar2(100),
m_pwd 		varchar2(100),
m_zipcode	 varchar2(100),
m_addr		 varchar2(100),
m_ip			 varchar2(100),
m_regdate	 date,
m_grade	 varchar2(100)
)
----------------MEMBER------------------------------



------------------DB 데이터 확인용----------------
select * from member
select * from board
select * from board_images
select * from reply
select * from answer
------------------DB 데이터 확인용----------------

------------------DB 삭제----------------
drop table member
drop table board cascade constraints
drop table board_images cascade constraints
drop table reply cascade constraints
------------------DB 삭제----------------

--sequence 
create sequence seq_board_b_idx

create sequence seq_board_images_img_idx

create sequence seq_reply_re_idx

create sequence seq_cmt_db_cmt_idx

create sequence seq_member_m_idx

create sequence seq_answer_a_idx


-----------------------PRIMARY KEY 설정-------------------------------
alter table board
add constraint pk_board_b_idx primary key (b_idx)

alter table board_images
add constraint pk_board_images_img_idx primary key (img_idx)

alter table reply
add constraint pk_reply_re_idx primary key (re_idx)

alter table cmt_db
add constraint pk_cmt_db_cmt_idx primary key (cmt_idx)

alter table member
add constraint pk_member_m_idx primary key (m_idx)

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
												  
												  
--------------- 아래는 신경 안쓰셔도 됩니다 -------------------------												  


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


select * from answer
update answer set a_content = '관리중' where a_idx = 22

=======
----------------BOARD------------------------------
create table board (
	b_idx	int		NOT NULL,
	m_idx	int		NOT NULL,
	b_cate	varchar2(50)		NULL,
	b_title	varchar2(100)		NULL,
	b_content	clob		NULL,
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

----------------MEMBER------------------------------
create table member
(
m_idx 		int,
m_name 	varchar2(100),
m_id 			varchar2(100),
m_pwd 		varchar2(100),
m_zipcode	 varchar2(100),
m_addr		 varchar2(100),
m_ip			 varchar2(100),
m_regdate	 date,
m_grade	 varchar2(100)
)
----------------MEMBER------------------------------

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

----------------cmt-----------------------------------
create table cmt_db
(
cmt_idx 				int 					not null,
cmt_content		varchar2(2000) 	not null,
cmt_rdate			date 		default sysdate,
cmt_cmt_idx		int					null,
b_idx					int					not null,
m_idx				int					not null,
m_name				varchar2(50)		not null,
cmt_status		   char(1)			default  'n'
)
-----------------cmt-----------------------------------





insert into member (m_idx, m_name, m_id, m_pwd, m_zipcode, m_addr, m_ip, m_regdate, m_grade)
--values (1, '관리자', 'admin', 'admin', '123-456', '서울특별시 강남구', '192.168.1.1', SYSDATE, '관리자');
values (2, '테스트', 'test', 'test', '123-456', '서울특별시 강남구', '192.168.1.1', SYSDATE, '관리자');

------------------DB 데이터 확인용----------------
select * from member
select * from board
select * from board_images
select * from reply
------------------DB 데이터 확인용----------------


------------------DB 삭제----------------
drop table member
drop table board cascade constraints
drop table board_images cascade constraints
drop table reply cascade constraints
------------------DB 삭제----------------

--sequence 
create sequence seq_board_b_idx

create sequence seq_board_images_img_idx

create sequence seq_reply_re_idx

create sequence seq_cmt_db_cmt_idx

create sequence member_m_idx


-----------------------PRIMARY KEY 설정-------------------------------
alter table board
add constraint pk_board_b_idx primary key (b_idx)

alter table board_images
add constraint pk_board_images_img_idx primary key (img_idx)

alter table reply
add constraint pk_reply_re_idx primary key (re_idx)

alter table cmt_db
add constraint pk_cmt_db_cmt_idx primary key (cmt_idx)

alter table member
add constraint pk_member_m_idx primary key (m_idx)

-----------------------PRIMARY KEY 설정-------------------------------



-----------------------FOREIGN KEY  설정-------------------------------
--post + post_images foreign key 설정
ALTER TABLE board_images
ADD CONSTRAINT fk_board_images_b_idx FOREIGN KEY (b_idx) REFERENCES board (b_idx)
												  on delete cascade
												  
												  
alter table reply
add constraint fk_reply_b_idx foreign key (b_idx) references board (b_idx)
												on delete cascade
												
alter table reply
add constraint fk_reply_m_idx foreign key (m_idx) references member(m_idx)
												on delete cascade 
												

alter table cmt_db
add constraint fk_cmt_db_b_idx foreign key (b_idx) references board (b_idx)
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



insert into member (m_idx, m_name, m_id, m_pwd, m_zipcode, m_addr, m_ip, m_regdate, m_grade)
--values (1, '관리자', 'admin', 'admin', '123-456', '서울특별시 강남구', '192.168.1.1', SYSDATE, '관리자');
values (2, '테스트', 'test', 'test', '123-456', '서울특별시 강남구', '192.168.1.1', SYSDATE, '관리자');

