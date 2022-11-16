package pjmarket.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pjmarket.dao.OptionsDaoImpl;
import pjmarket.model.Options;

@Service
public class OptionsServiceImpl implements OptionsService {

  @Autowired
  private OptionsDaoImpl odao;

  @Override
  public int insertOptions(String options_name, int options_price, int options_sale,
      int product_num) {
    System.out.println("insert options service");
    return odao.insertOptions(options_name, options_price, options_sale, product_num);
  }

  @Override
  public List<Options> getOptionList(int product_num) {
    System.out.println("options list service");
    return odao.getOptionList(product_num);
  }

  @Override
  public int countOpions(int product_num) {
    return odao.countOpions(product_num);
  }

  @Override
  public int updateOptions(int options_num, String options_name, int options_price,
      int options_sale, int product_num) {
    System.out.println("options update service");
    return odao.updateOptions(options_num, options_name, options_price, options_sale, product_num);
  }

}
