package pjmarket.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pjmarket.model.Product;
import pjmarket.service.ProductServiceImpl;

@Controller
public class MarketController {

  @Autowired
  private ProductServiceImpl ps;

  // 메인페이지
  @RequestMapping("mainpage")
  public String MainPage(Model model) throws Exception {
    System.out.println("controller");

    List<Product> mainlist = ps.getProductlist();

    model.addAttribute("mainlist", mainlist);

    return "main/mainpage";
  }

  // 로그인폼이동
  @RequestMapping("loginform.do")
  public String loginform() {
    return "main/loginform";
    // member 폴더의 member_login.jsp 뷰 페이지 실행
  }

  // 로그인 세션 발행
  @RequestMapping("loginpro.do")
  public String LoginPro(@RequestParam("member_id") String member_id, HttpSession session,
      Model model) throws Exception {

    session.setAttribute("member_id", member_id);

    return "main/mainpage";
  }

  @RequestMapping("p_index.do")
  public String ProductIndexPage() {
    return "main/p_index";
  }

  // --------------------------- 각 컨트롤러 클래스 옮겨둠 ---------------------------
  // Merge 할때 계속 Conflict 발생함.
  // .Class 파일이 계속 충돌나는데, 해당 파일은 java언어로 컴파일된 언어라 비교할수도없고
  // 클래스 구조의 변경이 일어났을때 (새로만들거나, 지우거나, 옮기거나, 삭제등) 발생하기때문에 병합작업시 변경사항을 비교할수없어난감함.
  // 그래서 기존에 있던 컨트롤러들을 모두 분할시키고, 테이블별로 미리 컨트롤러 클래스를 생성해둠


}
