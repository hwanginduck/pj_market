package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.QnaBoard;
import pjmarket.service.MemberServiceImpl;
import pjmarket.service.QnaServiceImpl;

@Controller
public class MarketController {

	@Autowired
	private MemberServiceImpl ms;

	@Autowired
	private QnaServiceImpl qs;

	// 메인페이지
	@RequestMapping("mainpage.do")
	public String MainPage() {
		return "main/mainpage";
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
	public String QnaBoardWriteForm() {
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

	// QNA테이블 게시판리스트

}
