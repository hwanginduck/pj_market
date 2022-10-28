package pjmarket.service;

import pjmarket.model.MemberDTO;

public interface MemberService {
	
	// 회원가입
	public abstract int MemberInsert(MemberDTO member) throws Exception;
	
	// 회원가입 중복 체크
	public abstract MemberDTO UserCheck(String member_id) throws Exception;
	
	// 아이디 중복 검사
	public abstract int CheckMemberID(String member_id) throws Exception;
}
