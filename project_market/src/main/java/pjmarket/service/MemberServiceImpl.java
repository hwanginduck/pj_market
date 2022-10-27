package pjmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pjmarket.dao.MemberDaoImpl;
import pjmarket.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDaoImpl dao;

	// 회원가입
	@Override
	public int MemberInsert(MemberDTO member)throws Exception {
		// TODO Auto-generated method stub
	return dao.MemberInsert(member);
	}

	// 로그인 인증
	@Override
	public  MemberDTO UserCheck(String member_id) {
		// TODO Auto-generated method stub
		return dao.UserCheck(member_id);
	}



}
