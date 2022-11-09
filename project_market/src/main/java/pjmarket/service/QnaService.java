package pjmarket.service;

import java.util.List;

import pjmarket.model.QnaBoard;

public interface QnaService {

	public int QnaInsert(QnaBoard qnaboard);

	public int getListCount(int product_num);

	public List<QnaBoard> getBoardList(int product_num, int page);
	
	public QnaBoard QnaUpdate(int qna_no);
	
	public int QnaUpdateok(QnaBoard qnaboard);
	
	public int QnaDelete(QnaBoard qnaboard);
	
}
