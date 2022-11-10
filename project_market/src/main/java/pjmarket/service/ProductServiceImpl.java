package pjmarket.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pjmarket.dao.ProductDaoImpl;
import pjmarket.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

  @Autowired
  private ProductDaoImpl productdao;

  @Override
  public int insertProduct(Product product) throws Exception {
    System.out.println("insertProduct Service 진입");

    int result = productdao.insertProduct(product);

    return result;
  }

  @Override
  public int getListCount(String product_l) throws Exception {
    System.out.println("카테고리 상품 갯수 검색 service 진입");
    System.out.println("service product_l 확인 : " + product_l);

    return productdao.getProductCount(product_l);

  }

  @Override
  public List<Product> getProductlist(int page, String product_l) throws Exception {

    return productdao.getProductlist(page, product_l);

  }

  @Override
  public Product getProductDetail(int product_num) throws Exception {
    System.out.println("product detail service start");
    return productdao.getProductDetail(product_num);
  }

  @Override
  public List<Product> searchProduct(String product_name) throws Exception {
    System.out.println("search product service start");
    return productdao.searchProduct(product_name);
  }

  @Override
  public int searchCount(String product_name) throws Exception {
    System.out.println("search count service start");
    return productdao.searchCount(product_name);
  }

}
