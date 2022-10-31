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
		if(qnaboard.getMember_id().equals("admin")) {
			int admin_result = session.insert("qnans.qna_admininsert", qnaboard);
			return admin_result;
		}
		else {
			int user_result = session.insert("qnans.qna_userinsert", qnaboard);
			return user_result;
		}
	}
	
	@Override
	public int getListCount() {
		return session.selectOne("qnans.qna_count");
	}
	
	@Override
	public List<QnaBoard> getBoardList(int page) {
		List<QnaBoard> list = session.selectList("qnans.qna_list", page);
		return list ;
	}

	@Override
	public QnaBoard getMember(int qna_no) {
		QnaBoard qboard = session.selectOne("qnans.qna_select", qna_no);
		return qboard;
	}
	
}
