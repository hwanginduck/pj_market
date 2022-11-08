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

import pjmarket.model.OfficialBoard;
import pjmarket.model.Review;
import pjmarket.service.CartServiceImpl;
import pjmarket.service.LikeServiceImpl;
import pjmarket.service.MemberServiceImpl;
import pjmarket.service.ProductServiceImpl;
import pjmarket.service.QnaServiceImpl;
import pjmarket.service.ReviewServiceImpl;

@Controller
public class ReviewController {
	
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

		String path = request.getRealPath("/resources/upload/");
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
		System.out.println("리뷰이미지:"+review.getReview_img());
		
		String content = review.getReview_content().replace("\n","<br>");
		
		model.addAttribute("review", review);
		model.addAttribute("content", content);
//		model.addAttribute("review_img", review.getReview_img());
//		model.addAttribute("product", product);

		return "review/review_detail";
	}
		
		//리뷰 업데이트 폼으로 이동
		@RequestMapping("review_update.do")
		public String ReviewUpdate(int review_no, Model model) throws Exception {
			System.out.println("review_update");
			Review review = rs.Reviewupdate(review_no);
			model.addAttribute("review", review);
			return "review/review_update";
		}
		
		// 리뷰 업데이트 성공 
		@RequestMapping("review_updateresult")
		public String Reviewupdateresult(Review review, Model model) throws Exception {
			System.out.println("review_updateresult");

			int result = rs.ReviewUpdateok(review);
			if(result == 1) System.out.println("수정성공");
			
			model.addAttribute("result", result);
			
			return "review/review_updateresult";
		}

		// 리뷰 삭제 
		@RequestMapping("review_delete.do")
		public String reviewdeleteform(int review_no, Model model)throws Exception {
			System.out.println("review_delete");
			Review review = rs.ReviewDelete(review_no);
			model.addAttribute("review", review);
			
			return "review/review_delete";
		}
 
		// 리뷰 삭제 성공
		@RequestMapping("review_deleteresult")
		public String reviewdelete(Review review, Model model) throws Exception {
			System.out.println("review_deleteresult");

			int result = rs.ReviewDeleteOk(review);
			if(result == 1) System.out.println("삭제성공");
			
			model.addAttribute("result", result);
			return "review/review_deleteresult";
		}
		

}
