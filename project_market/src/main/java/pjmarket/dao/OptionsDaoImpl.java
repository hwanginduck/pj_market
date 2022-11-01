package pjmarket.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OptionsDaoImpl implements OptionsDao{

	@Autowired
	private SqlSession sqlsession;

	@Override
	public int insertOptions(String options_name, int options_price, int options_sale) {
		
		System.out.println("insert options dao");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("options_name", options_name);
		map.put("options_price", options_price);
		map.put("options_sale", options_sale);
		
		int result = sqlsession.insert("optionsns.insert_options", map);
		
		System.out.println("insert options dao result 확인 : " +result);
		
		return result;
	}
	
}
