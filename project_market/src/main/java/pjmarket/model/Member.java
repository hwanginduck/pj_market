package pjmarket.model;

import java.util.Date;

public class Member {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_tel;
	private String member_email;
	private String member_hyu;
	private String member_stop;
	private String member_tiers;
	private Date member_date;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_hyu() {
		return member_hyu;
	}

	public void setMember_hyu(String member_hyu) {
		this.member_hyu = member_hyu;
	}

	public String getMember_stop() {
		return member_stop;
	}

	public void setMember_stop(String member_stop) {
		this.member_stop = member_stop;
	}

	public String getMember_tiers() {
		return member_tiers;
	}

	public void setMember_tiers(String member_tiers) {
		this.member_tiers = member_tiers;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}

}
