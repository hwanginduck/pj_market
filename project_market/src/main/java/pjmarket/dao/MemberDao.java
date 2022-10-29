package pjmarket.dao;

import pjmarket.model.MemberDTO;

public interface MemberDao {
	
	// 회원가입
	int MemberInsert(MemberDTO member) throws Exception;
	
	// 회원가입 중복검사
	MemberDTO UserCheck(String member_id) throws Exception;
	
	// 아이디 중복검사
	int CheckMemberID(String member_id) throws Exception;

}
