package pjmarket.model;

import java.sql.Date;

public class OfficialBoard {
	
	
	
			private int off_num;				// 글번호
			private String off_name;			// 작성자명
			private String off_pw;		// 관리자비밀번호
			private String off_subject;		// 글제목
			private String off_content;		// 글내용
			private int off_ref;
			private int off_seq;
			private int off_lev;
			private int off_readcount;		// 조회수
			private Date off_date;			// 글 등록날짜
			
			private int startRow;
			private int endRow;
			
			
			public int getOff_num() {
				return off_num;
			}
			public void setOff_num(int off_num) {
				this.off_num = off_num;
			}
			public String getOff_name() {
				return off_name;
			}
			public void setOff_name(String off_name) {
				this.off_name = off_name;
			}
			public String getOff_pw() {
				return off_pw;
			}
			public void setOff_pw(String off_pw) {
				this.off_pw = off_pw;
			}
			public String getOff_subject() {
				return off_subject;
			}
			public void setOff_subject(String off_subject) {
				this.off_subject = off_subject;
			}
			public String getOff_content() {
				return off_content;
			}
			public void setOff_content(String off_content) {
				this.off_content = off_content;
			}
			public int getOff_ref() {
				return off_ref;
			}
			public void setOff_ref(int off_ref) {
				this.off_ref = off_ref;
			}
			public int getOff_seq() {
				return off_seq;
			}
			public void setOff_seq(int off_seq) {
				this.off_seq = off_seq;
			}
			public int getOff_lev() {
				return off_lev;
			}
			public void setOff_lev(int off_lev) {
				this.off_lev = off_lev;
			}
			public int getOff_readcount() {
				return off_readcount;
			}
			public void setOff_readcount(int off_readcount) {
				this.off_readcount = off_readcount;
			}
			public Date getOff_date() {
				return off_date;
			}
			public void setOff_date(Date off_date) {
				this.off_date = off_date;
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
			
			
}
