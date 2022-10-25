package pjmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	// 회원가입 페이지로 이동
	@RequestMapping(value="/member_join_ok.do", method = RequestMethod.POST)
	public String MemberJoinOk() throws Exception {

	
		return "member/member_join";
	}
	

	
	
}
