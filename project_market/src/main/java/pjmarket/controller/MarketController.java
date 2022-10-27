package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.Review;
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

	// 리뷰 쓰는 폼으로 이동
	@RequestMapping("review_writeform")
	public String ReviewWriteForm() {
		return "review/review_writeform";
	}

	// 리뷰 게시판 작성 성공
	@RequestMapping("review_insertresult")
	public String ReviewInsert(Review review, Model model) throws Exception {

		int result = rs.ReviewInsert(review);
		if (result == 1)
		System.out.println("----------글작성 성공----------");
		model.addAttribute("result", result);

		return "review/review_insertresult";
	}

	// 리뷰 게시판 목록 
	@RequestMapping("review_boardlist")
	public String ReviewBoardList(Model model, HttpServletRequest request) throws Exception {

		List<Review> boardlist = new ArrayList<Review>();

		int page = 1;
		int limit = 10;

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

		return "review/review_boardlist";
	}

}
