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

}
