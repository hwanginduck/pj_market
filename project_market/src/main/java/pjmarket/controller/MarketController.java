package pjmarket.controller;

import java.io.File;


import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pjmarket.model.Cart;
import pjmarket.model.CartList;
import pjmarket.model.LikeList;
import pjmarket.model.Product;
import pjmarket.model.QnaBoard;
import pjmarket.model.Review;
import pjmarket.service.CartServiceImpl;
import pjmarket.service.LikeServiceImpl;
import pjmarket.service.MemberServiceImpl;
import pjmarket.service.ProductServiceImpl;
import pjmarket.service.QnaServiceImpl;
import pjmarket.service.ReviewService;
import pjmarket.service.ReviewServiceImpl;

@Controller
public class MarketController { 

	@Autowired
	private MemberServiceImpl ms;

	@Autowired
	private QnaServiceImpl qs; 
	 
	@Autowired
	private LikeServiceImpl ls;
	
	@Autowired
	private CartServiceImpl cs;
	
	@Autowired
	@Autowired
	private ReviewServiceImpl rs;

	// 메인페이지
	@RequestMapping("mainpage.do")
	public String MainPage() {
		System.out.println("controller");
		return "main/mainpage";
	}
	
	// 로그인폼이동
	@RequestMapping("loginform.do")
	public String loginform() {
		return "main/loginform";
		// member 폴더의 member_login.jsp 뷰 페이지 실행
	}
	
	
	// 로그인 세션 발행
	@RequestMapping("loginpro.do")
	public String LoginPro(@RequestParam("member_id") String member_id, HttpSession session, Model model) throws Exception {
		
		session.setAttribute("member_id", member_id);
		
		return"main/mainpage";
	}
	
	// 찜목록 이동
	@RequestMapping("listlike.do")
	public String getListLike(HttpSession session, Model model) throws Exception{
		System.out.println("getLikeList controller");
		List<LikeList> likelist = new ArrayList<LikeList>();
		String member_id = (String)session.getAttribute("member_id");
		
		System.out.println("Session id check : " +member_id);
		
		likelist = ls.getLikeList(member_id);// 리스트를 받아옴.
		
		model.addAttribute("likelist", likelist);
			
		return "main/like_list";
	}
	
	// 찜 등록
	@RequestMapping("insertlike.do")
	public String insertLike(HttpServletRequest request, HttpSession session ,Model model) {
		
		System.out.println("insert Like controller");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int options_num = Integer.parseInt(request.getParameter("options_num"));
		String member_id = (String)session.getAttribute("member_id");
		
		System.out.println("product_num 확인 :" +product_num);
		System.out.println("options_num 확인 :" +options_num);
		System.out.println("member_id 확인 :" +member_id);
		
		int result = ls.insertLike(product_num, options_num, member_id);
		
		if(result == 1) System.out.println("insert like complete");
		if(result != 1) System.out.println("insert like fail");
		
		model.addAttribute("result", result);
		
		return "main/likeResult";
	}
	
	//찜삭제
	@RequestMapping("deletelike.do")
	public String deleteLike(int likes_num, Model model) throws Exception{
		System.out.println("delete Like controller");
		
//		int likes_num = Integer.parseInt(request.getParameter("likes_num"));
		
		int result = ls.deleteLikes(likes_num);
		
		if(result == 1) {
			System.out.println("result check : " +result);
			result = 3;
		}
		
		model.addAttribute("result", result);
		
		return "main/likeResult";
		
	}
	
	// 장바구니로 이동
	@RequestMapping("listcart.do")
	public String getListCart(HttpSession session, Model model) throws Exception {
		
		String member_id = (String)session.getAttribute("member_id");
		
		List<CartList> list = new ArrayList<CartList>();
		
		list = cs.getListCart(member_id);
		
		model.addAttribute("list", list);
	
		return "main/cart_list";
	}
	
	// 찜목록 > 장바구니
	@RequestMapping("like_to_cart.do")
	public String LikeToCart(int likes_num, HttpSession session ,Model model) throws Exception {
		System.out.println("Like to Cart controller");
//		int likes_num = Integer.parseInt(request.getParameter("likes_num"));
		
		
		System.out.println("likes_num check : " +likes_num);
		int result = cs.insertCart(likes_num);
		
		deleteLike(likes_num, model);
		System.out.println("delete like complete");
		
		if(result == 1) System.out.println("insert Cart complete");
		if(result != 1) System.out.println("insert Cart fail");
		
		getListCart(session, model);
		System.out.println("getListCart complete");
		
		return "main/cart_list";
	}
	
