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

create table board_images 
(
img_idx	int	not null,
b_idx int	not null,
b_filename varchar2(100)		not null
)

create table member
(
mem_idx 		int,
mem_name 	varchar2(100),
mem_id 			varchar2(100),
mem_pwd 		varchar2(100),
mem_zipcode	 varchar2(100),
mem_addr		 varchar2(100),
mem_ip			 varchar2(100),
mem_regdate	 date,
mem_grade	 varchar2(100)
)

insert into member (mem_idx, mem_name, mem_id, mem_pwd, mem_zipcode, mem_addr, mem_ip, mem_regdate, mem_grade)
values (1, '홍길동', 'admin', 'admin', '123-456', '서울특별시 강남구', '192.168.1.1', SYSDATE, '관리자');

------------------DB 데이터 확인용----------------
select * from member
select * from board
select * from board_images
------------------DB 데이터 확인용----------------


------------------DB 삭제----------------
drop table member
drop table board cascade constraints
drop table board_images cascade constraints
------------------DB 삭제----------------

--sequence 
create sequence seq_board_b_idx

create sequence seq_board_images_img_idx

-- post table primary key 설정
alter table board
add constraint pk_board_b_idx primary key (b_idx)

-- post_images table primary key 설정
alter table board_images
add constraint pk_board_images_img_idx primary key (img_idx)

--post + post_images foreign key 설정
ALTER TABLE board_images
ADD CONSTRAINT fk_board_b_idx FOREIGN KEY (b_idx) REFERENCES board (b_idx)



drop table board cascade constraints

drop table board	

drop table board_images cascade constraints

select * from board_all_view

select * from board

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



ALTER TABLE board_images
ADD CONSTRAINT fk_board_b_idx FOREIGN KEY (b_idx) REFERENCES board (b_idx);