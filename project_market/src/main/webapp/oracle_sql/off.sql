select * from tab;
select * from seq;
select * from official;


create table official(
off_num NUMBER PRIMARY KEY not null,
off_name VARCHAR2(100),
off_pw VARCHAR2(100),
off_subject VARCHAR2(100),
off_content VARCHAR2(4000),
off_readcount NUMBER,
off_date DATE
);

drop table official purge;

CREATE SEQUENCE official_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;
	
	
INSERT INTO official VALUES(official_seq.nextval, '마스터', '비밀번호', '공지사항', '공지사항내용', 0, sysdate);
	
		select * from (select rownum rnum, off.* from
	(select * from official order by off_num desc) off)
	where rnum >= ((1-1) * 10 + 1) and rnum <= (1 * 10) 