	// 상품상세 > 장바구니
	@RequestMapping("product_to_cart.do")
	public String ProductToCart(Cart cart, HttpServletRequest request,  HttpSession session ,Model model) throws Exception{
		
		String member_id = (String)session.getAttribute("member_id");
		
		cart.setMember_id(member_id);
		
		int result = cs.insertCart(cart);
		
		getListCart(session, model);
		
		if(result == 1) {
			result = 3;
		}
		
		model.addAttribute("result", result);
		
		return "main/cartResult";
	}
	
	// 장바구니 삭제
	@RequestMapping("deletecart.do")
	public String deleteCart(HttpServletRequest request, Model model) throws Exception{
		System.out.println("delete Cart controller");
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		
		int result = cs.deleteCart(cart_num);
		
		if(result == 1) {
			System.out.println("delete cart complete");
			result = 2;
		}
		
		model.addAttribute("result", result);
		
		return "main/cartResult";
	}
	
	// 상품문의게시판
	@RequestMapping("qna_boardlist.do")
	public String QnaBoardList(HttpServletRequest request, Model model) { 
		
		List<QnaBoard> boardlist = new ArrayList<QnaBoard>();
		
		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수를 받아옴.
		int listcount = qs.getListCount();

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		boardlist = qs.getBoardList(page); // 리스트를 받아옴.
		
		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardlist", boardlist);
		System.out.println(listcount);
		
		
		return "qna/qna_boardlist";
	}

	// 상품문의를 하기위한 폼으로이동
	@RequestMapping("qna_writeform.do")
	public String QnaBoardWriteForm(QnaBoard qnaboard, Model model) {
		
		System.out.println("qna_writeform.do");
		System.out.println("qna_no :"+qnaboard.getQna_no());
		System.out.println("product_num :"+qnaboard.getProduct_num());
		System.out.println("qna_group :"+qnaboard.getQna_group());
		
		
		
		
		model.addAttribute("qna_no", qnaboard.getQna_no());
		model.addAttribute("product_num", qnaboard.getProduct_num());
		model.addAttribute("qna_group", qnaboard.getQna_group());
		
		// 상품코드 = 상품명을 가져와야함
		// 아이디값 세션으로 가져와야함
		// qna_re값 1) admin일경우 1, 
		// qna_group 그룹값을 조합해야함
		
		
		return "qna/qna_writeform";
	}

	// QNA테이블 게시판글작성 메소드
	@RequestMapping("qna_boardinsert.do")
	public String QnaInsert(QnaBoard qnaboard, Model model) throws Exception {
		System.out.println("qna_boardinsert.do");
		int result = qs.QnaInsert(qnaboard);
		if (result == 1)
		model.addAttribute("result", result);
//		return "qna/qna_insertok";
		return "redirect:/qna_boardlist.do";
	}
	
	
	//QNA 업데이트 폼으로 이동 , 기존 작성내용들을 가지고감
	@RequestMapping("qna_updateform.do")
	public String QnaUpdate(int qna_no, Model model) throws Exception {
		System.out.println("qna_updateform.do 컨트롤러");
		QnaBoard qnaboard = qs.QnaUpdate(qna_no);
		model.addAttribute("qnaboard", qnaboard);
		return "qna/qna_updateform";
	}
	
	// QNA수정된글 DB에 저장하는 메소드
	@RequestMapping("qna_update.ok")
	public String QnaUpdateok(QnaBoard qnaboard, Model model) throws Exception {
		System.out.println("qna_update.ok 컨트롤러");
		System.out.println("1_Qna_no: "+qnaboard.getQna_no());
		System.out.println("2_Member_id: "+qnaboard.getMember_id());
		System.out.println("3_Product_num: "+qnaboard.getProduct_num());
		System.out.println("4_Qna_re: "+qnaboard.getQna_re());
		System.out.println("5_Qna_content: "+qnaboard.getQna_content());

		int result = qs.QnaUpdateok(qnaboard);
		if (result==1) {
			System.out.println("수정성공");
		}
		return "redirect:/qna_boardlist.do";
	}
	
	@RequestMapping("qna_delete.do")
	public String QnaDelete(int qna_re, int qna_group, Model model) throws Exception {
		int result = qs.QnaDelete(qna_re, qna_group);
		if (result == 1) {
			System.out.println("--글삭제성공--");
		}
		return "redirect:/qna_boardlist.do";
	}


}
