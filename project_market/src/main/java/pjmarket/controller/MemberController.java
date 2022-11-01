package pjmarket.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 로그인 인증
	@RequestMapping(value="/member_login_ok.do")
	public String MemberLoginOk(@RequestParam("member_id") String member_id, 
								  @RequestParam("member_pw") String member_pw, 
								  HttpSession session, Model model) throws Exception {
		
		int result=0;
		MemberDTO DTO = ms.UserCheck(member_id);
		
		if(DTO == null) {			// 없는 회원
			System.out.println("없는 회원인증 데이터 DB에서 넘어옴");
			result = 1;
			model.addAttribute("result", result);
			
			return "member/member_loginresult";
			
		}else {
			if(DTO.getMember_pw().equals(member_pw)) {
				session.setAttribute(member_id, member_id);		// 비번 일치시
				System.out.println("있는 회원인증 데이터 DB에서 넘어옴");
			}else {		// 비번 불일치시
				result = 2;
				model.addAttribute("result", result);
				
				return "member/member_loginresult";
			}		
			return "/main/mainpage";
		}		 
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("member_login_go.do")
	public String MemberLoginGo() {
		return "member/member_loginform";
	}
	
	// ID중복검사 
	@RequestMapping(value = "/member_idcheck.do")
	public String Member_Idcheck(@RequestParam("member_id") String member_id, Model model) throws Exception {
		System.out.println("아이디 중복체크하러 id 넘어옴");
		System.out.println("id:"+member_id);
		
		int result = ms.CheckMemberID(member_id);
		model.addAttribute("result", result);
		
		return "member/member_idcheckresult";
	}
		
		
	
		
	
	
}





































