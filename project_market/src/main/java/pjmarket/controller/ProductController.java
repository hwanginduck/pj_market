package pjmarket.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
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
import pjmarket.service.QnaServiceImpl;

@Controller
public class ProductController {

  @Autowired
  private ProductServiceImpl ps;

  @Autowired
  private OptionsServiceImpl os;

  @Autowired
  private QnaServiceImpl qs;

  // 상품등록 폼이동
  @RequestMapping("insertproductform.do")
  public String insertProductForm() {
    return "main/product_insert";
  }

  // 상품등록
  @RequestMapping("insert_product.do")
  public String insertProduct(@RequestParam("product_img1") List<MultipartFile> mtlist,
      @RequestParam("product_content1") List<MultipartFile> mtlist2, Product product,
      HttpServletRequest request, Model model) throws Exception {

    String path = request.getRealPath("/resources/upload/");

    String imgsave_name = "";

    for (int i = 0; i < mtlist.size(); i++) {

      String filename = mtlist.get(i).getOriginalFilename();

      int size = (int) mtlist.get(i).getSize(); // 첨부파일의 크기 (단위:Byte)

      System.out.println("filename=" + filename); // filename="Koala.jpg"
      System.out.println("size=" + size);
      System.out.println("Path=" + path);
      int result = 0;

      String file[] = new String[2];

      String newfilename = "";

      if (filename != "") { // 첨부파일이 전송된 경우

        // 파일 중복문제 해결
        String extension = filename.substring(filename.lastIndexOf("."), filename.length());
        System.out.println("extension:" + extension);

        UUID uuid = UUID.randomUUID();

        newfilename = uuid.toString() + extension;
        System.out.println("newfilename:" + newfilename);

        StringTokenizer st = new StringTokenizer(filename, ".");
        file[0] = st.nextToken(); // 파일명 Koala
        file[1] = st.nextToken(); // 확장자 jpg

        if (size > 10000000) { // 100KB
          result = 2;
          model.addAttribute("result", result);

          return "main/uploadResult";

        } else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

          result = 3;
          model.addAttribute("result", result);

          return "main/uploadResult";
        }

      }
      if (size > 0) { // 첨부파일이 전송된 경우

        mtlist.get(i).transferTo(new File(path + "/" + newfilename));

        imgsave_name += "," + newfilename;

      }


    }

    product.setProduct_img(imgsave_name);


    String contentsave_name = "";

