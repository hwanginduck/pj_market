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
import pjmarket.service.MemberServiceImpl;
import pjmarket.service.QnaServiceImpl;
import pjmarket.service.ProductServiceImpl;

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

	// 메인페이지
	@RequestMapping("mainpage.do")
	public String MainPage() {
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
	public String QnaBoardWriteForm(QnaBoard qnaboard, Model model) {
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

}
