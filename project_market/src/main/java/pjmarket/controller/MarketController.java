package pjmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.service.MarketService;
import pjmarket.service.ReviewService;

@Controller
public class MarketController {

	@Autowired
	private MarketService ms;

	@Autowired
	private ReviewService rs;

	// 메인페이지
	@RequestMapping("mainpage")
	public String MainPage() {
		System.out.println("controller");
		return "main/mainpage";
	}

	// 상품문의게시판: 메인페이지에서 -글쓰기
	@RequestMapping("review_boardlist")
	public String ReviewBoardList(Model model) {
		return "review/review_boardlist";
	}

	// 상품문의를 하기위한 폼으로이동
	@RequestMapping("review_form")
	public String ReviewWriteForm() {
		return "review/review_form";
	}

	/*
	 * // QNA테이블 게시판글작성 메소드
	 * 
	 * @RequestMapping("qna_boardinsert") public String QnaInsert(QnaBoard qnaboard,
	 * Model model) throws Exception { int result = qs.QnaInsert(qnaboard); if
	 * (result == 1) System.out.println("----------글작성 성공----------");
	 * model.addAttribute("result", result); return "qna/qna_boardlist"; }
	 */

}
