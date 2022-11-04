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
	private LikeServiceImpl likeservice;
	
	@Autowired
	private CartServiceImpl cartservice;
	
	@Autowired
	private ProductServiceImpl productservice;

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
	@RequestMapping("like_list.do")
	public String Like_List(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		System.out.println("like_list controller 진입");
		List<LikeList> likelist = new ArrayList<LikeList>();
		
		String member_id = (String)session.getAttribute("member_id");
		
		likelist = likeservice.getLikeList(member_id);// 리스트를 받아옴.
		
		model.addAttribute("likelist", likelist);
			
		return "main/like_list";
	}
	
	@RequestMapping("likeinsert.do")
	public String insertLike(HttpServletRequest request, HttpSession session ,Model model) {
		
		System.out.println("insert Like controller");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int options_num = Integer.parseInt(request.getParameter("options_num"));
		String member_id = (String)session.getAttribute("member_id");
		
		System.out.println("product_num 확인 :" +product_num);
		System.out.println("options_num 확인 :" +options_num);
		System.out.println("member_id 확인 :" +member_id);
		
		int result = likeservice.insertLike(product_num, options_num, member_id);
		
		System.out.println("result check : " + result);
		
		model.addAttribute("result", result);
		
		return "main/likeResult";
	}
	
	//찜삭제
	@RequestMapping("likedelete.do")
	public String Like_Delete(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		System.out.println("Like_Delete controller진입");
		
		int likes_num = Integer.parseInt(request.getParameter("likes_num"));
		
		int result = likeservice.deleteLikes(likes_num);
		
		model.addAttribute("result", result);
		
		return "main/likesResult";
		
	}
	
	//장바구니로 이동
	@RequestMapping("cart_list.do")
	public String Cart_List(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		System.out.println("cart_list controller start");
		
		
		//product_num 이 null이 아니다 == 찜리스트 || 제품상세 페이지에서 장바구니로 product_num을 가지고 넘어올때
		if(request.getParameter("likes_num") == null && request.getParameter("cart_num") == null) {
			System.out.println("likes_num 없이 장바구니 리스트 실행");

			getCart_List(request, session, model);
			
			return "main/cart_list";			
		
		}else if(request.getParameter("likes_num") != null) {
			System.out.println("likes_num 받아서 insertCart > Like_delete > get cart_List");

			int likes_num = Integer.parseInt(request.getParameter("likes_num"));
			System.out.println("likes_num 확인 : " +likes_num);
			
			int result = insertCart(likes_num, session, model);
			
			Like_Delete(request, session, model);
			
			getCart_List(request, session, model);
			
			if(result == 1) {
				model.addAttribute("result", result);
			}
			
			return "main/cartResult";			
		
		}else{
			
			System.out.println("cartlist 삭제 controller 진입");
			
			int cart_num = Integer.parseInt(request.getParameter("cart_num"));
			
			int result = deleteCart(cart_num, model);
			System.out.println("result 1값 출력 : " +result);
			
			if(result == 1) {
				System.out.println("result 2값 출력 : " +result);
				result = 2;
				model.addAttribute("result", result);
				System.out.println("result 3값 출력 : " +result);
			}
			
			return "main/cartResult";	
			
		}
		
		
	}
	
	//장바구니 리스트 불러오기
	public List<CartList> getCart_List(HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		List<CartList> cartlist = new ArrayList<CartList>();
		
		String member_id = (String)session.getAttribute("member_id");
		
		cartlist = cartservice.getCartList(member_id);// 리스트를 받아옴.
		//list 제대로 받아왓는지 확인
		System.out.println("cartlist : " +cartlist);
		
		model.addAttribute("cartlist", cartlist);
			
		return cartlist;
	}
	
	// 찜 목록 > 장바구니 할때, 찜목록에서 상품정보 받아서 장바구니에 추가하기
	public int insertCart(int likes_num, HttpSession session, Model model) throws Exception {
		System.out.println("insertCart controller 진입");
		int result = 0;
		
		result = cartservice.insertCart(likes_num);
		
		model.addAttribute("result", result);
		
		return result;
	}
	
	// 찜목록 삭제
	public int deleteCart(int cart_num, Model model) throws Exception{
		System.out.println("deleteCart controller 진입");
		int result = 0;
		
		result = cartservice.deleteCart(cart_num);
		
		model.addAttribute("result", result);
		
		return result;
	}
	
	// 로그인폼이동
		@RequestMapping("product_insert.do")
		public String insertProductForm() {
			return "main/product_insert";
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
