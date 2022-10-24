package pjmarket.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.QnaBoard;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSessionTemplate session;

	//게시판에저장
	@Override
	public int QnaInsert(QnaBoard qnaboard) {
		return session.insert("qnans.qna_insert", qnaboard); 
	}
	@Override
	public int getListCount() {
		return session.selectOne("qnans.qna_count");
	}
	public List<QnaBoard> getBoardList(int page) {
		List<QnaBoard> list = session.selectList("qnans.qna_list", page);
		return list ;
	}

}
