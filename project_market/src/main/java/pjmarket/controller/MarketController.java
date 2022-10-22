package pjmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.QnaBoard;
import pjmarket.service.MarketService;
import pjmarket.service.QnaService;


@Controller
public class MarketController {

	@Autowired
	private MarketService ms;
	private QnaService qs;

	// 메인페이지
	@RequestMapping("mainpage")
	public String MainPage() {
		return "main/mainpage";
	}
	
	@RequestMapping("qna_boardpage")
	public String QnaBoardPage() {
		// 상품문의 게시판 내용물을 리스트로 불러와야함
		return "qna/qna_boardpage";
	}
	
	// 상품문의를 하기위한 폼으로이동
	@RequestMapping("qna_writeform")
	public String QnaBoardWriteForm() {
		return "qna/qna_writeform";
	}
	
	@RequestMapping("qna_boardinsert")
	public String QnaInsert(QnaBoard qnaboard) throws Exception {
		qs.QnaInsert(qnaboard);
		return "redirect: qna/qna_boardpage";
	}
	
	

}
