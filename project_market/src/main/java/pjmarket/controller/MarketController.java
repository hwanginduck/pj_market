package pjmarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.QnaBoard;
import pjmarket.service.MarketService;
import pjmarket.service.QnaService;

@Controller
public class MarketController {

	@Autowired
	private MarketService ms;

	@Autowired
	private QnaService qs;

	// 메인페이지
	@RequestMapping("mainpage")
	public String MainPage() {
		return "main/mainpage";
	}

	// 상품문의게시판: 메인페이지에서 -글쓰기
	@RequestMapping("qna_boardlist")
	public String QnaBoardList(Model model) {
		return "qna/qna_boardlist";
	}

	// 상품문의를 하기위한 폼으로이동
	@RequestMapping("qna_writeform")
	public String QnaBoardWriteForm() {
		return "qna/qna_writeform";
	}

	// QNA테이블 게시판글작성 메소드
	@RequestMapping("qna_boardinsert")
	public String QnaInsert(QnaBoard qnaboard, Model model) throws Exception {
		int result = qs.QnaInsert(qnaboard);
		if (result == 1)
			System.out.println("----------글작성 성공----------");
		model.addAttribute("result", result);
		return "qna/qna_boardlist";
	}

	// QNA테이블 게시판리스트

}
