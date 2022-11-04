package pjmarket.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pjmarket.model.Options;
import pjmarket.model.Product;
import pjmarket.service.OptionsServiceImpl;
import pjmarket.service.ProductServiceImpl;

@Controller
public class ProductController {

	@Autowired
	private ProductServiceImpl ps;
	
	@Autowired
	private OptionsServiceImpl os;
	
	//상품등록 폼이동
	@RequestMapping("insertproductform.do")
	public String insertProductForm() {
		return "main/product_insert";
	}
	
	
	// 상품등록
	@RequestMapping("insert_product.do")
	public String insertProduct(@RequestParam("product_img1") MultipartFile mf, Product product, HttpServletRequest request, Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 
		
		
		String path = request.getRealPath("/resources/upload/");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;

		String file[] = new String[2];

		String newfilename = "";

		if(filename != ""){	 // 첨부파일이 전송된 경우	

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);		

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();		// 파일명		Koala
			file[1] = st.nextToken();		// 확장자	    jpg

				if(size > 200000){				// 100KB
					result=2;
					model.addAttribute("result", result);

					return "main/uploadResult";

				}else if(!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png") ){

					result=3;
					model.addAttribute("result", result);

					return "main/uploadResult";
				}
				
			}
			if (size > 0) { // 첨부파일이 전송된 경우

				mf.transferTo(new File(path + "/" + newfilename));

			}
			
			product.setProduct_img(newfilename);

			result = ps.insertProduct(product);
			
			if(result == 1) {
				System.out.println("상품등록 완료");
			}else {
				System.out.println("상품등록 실패");
			}
			
			int i = 1;
			
			while(request.getParameter("options_name"+i) != null) {
				
				String options_name = (String)request.getParameter("options_name"+i);
				int options_price = Integer.parseInt(request.getParameter("options_price"+i));
				int options_sale = Integer.parseInt(request.getParameter("options_sale"+i));
				
					System.out.println(i+"번째 옵션 등록 시작");
				
				result = os.insertOptions(options_name, options_price, options_sale);
				
				if(result == 1) {
					System.out.println(i+"번째 옵션 등록 완료");
				}else {
					System.out.println(i+"번째 옵션 등록 실패");
				}
				
				i++;
			}
			
			model.addAttribute("result", result);
			
			return "main/uploadResult";
		}
		
	// 카테고리별 품목 리스트 출력
	@RequestMapping("productlist.do")
	public String list(@RequestParam("product_l") String product_l, HttpServletRequest request, Model model) throws Exception {	
		System.out.println("카테고리별 상품 검색 controller");
		
		List<Product> productlist = new ArrayList<Product>();

		int page = 1;
		int limit = 16; // 한 화면에 출력할 레코드수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수를 받아옴.
		System.out.println("product_l : " +product_l +"을 가지고 해당 카테고리 상품수 검색 시작 controller");
		int listcount = ps.getListCount(product_l);
		System.out.println("DB에서 받아온 해당 상품 controller 갯수 확인 : " +listcount);

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		productlist = ps.getProductlist(page, product_l); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 16 + 0.9)) - 1) * 16 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 16 - 1)
			endpage = startpage + 16 - 1;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("productlist", productlist);
		
		return "main/product_list";
	}
	
	@RequestMapping("productdetail.do")
	public String getProductDetail(HttpServletRequest request, int product_num, int page, Model model) {

		HttpSession pnum_session = request.getSession();
		pnum_session.setAttribute("pnum", product_num);
		
		Product product = ps.getProductDetail(product_num);
		List<Options> optionslist = new ArrayList<Options>(); 
		optionslist = os.getOptionList(product_num);

		model.addAttribute("product", product);
		model.addAttribute("optionslist", optionslist);
		model.addAttribute("page", page);

		return "main/product_detail";
	}

	
}
