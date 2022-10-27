package pjmarket.service;

import java.util.List;

import pjmarket.model.QnaBoard;

public interface QnaService {

	public int QnaInsert(QnaBoard qnaboard);

	public int getListCount();

	public List<QnaBoard> getBoardList(int page);

}
