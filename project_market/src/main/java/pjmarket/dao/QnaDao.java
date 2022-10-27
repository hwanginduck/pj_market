package pjmarket.dao;

import java.util.List;

import pjmarket.model.QnaBoard;

public interface QnaDao {
	
	public int QnaInsert(QnaBoard qnaboard) throws Exception;
	
	public int getListCount();
	
	public List<QnaBoard> getBoardList(int page);

}
