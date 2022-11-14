package pjmarket.service;

import java.util.List;
import pjmarket.model.Options;

public interface OptionsService {

  int insertOptions(String options_name, int options_price, int options_sale, int product_num);

  List<Options> getOptionList(int product_num);

  int countOpions(int product_num);

  int updateOptions(int options_num, String options_name, int options_price, int options_sale,
      int product_num);
}
