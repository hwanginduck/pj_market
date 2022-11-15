package pjmarket.service;


import java.util.List;
import pjmarket.model.Product;

public interface ProductService {

  int insertProduct(Product product) throws Exception;

  int getListCount(String product_l) throws Exception;

  List<Product> getProductlist(int page, String product_l) throws Exception;

  Product getProductDetail(int product_num) throws Exception;

  List<Product> searchProduct(String product_name) throws Exception;

  int searchCount(String product_name) throws Exception;

  Integer selectProductStar(int product_num) throws Exception;

  Integer selectProductStarCount(int product_num) throws Exception;

  int updateProduct(Product product) throws Exception;

  List<Product> getProductlist() throws Exception;

}
