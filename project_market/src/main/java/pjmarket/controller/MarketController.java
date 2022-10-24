package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pjmarket.model.LikeList;
import pjmarket.model.Likes;
import pjmarket.service.LikeService;
import pjmarket.service.LikeServiceImpl;
import pjmarket.service.MarketService;

@Controller
public class MarketController {

	@Autowired
	private MarketService ms;
	
	@Autowired
	private LikeServiceImpl likeservice;

	// 메인페이지
	@RequestMapping("mainpage.do")
	public String MainPage() {
		return "main/mainpage";
	}
	
	// 로그인폼이동
	@RequestMapping("loginform.do")
	public String LoginForm() {
		return "main/loginform";
	}
	
	// 로그인 세션 발행
	@RequestMapping("loginpro.do")
	public String LoginPro(@RequestParam("member_id") String member_id, HttpSession session, Model model) throws Exception {
		
		session.setAttribute("member_id", member_id);
		
		return"main/mainpage";
	}
	
	// 찜목록 이동
	@RequestMapping("like_list.do")
	public String Like_List(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		System.out.println("like_list controller");
		List<LikeList> likelist = new ArrayList<LikeList>();
		
		String member_id = (String)session.getAttribute("member_id");
		//세션으로 받아온 아이디 값 확인
		System.out.println("session id : " + member_id);
		
		likelist = likeservice.getLikeList(member_id);// 리스트를 받아옴.
		//list 제대로 받아왓는지 확인
		System.out.println("likelist : " +likelist);
		
		model.addAttribute("likelist", likelist);
			
		return "main/like_list";
	}
	
	//찜삭제
	@RequestMapping("likedelete.do")
	public String Like_Delete(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		int likes_num = Integer.parseInt(request.getParameter("likes_num"));
		System.out.println("delete controller");
		
		int result = likeservice.deleteLikes(likes_num);
		
		if(result == 1) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		
		return "main/like_list";
		
	}
	
	//장바구니로 이동
	@RequestMapping("cart_list.do")
	public String Cart_List(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		System.out.println("cart_list controller");
		
		// 메인 > 장바구니 (로그인 안되어 있을때)
		if(session.getAttribute("member_id")==null) {
		// 로그인이 안되어 있으면 로그인폼으로 이동
			return "main/loginform";
		}else {
			
		}
		return null;
		
//		int product_num = Integer.parseInt(request.getParameter("product_num"));
//		String member_id = (String)session.getAttribute("member_id");
//		//세션으로 받아온 아이디 값 확인
//		System.out.println("session id : " + member_id);
//		
//		
//		//찜, 상세페이지에서 물건 선택 후 > 장바구니
//		
//		
//		List<LikeList> likelist = new ArrayList<LikeList>();
//			
//		String member_id = (String)session.getAttribute("member_id");
//		//세션으로 받아온 아이디 값 확인
//		System.out.println("session id : " + member_id);
//			
//		likelist = likeservice.getLikeList(member_id);// 리스트를 받아옴.
//		//list 제대로 받아왓는지 확인
//		System.out.println("likelist : " +likelist);
//			
//		model.addAttribute("likelist", likelist);
//				
//		return "main/like_list";
	}
	
	
	

}
