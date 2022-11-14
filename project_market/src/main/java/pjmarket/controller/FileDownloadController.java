package pjmarket.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	// 저장할 파일 위치 지정
	private static String CURR_IMAGE_REPO_PATH = "D:\\Saved Pictures";
	
	@RequestMapping("/download")
	// 다운로드할 이미지 파일이름을 param(전달)
	protected void download(@RequestParam("imageFileName") String imageFileName,
				HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = CURR_IMAGE_REPO_PATH + "\\" + imageFileName;
		
		// 다운로드할 파일 객체 생성하기
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		
		// 헤더에 파일이름 설정
		response.addHeader("Content-disposition", "attachment; fileName = " + imageFileName);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		
		// 버퍼를 이용해 한번에 8Kbyte 씩 브라우저로 전송한다
		while (true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
	}
}
