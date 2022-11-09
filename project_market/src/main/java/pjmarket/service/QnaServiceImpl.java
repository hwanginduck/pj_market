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
	public int getListCount(int product_num) {
		return qnadao.getListCount(product_num);
	}

	@Override
	public List<QnaBoard> getBoardList(int product_num, int page) {
		return qnadao.getBoardList(product_num,page);
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
	public int QnaDelete(QnaBoard qnaboard) {
		return qnadao.DeleteQna(qnaboard);
	}

}
