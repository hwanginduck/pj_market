package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import pjmarket.model.Product;
import pjmarket.model.QnaBoard;
import pjmarket.service.QnaServiceImpl;

@Controller
public class QnaController {

	@Autowired
	private QnaServiceImpl qs;

	// 상품문의게시판
	@RequestMapping("qna_boardlist.do")
	public String QnaBoardList(HttpServletRequest request, QnaBoard qnaboard, Product product, Model model) {
		System.out.println("----------qna_boardlist.do----------");
		List<QnaBoard> boardlist = new ArrayList<QnaBoard>();

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int product_num = qnaboard.getProduct_num();
		
		int listcount = qs.getListCount(product_num); // 해당 제품에대한 게시글수: 관련게시글에대한 페이징작업용
		boardlist = qs.getBoardList(product_num, page); // 리스트를 받아옴.
		product = qs.getProduct(product_num);
		System.out.println(product.getProduct_name());

		// 페이징 작업
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		// 페이징작업 end

		model.addAttribute("product_num", product_num);
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("product", product);
		System.out.println("product_num :" + product_num);
		System.out.println("boardlist.size(): " + boardlist.size());
		System.out.println("listcout: " + listcount);

		return "qna/qna_boardlist";
	}

	// 상품문의를 하기위한 폼으로이동
	@RequestMapping("qna_writeform.do")
	public String QnaBoardWriteForm(QnaBoard qnaboard, Model model) {

		System.out.println("qna_writeform.do");
		System.out.println("qna_no :" + qnaboard.getQna_no());
		System.out.println("product_num :" + qnaboard.getProduct_num());
		System.out.println("qna_group :" + qnaboard.getQna_group());

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
		System.out.println("----------qna_boardinsert.do----------");
		qs.QnaInsert(qnaboard);
		int product_num = qnaboard.getProduct_num();
		model.addAttribute("qnaboard", qnaboard);
		return "redirect:/qna_boardlist.do?product_num=" + product_num;
	}

	// QNA 업데이트 폼으로 이동 , 기존 작성내용들을 가지고감
	@RequestMapping("qna_updateform.do")
	public String QnaUpdate(QnaBoard qna, Product product, Model model) throws Exception {
		System.out.println("qna_updateform.do 컨트롤러");
		qna = qs.QnaUpdate(qna.getQna_no());
		product = qs.getProduct(qna.getProduct_num());
		
		model.addAttribute("qna", qna);
		model.addAttribute("product", product);
		return "qna/qna_updateform";
	}

	// QNA수정된글 DB에 저장하는 메소드
	@RequestMapping("qna_update.ok")
	public String QnaUpdateok(QnaBoard qnaboard, Model model) throws Exception {
		System.out.println("qna_update.ok 컨트롤러");
		System.out.println(qnaboard.getQna_no());
		System.out.println(qnaboard.getProduct_num());
		System.err.println(qnaboard.getQna_content());
		
		int result = qs.QnaUpdateok(qnaboard);
		if (result == 1) {
			System.out.println("수정성공");
		}
		return "redirect:/qna_boardlist.do";
	}

	@RequestMapping("qna_delete.do")
	public String QnaDelete(QnaBoard qnaboard, Model model) throws Exception {
		System.out.println("----------qna_delete.do----------");
		int product_num = qnaboard.getProduct_num();
		int result = qs.QnaDelete(qnaboard);
		if (result == 1) System.out.println("--글삭제성공--");
		System.out.println("qnaboard.getQna_no(): "+qnaboard.getQna_no());
		System.out.println("qnaboard.getMember_id(): "+qnaboard.getMember_id());
		System.out.println("qnaboard.getProduct_num(): "+qnaboard.getProduct_num());
		System.out.println("qnaboard.getQna_re(): "+qnaboard.getQna_re());
		System.out.println("qnaboard.getQna_content(): "+qnaboard.getQna_content());
		System.out.println("qnaboard.getQna_group(): "+qnaboard.getQna_group());
		System.out.println("qnaboard.getProduct_num(): "+qnaboard.getProduct_num());
		model.addAttribute("qnaboard", qnaboard);
		model.addAttribute("result", result);
//		return "redirect:/qna_boardlist.do";
		return "redirect:/qna_boardlist.do?product_num=" + product_num;
	}
	
	
	
	
	// ------------------------------ 테스트 컨트롤러 프로젝트랑 관련없는 실험내용임 ------------------------------
	@RequestMapping("testcontroller.do")
		public String TestController(QnaBoard qlist, Model model) {
		qlist = qs.TestController();
		model.addAttribute("qlist", qlist);
		return "qna/testcontroller";
	}
	
	@RequestMapping("ok.do")
	@ResponseBody
	public String Ok(QnaBoard qnaboard, Model model) {
		System.out.println("ok.do controller");
		ObjectMapper mapper = new ObjectMapper();
		
		return null;
	}
	

}
