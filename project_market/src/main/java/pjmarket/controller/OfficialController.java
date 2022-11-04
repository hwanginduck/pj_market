package pjmarket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pjmarket.model.OfficialBoard;
import pjmarket.service.OfficialServiceImpl;

@Controller
public class OfficialController {

	@Autowired
	private OfficialServiceImpl os;

	// 공지사항 작성 폼
	@RequestMapping(value = "off_writeform.do")
	public String off_writeform() {
		return "Official/off_writeform";
	}

	// 공지사항 작성
	@RequestMapping("off_write.do")
	public String off_write(OfficialBoard off, Model model) {

		int result = os.insert(off);
		if (result == 1)
			System.out.println("글작성 성공");

		model.addAttribute("result", result);

		return "Official/insertresult";
	}

	// 공지사항 목록
	@RequestMapping("off_list.do")
	public String off_list(HttpServletRequest request, Model model) {

		int page = 1; // 현재 페이지 번호
		int limit = 10; // 한 화면에 출력할 데이터 갯수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		int listcount = os.getCount(); // 총 데이터 갯수
		System.out.println("listcount:" + listcount);

		List<OfficialBoard> off_list = os.getoff_list(page);
		System.out.println("off_list:" + off_list);

		// 총페이지
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("off_list", off_list);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "Official/off_list";
	}

	// 공지사항 내용
	@RequestMapping("off_content.do")
	public String off_cont(int num, String page, Model model) {
		os.updatecount(num); // 조회수 1증가
		
		OfficialBoard off = os.off_cont(num); // 상세 정보 구하기
		
		String content = off.getOff_content().replace("\n", "<br>");

		model.addAttribute("board", off);
		model.addAttribute("content", content);
		model.addAttribute("page", page);

		return "Official/off_content";

	}

	// 공지사항 수정 폼
	@RequestMapping("off_updateform.do")
	public String off_updateform(int num, String page, Model model) {

		OfficialBoard off = os.off_cont(num); // 상세 정보 구하기

		model.addAttribute("board", off);
		model.addAttribute("page", page);

		return "Official/off_updateform";
	}

	// 공지사항 수정
	@RequestMapping("off_update.do")
	public String off_updateform(OfficialBoard off, String page, Model model) {
		int result = 0;

		OfficialBoard old = os.off_cont(off.getOff_num());

		// 비밀번호 비교문
		if (old.getOff_pw().equals(off.getOff_pw())) { // 비밀번호 일치
			result = os.off_updatecont(off); // 글수정
		} else { // 비밀번호 불일치
			result = -1;
		}

		model.addAttribute("result", result);
		model.addAttribute("board", off);
		model.addAttribute("page", page);

		return "Official/off_updateresult";
	}

	// 공지사항 삭제 폼
	@RequestMapping("off_deleteform.do")
	public String boarddeleteform() {
		return "Official/off_deleteform";
	}

	// 공지사항 삭제
	@RequestMapping("off_delete.do")
	public String off_delete(OfficialBoard off, String page, Model model) {
		int result = 0;
		
		OfficialBoard old = os.off_cont(off.getOff_num()); // 상세정보구하기

		// 비밀번호 비교문
		if (old.getOff_pw().equals(off.getOff_pw())) {
			result = os.off_delete(off.getOff_num()); // 글삭제
		} else {
			result = -1;
		}
		model.addAttribute("result", result);
		model.addAttribute("page", page);

		return "board/deleteresult";
	}
}
