package pjmarket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pjmarket.dao.QnaDao;
import pjmarket.dao.QnaDaoImpl;
import pjmarket.model.QnaBoard;

@Service
public class QnaService {

	@Autowired 
	private QnaDaoImpl qnadao;
	
	//게시판 저장
	public int QnaInsert(QnaBoard qnaboard) {
		return qnadao.QnaInsert(qnaboard);
	}

}
