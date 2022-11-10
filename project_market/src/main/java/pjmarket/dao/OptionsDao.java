package pjmarket.dao;

import java.util.List;
import pjmarket.model.Options;

public interface OptionsDao {

  int insertOptions(String options_name, int options_price, int options_sale, int product_num);

  List<Options> getOptionList(int product_num);
}
