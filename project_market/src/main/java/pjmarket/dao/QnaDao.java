package pjmarket.dao;

import java.util.List;

import pjmarket.model.Product;
import pjmarket.model.QnaBoard;

public interface QnaDao {
	
	public int QnaInsert(QnaBoard qnaboard) throws Exception;
	
	public int getListCount(int product_num);
	
	public List<QnaBoard> getBoardList(int product_num, int page);
	
	public QnaBoard getMember(int qna_no);
	
	public int UpdateQna(QnaBoard qnaboard);
	
	public int DeleteQna(QnaBoard qnaboard);
	
	public Product getProduct(int product_num);
	
	public QnaBoard TestController();
}
