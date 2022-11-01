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
	//게시글 수 조회
	@Override
	public int getListCount() {
		return session.selectOne("qnans.qna_count");
	}
	//게시글리스트조회
	@Override
	public List<QnaBoard> getBoardList(int page) {
		List<QnaBoard> list = session.selectList("qnans.qna_list", page);
		return list ;
	}
	//수정폼을위한 1개의 객체정보 조회
	@Override
	public QnaBoard getMember(int qna_no) {
		QnaBoard qboard = session.selectOne("qnans.qna_select", qna_no);
		return qboard;
	}
	//수정 후 1개의 객체정보 업데이트
	@Override
	public int UpdateQna(QnaBoard qnaboard) {
		int result = session.update("qnans.qna_update", qnaboard);
		return result;
	}
	// QNA삭제
	@Override
	public int DeleteQna(int qna_re, int qna_group) {
		int result = -1;
		if (qna_re == 0) { // 사용자일경우
			result = session.delete("qnans.qna_userdelete", qna_group);
		} else {			// 관리자일경우
			result = session.delete("qnans.qna_admindelete", qna_group);
		}
		return result;
	}
	
}