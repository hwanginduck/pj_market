package pjmarket.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pjmarket.model.Options;

@Repository
public class OptionsDaoImpl implements OptionsDao {

  @Autowired
  private SqlSession sqlSession;

  @Override
  public int insertOptions(String options_name, int options_price, int options_sale,
      int product_num) {

    System.out.println("insert options dao");

    HashMap<String, Object> map = new HashMap<String, Object>();

    map.put("options_name", options_name);
    map.put("options_price", options_price);
    map.put("options_sale", options_sale);
    map.put("product_num", product_num);

    int result = sqlSession.insert("optionsns.insert_options", map);

    System.out.println("insert options dao result 확인 : " + result);

    return result;
  }

  @Override
  public List<Options> getOptionList(int product_num) {
    System.out.println("options list dao");
    List<Options> list = sqlSession.selectList("optionsns.options_list", product_num);
    return list;
  }

  @Override
  public int countOpions(int product_num) {
    return sqlSession.selectOne("optionsns.options_count", product_num);
  }

  @Override
  public int updateOptions(int options_num, String options_name, int options_price,
      int options_sale, int product_num) {
    System.out.println("update options dao");

    HashMap<String, Object> map = new HashMap<String, Object>();

    map.put("options_num", options_num);
    map.put("options_name", options_name);
    map.put("options_price", options_price);
    map.put("options_sale", options_sale);
    map.put("product_num", product_num);

    int result = sqlSession.update("optionsns.update_options", map);

    return result;
  }

}
