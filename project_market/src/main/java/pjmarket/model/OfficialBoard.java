package pjmarket.model;

import java.sql.Date;

public class OfficialBoard {
	
	
	
			private int of_num;				// 글번호
			private String of_name;			// 작성자명
			private String of_subject;		// 글제목
			private String of_content;		// 글내용
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
			public String getPf_name() {
				return of_name;
			}
			public void setPf_name(String pf_name) {
				this.of_name = pf_name;
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
	

}
