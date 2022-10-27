package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int getListCount() {
		return qnadao.getListCount();
	}

	@Override
	public List<QnaBoard> getBoardList(int page) {
		return qnadao.getBoardList(page);
	}

}
