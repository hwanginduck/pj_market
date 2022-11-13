package pjmarket.dao;

import java.util.List;
import pjmarket.model.Product;

public interface ProductDao {

  int insertProduct(Product product) throws Exception;

  int getProductCount(String product_l) throws Exception;

  List<Product> getProductlist(int page, String product_l) throws Exception;

  Product getProductDetail(int product_num) throws Exception;

  List<Product> searchProduct(String product_name) throws Exception;

  int searchCount(String product_name) throws Exception;
}
