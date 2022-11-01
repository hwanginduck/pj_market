package pjmarket.controller;

import java.io.File;


import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pjmarket.model.CartList;
import pjmarket.model.LikeList;
import pjmarket.model.Product;
import pjmarket.service.CartServiceImpl;
import pjmarket.service.LikeServiceImpl;
import pjmarket.model.QnaBoard;
import pjmarket.model.Review;
import pjmarket.service.MemberServiceImpl;
import pjmarket.service.QnaServiceImpl;
import pjmarket.service.ProductServiceImpl;
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
		
		}else if(request.getParameter("likes_num") == null && request.getParameter("cart_num") != null) {
			
			System.out.println("cartlist 삭제 controller 진입");
			int cart_num = Integer.parseInt(request.getParameter("cart_num"));
			System.out.println("cart_num 확인 : " +cart_num);
			
			int result = deleteCart(cart_num, model);
			
			if(result == 1) {
				result = 2;
				model.addAttribute("result", result);
				System.out.println("result 값 출력 : " +result);
			}
			
			return "main/cartResult";	
			
		}
		
		return null;
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
	
	
	// 상품등록
	@RequestMapping("insert_product.do")
	public String insertProduct(@RequestParam("product_img1") MultipartFile mf, Product product, HttpServletRequest request, Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;

		String file[] = new String[2];
		//file = filename.split(".");
		//System.out.println(file.length);
		//System.out.println("file0="+file[0]);
		//System.out.println("file1="+file[1]);

		String newfilename = "";

		if(filename != ""){	 // 첨부파일이 전송된 경우	

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);		

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();		// 파일명		Koala
			file[1] = st.nextToken();		// 확장자	    jpg

			if(size > 200000){				// 100KB
				result=2;
				model.addAttribute("result", result);

				return "main/uploadResult";

			}else if(!file[1].equals("jpg") &&
					!file[1].equals("gif") &&
					!file[1].equals("png") ){

				result=3;
				model.addAttribute("result", result);

				return "main/uploadResult";
			}
			
		}
		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
		
		System.out.println("여기까지 되나?");
		
		product.setProduct_img(newfilename);

		result = productservice.insertProduct(product);
		
		model.addAttribute("result", result);
		
		return "main/uploadResult";
	}
	
	

	// 상품문의게시판
	@RequestMapping("qna_boardlist.do")
	public String QnaBoardList(HttpServletRequest request, Model model) { 
		
		List<QnaBoard> boardlist = new ArrayList<QnaBoard>();

		int page = 1;
		int limit = 5; // 한 화면에 출력할 레코드수

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
	public String QnaBoardWriteForm(HttpServletRequest request, QnaBoard qnaboard, Model model) {
		QnaBoardList(request, model);
		// 상품코드 = 상품명을 가져와야함
		// 아이디값 세션으로 가져와야함
		// qna_re값 1) admin일경우 1, 
		// qna_group 그룹값을 조합해야함
		
		
		return "qna/qna_writeform";
	}

	// QNA테이블 게시판글작성 메소드
	@RequestMapping("qna_boardinsert.do")
	public String QnaInsert(HttpServletRequest request, QnaBoard qnaboard, Model model) throws Exception {
		int result = qs.QnaInsert(qnaboard);
		if (result == 1)
		System.out.println("----------글작성 성공----------");
		model.addAttribute("result", result);
		
		QnaBoardList(request, model);
		
		return "redirect:/";
	}

	// 리뷰 쓰는 폼으로 이동
	@RequestMapping("review_writeform")
	public String ReviewWriteForm(Model model ,String member_id, HttpSession session ) throws Exception {
		
//		@RequestParam("product_num") int product_num,
//		 @RequestParam("options_num") int options_num 
	
		// session 에서 아이디 구해오기
				member_id = (String)session.getAttribute("member_id");
				System.out.println("아이디 : "+member_id);
				
				// 상품코드 구해오기
//				Product product = rs.getProductNum(product_num);
//				
//				model.addAttribute("product", product);
//				model.addAttribute("member_id", member_id);
//				model.addAttribute("options_num", options_num);
		
		return "review/review_writeform";
	}

	// 리뷰 게시판 작성 성공 이미지 불러오기
	@RequestMapping("review_insertresult")
	public String ReviewInsert(Review review, Model model, @RequestParam("review_img1") MultipartFile mf,
		HttpServletRequest request) throws Exception {
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); 
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		
	    int result=0;

		String file[] = new String[2];
		//file = filename.split(".");
		//System.out.println(file.length);
		//System.out.println("file0="+file[0]);
		//System.out.println("file1="+file[1]);

		String newfilename = "";

		if(filename != ""){	 // 첨부파일이 전송된 경우	

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);		

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();		
			file[1] = st.nextToken();		

			if(size > 2000000){				
				result=2;
				model.addAttribute("result", result);
				
				return "review/review_insertresult";

			}else if(!file[1].equals("jpg") &&
					!file[1].equals("jpeg") &&
					!file[1].equals("gif") &&
					!file[1].equals("png") ){

				result=3;
				model.addAttribute("result", result);

				return "review/review_insertresult";
			}
			
		}
		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
		
//		System.out.println("리뷰 글 작성 성공");
		
		review.setReview_img(newfilename);

		result = rs.ReviewInsert(review);
		
		model.addAttribute("result", result);
		

		return "review/review_insertresult";
	}

	// 리뷰 게시판 목록 
	@RequestMapping("review_boardlist")
	public String ReviewBoardList(Model model, HttpServletRequest request) throws Exception {

		List<Review> boardlist = new ArrayList<Review>();

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int listcount = rs.getListCount();

		boardlist = rs.getBoardList(page);

		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
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
		System.out.println("boardlistsize :"+boardlist.size());

		return "review/review_boardlist";
	}
	
	// 리뷰 상세 
	@RequestMapping("review_detail")
	public String reviewDetail(@RequestParam("review_no") int review_no,
							   Model model, Review review) throws Exception{
		
//		   @RequestParam("p_no") int p_no
		System.out.println("디테일 폼");
		// 조회수 증가
		int result = rs.updateHit(review_no);
		System.out.println("조회수 증가 결과: "+ result);
		
		// 상품명
//		Product product = rs.getProductName(p_no);
		
		// 리뷰 내용 구해오기
		review = rs.select(review_no);
		System.out.println("리뷰 상세 내용: "+review);
		
		String content = review.getReview_content().replace("\n","<br>");
		
		model.addAttribute("review", review);
		model.addAttribute("content", content);
//		model.addAttribute("product", product);

		if(review.getReview_img() != null) {
		
			String imgs = review.getReview_img();		
			String[] img = imgs.split("/");
			model.addAttribute("img", img);
		}
		
				
		return "review/review_detail";
	}

}
