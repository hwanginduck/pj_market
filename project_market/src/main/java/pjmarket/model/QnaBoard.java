package pjmarket.model;

import java.sql.Timestamp;

public class QnaBoard {

	private int qna_no; /* 문의번호 */
	private String member_id; /* 아이디 */
	private int product_num; /* 상품코드 */
	private int qna_re; /* 댓글여부 */
	private String qna_content; /* 내용 */
	private Timestamp qna_date; /* 작성일 */
	private int qna_group;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getQna_re() {
		return qna_re;
	}
	public void setQna_re(int qna_re) {
		this.qna_re = qna_re;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_group() {
		return qna_group;
	}
	public void setQna_group(int qna_group) {
		this.qna_group = qna_group;
	}
	
}
