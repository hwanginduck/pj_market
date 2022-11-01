package pjmarket.service;

import java.util.List;

import org.springframework.ui.Model;

import pjmarket.model.QnaBoard;

public interface QnaService {

	public int QnaInsert(QnaBoard qnaboard);

	public int getListCount();

	public List<QnaBoard> getBoardList(int page);
	
	public QnaBoard QnaUpdate(int qna_no);
	
}
