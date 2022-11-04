package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.LikeList;
import pjmarket.service.LikeServiceImpl;

public class LikeController {

	@Autowired
	private LikeServiceImpl ls;

	// 찜목록 이동
	@RequestMapping("listlike.do")
	public String getListLike(HttpSession session, Model model) throws Exception {
		System.out.println("getLikeList controller");
		List<LikeList> likelist = new ArrayList<LikeList>();
		String member_id = (String) session.getAttribute("member_id");

		System.out.println("Session id check : " + member_id);

		likelist = ls.getLikeList(member_id);// 리스트를 받아옴.

		model.addAttribute("likelist", likelist);

		return "main/like_list";
	}

	// 찜 등록
	@RequestMapping("insertlike.do")
	public String insertLike(HttpServletRequest request, HttpSession session, Model model) {

		System.out.println("insert Like controller");

		int product_num = Integer.parseInt(request.getParameter("product_num"));
		int options_num = Integer.parseInt(request.getParameter("options_num"));
		String member_id = (String) session.getAttribute("member_id");

		System.out.println("product_num 확인 :" + product_num);
		System.out.println("options_num 확인 :" + options_num);
		System.out.println("member_id 확인 :" + member_id);

		int result = ls.insertLike(product_num, options_num, member_id);

		if (result == 1)
			System.out.println("insert like complete");
		if (result != 1)
			System.out.println("insert like fail");

		model.addAttribute("result", result);

		return "main/likeResult";
	}

	// 찜삭제
	@RequestMapping("deletelike.do")
	public String deleteLike(int likes_num, Model model) throws Exception {
		System.out.println("delete Like controller");

//			int likes_num = Integer.parseInt(request.getParameter("likes_num"));

		int result = ls.deleteLikes(likes_num);

		if (result == 1) {
			System.out.println("result check : " + result);
			result = 3;
		}

		model.addAttribute("result", result);

		return "main/likeResult";

	}

}
