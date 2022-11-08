package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import pjmarket.dao.QnaDao;
import pjmarket.dao.QnaDaoImpl;
import pjmarket.model.QnaBoard;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired 
	private QnaDaoImpl qnadao;
	
	@Override
	public int QnaInsert(QnaBoard qnaboard) {
		return qnadao.QnaInsert(qnaboard);
	}

	@Override
	public int getListCount(int page) {
		return qnadao.getListCount(page);
	}

	@Override
	public List<QnaBoard> getBoardList(int page) {
		return qnadao.getBoardList(page);
	}
	
	@Override
	public QnaBoard QnaUpdate(int qna_no) {
		return qnadao.getMember(qna_no);
	}
	
	@Override
	public int QnaUpdateok(QnaBoard qnaboard) {
		return qnadao.UpdateQna(qnaboard);
	}
	
	@Override
	public int QnaDelete(int qna_re, int qna_group) {
		return qnadao.DeleteQna(qna_re, qna_group);
	}

}
