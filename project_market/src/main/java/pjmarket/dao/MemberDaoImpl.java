package pjmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.MemberDTO;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;

	// 회원 가입정보 저장
	@Override
	public int MemberInsert(MemberDTO member) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO로 값들어옴");
		return session.insert("member_join", member);
	}
	
	// 로그인 인증
	@Override
	public MemberDTO UserCheck(String member_id) {
		// TODO Auto-generated method stub
		System.out.println("ID: "+member_id);
		return session.selectOne("login_check", member_id);
	}
	
	// 아이디 중복검사
	@Override
	public int CheckMemberID(String member_id) throws Exception {
		// TODO Auto-generated method stub
		int re = -1;	// 사용가능한 ID
		MemberDTO DTO = session.selectOne("login_check", member_id);
		if(DTO != null)
			re = 1;		// 중복id
		return re;
	}



}
