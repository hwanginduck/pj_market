package pjmarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.OptionsDaoImpl;

@Service
public class OptionsServiceImpl implements OptionsService{
	
	@Autowired
	private OptionsDaoImpl odao;
	
	@Override
	public int insertOptions(String options_name, int options_price, int options_sale) {
		System.out.println("insert options service");
		return odao.insertOptions(options_name, options_price, options_sale);
	}

}
