package pjmarket.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인터셉터 진입");
		
		//세션 값 가져와주기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		
		//세션에 저장된 member_id 값이 null 이거나 비었다면 loginform.do 요청을 보낸다
		if (member_id == null || member_id.equals(""))  {		
		System.out.println("session에 로그인 값이 없어 로그인 페이지로 이동");
		response.sendRedirect("loginform.do");	// 세션이 없으면 로그인 폼으로 이동
		return false;
		}
	return true;
	
	}

}