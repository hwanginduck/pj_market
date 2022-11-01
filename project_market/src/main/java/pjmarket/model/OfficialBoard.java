package pjmarket.model;

import java.sql.Date;

public class OfficialBoard {
	
	
	
			private int of_num;				// 글번호
			private String of_name;			// 작성자명
			private String master_pw;		// 관리자비밀번호
			private String of_subject;		// 글제목
			private String of_content;		// 글내용
			private int of_re_ref;
			private int of_re_lev;
			private int of_re_seq;
			private int of_readcount;		// 조회수
			private Date of_date;			// 글 등록날짜
			
			private int startRow;
			private int endRow;
			
			public int getOf_num() {
				return of_num;
			}
			public void setOf_num(int of_num) {
				this.of_num = of_num;
			}
		
			public String getOf_subject() {
				return of_subject;
			}
			public void setOf_subject(String of_subject) {
				this.of_subject = of_subject;
			}
			public String getOf_name() {
				return of_name;
			}
			public void setOf_name(String of_name) {
				this.of_name = of_name;
			}
			public String getOf_content() {
				return of_content;
			}
			public void setOf_content(String of_content) {
				this.of_content = of_content;
			}
			public int getOf_readcount() {
				return of_readcount;
			}
			public void setOf_readcount(int of_readcount) {
				this.of_readcount = of_readcount;
			}
			public Date getOf_date() {
				return of_date;
			}
			public void setOf_date(Date of_date) {
				this.of_date = of_date;
			}
			public int getStartRow() {
				return startRow;
			}
			public void setStartRow(int startRow) {
				this.startRow = startRow;
			}
			public int getEndRow() {
				return endRow;
			}
			public void setEndRow(int endRow) {
				this.endRow = endRow;
			}
			public String getMaster_pw() {
				return master_pw;
			}
			public void setMaster_pw(String master_pw) {
				this.master_pw = master_pw;
			}
			public int getOf_re_ref() {
				return of_re_ref;
			}
			public void setOf_re_ref(int of_re_ref) {
				this.of_re_ref = of_re_ref;
			}
			public int getOf_re_lev() {
				return of_re_lev;
			}
			public void setOf_re_lev(int of_re_lev) {
				this.of_re_lev = of_re_lev;
			}
			public int getOf_re_seq() {
				return of_re_seq;
			}
			public void setOf_re_seq(int of_re_seq) {
				this.of_re_seq = of_re_seq;
			}
	

}
