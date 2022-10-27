CREATE TABLE qna (
	qna_no NUMBER NOT NULL, /* 문의번호 */
	member_id VARCHAR2(30), /* 아이디 */
	product_num NUMBER, /* 상품코드 */
	qna_re NUMBER, /* 댓글여부 */
	qna_content VARCHAR2(500), /* 내용 */
	qna_date DATE /* 작성일 */
);

CREATE SEQUENCE qna_seq 
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1;