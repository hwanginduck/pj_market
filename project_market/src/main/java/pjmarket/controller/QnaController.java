package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.QnaBoard;
import pjmarket.service.QnaServiceImpl;

@Controller
public class QnaController {

	@Autowired
	private QnaServiceImpl qs;

	// 상품문의게시판
	@RequestMapping("qna_boardlist.do")
	public String QnaBoardList(HttpServletRequest request,int product_num, String product_name, Model model) {

		List<QnaBoard> boardlist = new ArrayList<QnaBoard>();

		int page = 1;
		int limit = 5;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("?product_num: "+product_num);
		System.out.println("?page: "+page);

		// 총 리스트 수를 받아옴.
		int listcount = qs.getListCount(product_num);

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		boardlist = qs.getBoardList(product_num, page); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("product_num", product_num);
		model.addAttribute("product_name", product_name);
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardlist", boardlist);
		System.out.println("boardlist: "+boardlist.size());
		System.out.println(listcount);

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
		System.out.println("qna_boardinsert.do");
		System.out.println("되나?"+qnaboard.getMember_id());
		System.out.println("되나?"+qnaboard.getProduct_num());
		System.out.println("되나?"+qnaboard.getQna_content());
		System.out.println("되나?"+qnaboard.getQna_group());
		System.out.println("되나?"+qnaboard.getQna_re());
		int result = qs.QnaInsert(qnaboard);
		if (result == 1)
			model.addAttribute("result", result);
			model.addAttribute("qnaboard", qnaboard);
//			return "qna/qna_insertok";
		return "redirect:/qna_boardlist.do";
	}

	// QNA 업데이트 폼으로 이동 , 기존 작성내용들을 가지고감
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
		System.out.println("1_Qna_no: " + qnaboard.getQna_no());
		System.out.println("2_Member_id: " + qnaboard.getMember_id());
		System.out.println("3_Product_num: " + qnaboard.getProduct_num());
		System.out.println("4_Qna_re: " + qnaboard.getQna_re());
		System.out.println("5_Qna_content: " + qnaboard.getQna_content());

		int result = qs.QnaUpdateok(qnaboard);
		if (result == 1) {
			System.out.println("수정성공");
		}
		return "redirect:/qna_boardlist.do";
	}

	@RequestMapping("qna_delete.do")
	public String QnaDelete(QnaBoard qnaboard, Model model) throws Exception {
		System.out.println("qna_delete.do 값----");
		int result = qs.QnaDelete(qnaboard);
		if (result == 1) {
			System.out.println("--글삭제성공--");
		}
		return "redirect:/qna_boardlist.do";
	}

}
