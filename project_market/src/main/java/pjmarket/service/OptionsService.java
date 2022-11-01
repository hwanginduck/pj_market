package pjmarket.service;

import java.util.List;

import pjmarket.model.Options;

public interface OptionsService {

	int insertOptions(String options_name, int options_price, int options_sale);
	
	List<Options> getOptionList(int product_num);
}
