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

	// 리뷰 쓰기위한 폼으로 이동
	@RequestMapping("review_writeform")
	public String ReviewWriteForm() {
		return "review/review_writeform";
	}
	


}
