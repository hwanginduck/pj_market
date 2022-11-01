package pjmarket.dao;

import java.util.List;

import pjmarket.model.QnaBoard;

public interface QnaDao {
	
	public int QnaInsert(QnaBoard qnaboard) throws Exception;
	
	public int getListCount();
	
	public List<QnaBoard> getBoardList(int page);
	
	public QnaBoard getMember(int qna_no);
	
	public int UpdateQna(QnaBoard qnaboard);
	
	public int DeleteQna(int qna_re, int qna_group);
}