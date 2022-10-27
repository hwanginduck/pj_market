package pjmarket.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pjmarket.model.MemberDTO;
import pjmarket.service.MemberServiceImpl;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl ms;

	// 회원가입 페이지로 이동
	@RequestMapping("member_join.do")
	public String MemberJoin() {
	
		return "member/member_join";
	}
	
	// 회원가입 버튼눌려짐(회원정보 DB에 저장)
	@RequestMapping(value="/member_join_ok.do", method = RequestMethod.POST)
	public String MemberJoinOk(MemberDTO member) throws Exception {
	
		ms.MemberInsert(member);
		
	
		return "member/member_join_result";
	}
	
	// 회원가입 완료(완료 후 login 페이지로 이동)
	@RequestMapping("member_join_result.do")
	public String MemberJoinResult() {
		
		return "member/member_loginform";
	}
	
	
}
