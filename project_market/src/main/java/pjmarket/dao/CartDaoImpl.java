package pjmarket.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pjmarket.model.Cart;
import pjmarket.model.CartList;
import pjmarket.model.Likes;

@Repository
public class CartDaoImpl implements CartDao {

  @Autowired
  private SqlSession sqlSession;

  @Override
  public List<CartList> getListCart(String member_id) throws Exception {
    System.out.println("get List Cart Dao");
    List<CartList> list = sqlSession.selectList("cartns.cart_list", member_id);
    return list;
  }

  @Override
  public int insertCart(int likes_num) throws Exception {
    System.out.println("insertCart dao 진입");
    System.out.println("dao에 넘어오는 likes_num 확인1 " + likes_num);

    Likes likes = new Likes();

    likes = sqlSession.selectOne("cartns.selectlikecheck", likes_num);

    Cart cart = new Cart();

    cart = sqlSession.selectOne("cartns.selectcartcheck", likes);

    int result = 0;

    if (cart == null) {
      result = sqlSession.insert("cartns.cart_insert", likes);
    } else {
      result = sqlSession.update("cartns.cart_update", cart);
    }

    System.out.println("result 확인 " + result);

    return result;
  }

  @Override
  public int insertCart(Cart cart) throws Exception {
    System.out.println("insert Cart dao");

    int result = sqlSession.insert("cartns.insertcart", cart);
    return result;
  }


  @Override
  public int deleteCart(int cart_num) throws Exception {
    System.out.println("deleteCart dao 진입");

    int result = sqlSession.delete("cartns.cart_delete", cart_num);

    System.out.println("result 값 출력 : " + result);

    return result;
  }
}
