package pjmarket.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
				session.setAttribute("member_id", DTO.getMember_id());	 	// 비번 일치시
				session.setAttribute("member_pw", DTO.getMember_pw());
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
	@RequestMapping(value = "/member_idcheck.do", method = RequestMethod.POST)
	public String Member_Idcheck(@RequestParam("memid") String member_id, Model model) throws Exception {
		System.out.println("아이디 중복체크하러 id 넘어옴");
		System.out.println("id:"+member_id);
		
		int result = ms.CheckMemberID(member_id);
		model.addAttribute("result", result);
		
		return "member/member_idcheckresult";
	}
	
	// 회원정보 수정폼(수정폼에 데이터 넣기)
	@RequestMapping(value = "/member_edit.do")
	public String MemberEdit(HttpSession session, Model m) throws Exception{
		
		String member_id = (String) session.getAttribute("member_id");
		
		MemberDTO medit = ms.UserCheck(member_id);
		
		String member_phone = medit.getMember_phone();
		String member_phone2 = medit.getMember_phone2();
		String member_phone3 = medit.getMember_phone3();
		
		String member_email = medit.getMember_email();
		String member_domain = medit.getMember_domain();
		
		m.addAttribute("medit", medit);
		m.addAttribute("member_phone", member_phone);
		m.addAttribute("member_phone2", member_phone2);
		m.addAttribute("member_phone3", member_phone3);
		m.addAttribute("member_email", member_email);
		m.addAttribute("member_domain", member_domain);

		
		return "member/member_edit";
	}
	
	// 회원정보 수정 저장 (수정된 회정정보 DB에 저장)
	@RequestMapping(value = "/member_edit_ok.do", method = RequestMethod.POST)
	public String MemberEditOk(MemberDTO member, HttpServletRequest request,
							   HttpSession session, Model model) throws Exception{
		
		String member_id = (String) session.getAttribute("member_id");
		
		String member_phone = request.getParameter("member_phone");
		String member_phone2 = request.getParameter("member_phone2");
		String member_phone3 = request.getParameter("member_phone3");
		String member_email = request.getParameter("member_email");
		String member_domain = request.getParameter("member_domain");
		
		MemberDTO medit = this.ms.UserCheck(member_id);
		
		member.setMember_id(member_id);
		member.setMember_phone(member_phone);
		member.setMember_phone2(member_phone2);
		member.setMember_phone3(member_phone3);
		member.setMember_email(member_email);
		member.setMember_domain(member_domain);
		
		ms.UpdateMember(member);
		
		model.addAttribute("member_name", member.getMember_name());
		
		return "/main/mainpage";
	}
	
	// 회원정보 삭제 (값 일치하는지 확인)
	@RequestMapping(value = "/member_del.do")
	public String MemberDel(HttpSession session, Model model) throws Exception {
		
		String member_id = (String) session.getAttribute("member_id");
		MemberDTO md = ms.UserCheck(member_id);
		model.addAttribute("d_id", member_id);
		model.addAttribute("d_name", md.getMember_name());
		
		System.out.println("model값:"+model);
		return "/member/member_delete";
	}
	
	// 회원정보 삭제 완료
	@RequestMapping(value = "/member_del_ok.do")
	public String MemberDelOk(@RequestParam("member_pw") String member_pw, 
							  HttpSession session) throws Exception {
		
		String member_id = (String) session.getAttribute("member_id");
		MemberDTO member = this.ms.UserCheck(member_id);
		
		if(!member.getMember_pw().equals(member_pw)) {				// 비번 불일치시
			
			return "member/member_delete_false";
		}else {														// 일치시
			
			MemberDTO demem = new MemberDTO();
			ms.DeleteMember(member);
			
			session.invalidate();
			
			
			return "/member/member_delete_result";
		}
	}
	
	
	
	
}





































