package pjmarket.service;


import java.util.List;

import pjmarket.model.Product;

public interface ProductService {

	int insertProduct(Product product) throws Exception;
	
	int getListCount(String product_l) throws Exception;
	
	List<Product> getProductlist(int page, String product_l) throws Exception;
	
	Product getProductDetail(int product_num);
}