    for (int i = 0; i < mtlist2.size(); i++) {

      String filename = mtlist2.get(i).getOriginalFilename();

      int size = (int) mtlist2.get(i).getSize(); // 첨부파일의 크기 (단위:Byte)

      System.out.println("filename=" + filename); // filename="Koala.jpg"
      System.out.println("size=" + size);
      System.out.println("Path=" + path);
      int result = 0;

      String file[] = new String[2];

      String newfilename = "";

      if (filename != "") { // 첨부파일이 전송된 경우

        // 파일 중복문제 해결
        String extension = filename.substring(filename.lastIndexOf("."), filename.length());
        System.out.println("extension:" + extension);

        UUID uuid = UUID.randomUUID();

        newfilename = uuid.toString() + extension;
        System.out.println("newfilename:" + newfilename);

        StringTokenizer st = new StringTokenizer(filename, ".");
        file[0] = st.nextToken(); // 파일명 Koala
        file[1] = st.nextToken(); // 확장자 jpg

        if (size > 10000000) { // 100KB
          result = 2;
          model.addAttribute("result", result);

          return "main/uploadResult";

        } else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

          result = 3;
          model.addAttribute("result", result);

          return "main/uploadResult";
        }

      }
      if (size > 0) { // 첨부파일이 전송된 경우

        mtlist2.get(i).transferTo(new File(path + "/" + newfilename));

        contentsave_name += "," + newfilename;

      }


    }

    product.setProduct_content(contentsave_name);


    // product를 등록하고 num을 반환 받아 옵션 등록 할때 사용
    int result = ps.insertProduct(product);

    int product_num = product.getProduct_num();
    System.out.println("product_num 확인" + product_num);

    int i = 1;

    while (request.getParameter("options_name" + i) != null) {

      String options_name = (String) request.getParameter("options_name" + i);
      int options_price = Integer.parseInt(request.getParameter("options_price" + i));
      int options_sale = Integer.parseInt(request.getParameter("options_sale" + i));

      System.out.println(i + "번째 옵션 등록 시작");

      result = os.insertOptions(options_name, options_price, options_sale, product_num);

      if (result == 1) {
        System.out.println(i + "번째 옵션 등록 완료");
      } else {
        System.out.println(i + "번째 옵션 등록 실패");
      }

      i++;
    }

    model.addAttribute("result", result);

    return "main/uploadResult";
  }

  // 카테고리별 품목 리스트 출력
  @RequestMapping("productlist.do")
  public String list(@RequestParam("product_l") String product_l, HttpServletRequest request,
      Model model) throws Exception {
    System.out.println("카테고리별 상품 검색 controller");

    List<Product> productlist = new ArrayList<Product>();

    int page = 1;
    int limit = 12; // 한 화면에 출력할 레코드수

    if (request.getParameter("page") != null) {
      page = Integer.parseInt(request.getParameter("page"));
    }

    // 총 리스트 수를 받아옴.
    System.out.println("product_l : " + product_l + "을 가지고 해당 카테고리 상품수 검색 시작 controller");
    int listcount = ps.getListCount(product_l);
    System.out.println("DB에서 받아온 해당 상품 controller 갯수 확인 : " + listcount);

    // 페이지 번호(page)를 DAO클래스에게 전달한다.
    productlist = ps.getProductlist(page, product_l); // 리스트를 받아옴.

    // 총 페이지 수.
    int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
                                                             // 처리.
    // 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
    int startpage = (((int) ((double) page / 12 + 0.95)) - 1) * 16 + 1;
    // 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
    int endpage = maxpage;

    if (endpage > startpage + 16 - 1)
      endpage = startpage + 16 - 1;

    model.addAttribute("page", page);
    model.addAttribute("product_l", product_l);
    model.addAttribute("startpage", startpage);
    model.addAttribute("endpage", endpage);
    model.addAttribute("maxpage", maxpage);
    model.addAttribute("listcount", listcount);
    model.addAttribute("productlist", productlist);

    return "main/product_list";
  }

  @RequestMapping("productdetail.do")
  public String getProductDetail(int product_num, int page, Model model) throws Exception {

    // List<QnaBoard> boardlist = new ArrayList<QnaBoard>();
    Product product = ps.getProductDetail(product_num);

    Integer product_star = ps.selectProductStar(product_num);

    Integer product_starcount = ps.selectProductStarCount(product_num);

    // 상품 이미지랑 내용 이미지 파싱하여 분류
    String product_content = product.getProduct_content();
    System.out.println(product_content);

    String[] product_contentArr = product_content.split(",");


    String product_img = product.getProduct_img();
    System.out.println(product_img);

    String[] product_imgArr = product_img.split(",");


    List<Options> optionslist = new ArrayList<Options>();
    optionslist = os.getOptionList(product_num);

    model.addAttribute("product", product);
    model.addAttribute("optionslist", optionslist);
    model.addAttribute("product_contentArr", product_contentArr);
    model.addAttribute("product_imgArr", product_imgArr);
    model.addAttribute("page", page);
    model.addAttribute("product_star", product_star);
    model.addAttribute("product_starcount", product_starcount);


    return "main/product_detail";
  }

  @RequestMapping("searchproductform.do")
  public String searchProductForm() {
    return "main/product_search";
  }

  @RequestMapping("search_product.do")
  public String searchProduct(String product_name, Model model) throws Exception {

    List<Product> searchlist = new ArrayList<Product>();

    searchlist = ps.searchProduct(product_name);
    int count = ps.searchCount(product_name);

    model.addAttribute("searchlist", searchlist);
    model.addAttribute("count", count);

    return "main/product_searchlist";
  }

  @RequestMapping("product_update_form.do")
  public String updateProductForm(int product_num, Model model) throws Exception {

    Product product = ps.getProductDetail(product_num);

    List<Options> optionslist = os.getOptionList(product_num);

    int optionscount = os.countOpions(product_num);

    model.addAttribute("product", product);
    model.addAttribute("optionslist", optionslist);
    model.addAttribute("optionscount", optionscount);

    return "main/product_updateform";
  }

  // 상품 업데이트
  @RequestMapping("update_product.do")
  public String updateProduct(@RequestParam("product_img1") List<MultipartFile> mtlist,
      @RequestParam("product_content1") List<MultipartFile> mtlist2, Product product,
      HttpServletRequest request, Model model) throws Exception {

    String path = request.getRealPath("/resources/upload/");

    String imgsave_name = "";

    for (int i = 0; i < mtlist.size(); i++) {

      String filename = mtlist.get(i).getOriginalFilename();

      int size = (int) mtlist.get(i).getSize(); // 첨부파일의 크기 (단위:Byte)

      System.out.println("filename=" + filename); // filename="Koala.jpg"
      System.out.println("size=" + size);
      System.out.println("Path=" + path);
      int result = 0;

      String file[] = new String[2];

      String newfilename = "";

      if (filename != "") { // 첨부파일이 전송된 경우

        // 파일 중복문제 해결
        String extension = filename.substring(filename.lastIndexOf("."), filename.length());
        System.out.println("extension:" + extension);

        UUID uuid = UUID.randomUUID();

        newfilename = uuid.toString() + extension;
        System.out.println("newfilename:" + newfilename);

        StringTokenizer st = new StringTokenizer(filename, ".");
        file[0] = st.nextToken(); // 파일명 Koala
        file[1] = st.nextToken(); // 확장자 jpg

        if (size > 10000000) { // 100KB
          result = 2;
          model.addAttribute("result", result);

          return "main/uploadResult";

        } else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

          result = 3;
          model.addAttribute("result", result);

          return "main/uploadResult";
        }

      }
      if (size > 0) { // 첨부파일이 전송된 경우

        mtlist.get(i).transferTo(new File(path + "/" + newfilename));

        imgsave_name += "," + newfilename;
        product.setProduct_img(imgsave_name);

      } else {

        product.setProduct_img(product.getProduct_img());


      }

    }

    String contentsave_name = "";

    for (int i = 0; i < mtlist2.size(); i++) {

      String filename = mtlist2.get(i).getOriginalFilename();

      int size = (int) mtlist2.get(i).getSize(); // 첨부파일의 크기 (단위:Byte)

      System.out.println("filename=" + filename); // filename="Koala.jpg"
      System.out.println("size=" + size);
      System.out.println("Path=" + path);
      int result = 0;

      String file[] = new String[2];

      String newfilename = "";

      if (filename != "") { // 첨부파일이 전송된 경우

        // 파일 중복문제 해결
        String extension = filename.substring(filename.lastIndexOf("."), filename.length());
        System.out.println("extension:" + extension);

        UUID uuid = UUID.randomUUID();

        newfilename = uuid.toString() + extension;
        System.out.println("newfilename:" + newfilename);

        StringTokenizer st = new StringTokenizer(filename, ".");
        file[0] = st.nextToken(); // 파일명 Koala
        file[1] = st.nextToken(); // 확장자 jpg

        if (size > 10000000) { // 100KB
          result = 2;
          model.addAttribute("result", result);

          return "main/uploadResult";

        } else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

          result = 3;
          model.addAttribute("result", result);

          return "main/uploadResult";
        }

      }
      if (size > 0) { // 첨부파일이 전송된 경우

        mtlist2.get(i).transferTo(new File(path + "/" + newfilename));

        contentsave_name += "," + newfilename;
        System.out.println("content save name :" + contentsave_name);
        product.setProduct_content(contentsave_name);

      } else {

        product.setProduct_content(product.getProduct_content());

      }
    }

    int result = ps.updateProduct(product);

    int product_num = product.getProduct_num();
    System.out.println("product_num 확인" + product_num);

    List<Options> originOl = os.getOptionList(product_num);

    int originOC = originOl.size();

    System.out.println("origin Options Count :" + originOC);

    List newOptions = new ArrayList<>();

    int i = 0;

    while (request.getParameter("options_name" + i) != null) {

      String options_name = (String) request.getParameter("options_name" + i);
      newOptions.add(options_name);

      i++;
    }

    int newOptionsCount = newOptions.size();

    System.out.println("new options count : " + newOptionsCount);

    if (newOptionsCount > originOC) {
      for (i = 0; i < newOptionsCount; i++) {
        if (i < originOC) {
          int options_num = Integer.parseInt(request.getParameter("options_num" + i));
          String options_name = (String) request.getParameter("options_name" + i);
          int options_price = Integer.parseInt(request.getParameter("options_price" + i));
          int options_sale = Integer.parseInt(request.getParameter("options_sale" + i));

          System.out.println(i + "번째 옵션 업데이트 시작");

          result =
              os.updateOptions(options_num, options_name, options_price, options_sale, product_num);

          if (result == 1) {
            System.out.println(i + "번째 옵션 업데이트 완료");
          } else {
            System.out.println(i + "번째 옵션 업데이트 실패");
          }
        } else if (i >= originOC) {
          String options_name = (String) request.getParameter("options_name" + i);
          int options_price = Integer.parseInt(request.getParameter("options_price" + i));
          int options_sale = Integer.parseInt(request.getParameter("options_sale" + i));

          System.out.println(i + "번째 옵션 등록 시작");

          result = os.insertOptions(options_name, options_price, options_sale, product_num);

          if (result == 1) {
            System.out.println(i + "번째 옵션 등록 완료");
          } else {
            System.out.println(i + "번째 옵션 등록 실패");
          }
        }

      }

    } else if (originOC > newOptionsCount) {
      for (i = 0; i < originOC; i++) {
        if (i < newOptionsCount) {
          int options_num = Integer.parseInt(request.getParameter("options_num" + i));
          String options_name = (String) request.getParameter("options_name" + i);
          int options_price = Integer.parseInt(request.getParameter("options_price" + i));
          int options_sale = Integer.parseInt(request.getParameter("options_sale" + i));

          System.out.println(i + "번째 옵션 업데이트 시작");

          result =
              os.updateOptions(options_num, options_name, options_price, options_sale, product_num);

          if (result == 1) {
            System.out.println(i + "번째 옵션 업데이트 완료");
          } else {
            System.out.println(i + "번째 옵션 업데이트 실패");
          }
        } else {
          String options_name = (String) request.getParameter("options_name" + i);
          int options_price = Integer.parseInt(request.getParameter("options_price" + i));
          int options_sale = Integer.parseInt(request.getParameter("options_sale" + i));

          System.out.println(i + "번째 옵션 등록 시작");

          result = os.insertOptions(options_name, options_price, options_sale, product_num);

          if (result == 1) {
            System.out.println(i + "번째 옵션 등록 완료");
          } else {
            System.out.println(i + "번째 옵션 등록 실패");
          }
        }

      }

    } else if (originOC == newOptionsCount) {
      for (i = 0; i < originOC; i++) {
        if (i <= newOptionsCount) {
          int options_num = Integer.parseInt(request.getParameter("options_num" + i));
          String options_name = (String) request.getParameter("options_name" + i);
          int options_price = Integer.parseInt(request.getParameter("options_price" + i));
          int options_sale = Integer.parseInt(request.getParameter("options_sale" + i));

          System.out.println(i + "번째 옵션 업데이트 시작");

          result =
              os.updateOptions(options_num, options_name, options_price, options_sale, product_num);

          if (result == 1) {
            System.out.println(i + "번째 옵션 업데이트 완료");
          } else {
            System.out.println(i + "번째 옵션 업데이트 실패");
          }
        }

      }
    }

    model.addAttribute("result", result);

    return "main/uploadResult";
  }

}
