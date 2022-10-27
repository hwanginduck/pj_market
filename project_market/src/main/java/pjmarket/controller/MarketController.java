package pjmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.service.MemberServiceImpl;

@Controller
public class MarketController {

//	@Autowired
//	private MemberServiceImpl ms;

	// 메인페이지
	@RequestMapping("mainpage.do")
	public String MainPage() {
		return "main/mainpage";
	}

}