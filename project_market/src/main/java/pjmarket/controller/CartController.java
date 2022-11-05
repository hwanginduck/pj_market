package pjmarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.Cart;
import pjmarket.model.CartList;
import pjmarket.service.CartServiceImpl;

@Controller
public class CartController {

	@Autowired
	private CartServiceImpl cs;

	// 장바구니로 이동
	@RequestMapping("listcart.do")
	public String getListCart(HttpSession session, Model model) throws Exception {
		String member_id = (String) session.getAttribute("member_id");
		List<CartList> list = new ArrayList<CartList>();
		list = cs.getListCart(member_id);
		model.addAttribute("list", list);

		return "main/cart_list";
	}

	// 찜목록 > 장바구니
	@RequestMapping("like_to_cart.do")
	public String LikeToCart(int likes_num, HttpSession session, Model model) throws Exception {
		System.out.println("Like to Cart controller");
//			int likes_num = Integer.parseInt(request.getParameter("likes_num"));

		System.out.println("likes_num check : " + likes_num);
		int result = cs.insertCart(likes_num);

		LikeController dlike = new LikeController();
		dlike.deleteLike(likes_num, model);
		System.out.println("delete like complete");

		if (result == 1)
			System.out.println("insert Cart complete");
		if (result != 1)
			System.out.println("insert Cart fail");

		getListCart(session, model);
		System.out.println("getListCart complete");

		return "main/cart_list";
	}

	// 상품상세 > 장바구니
	@RequestMapping("product_to_cart.do")
	public String ProductToCart(Cart cart, HttpServletRequest request, HttpSession session, Model model)
			throws Exception {

		String member_id = (String) session.getAttribute("member_id");

		cart.setMember_id(member_id);

		int result = cs.insertCart(cart);

		getListCart(session, model);

		if (result == 1) {
			result = 3;
		}

		model.addAttribute("result", result);

		return "main/cartResult";
	}

	// 장바구니 삭제
	@RequestMapping("deletecart.do")
	public String deleteCart(HttpServletRequest request, Model model) throws Exception {
		System.out.println("delete Cart controller");

		int cart_num = Integer.parseInt(request.getParameter("cart_num"));

		int result = cs.deleteCart(cart_num);

		if (result == 1) {
			System.out.println("delete cart complete");
			result = 2;
		}

		model.addAttribute("result", result);

		return "main/cartResult";
	}

}
