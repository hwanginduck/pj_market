package pjmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.service.MarketService;


@Controller
public class MarketController {

	@Autowired
	private MarketService ms;

	// 메인페이지
	@RequestMapping("mainpage")
	public String MainPage() {
		return "main/mainpage";
	}
	

}
