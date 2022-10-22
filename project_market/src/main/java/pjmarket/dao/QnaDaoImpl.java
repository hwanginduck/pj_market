package pjmarket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pjmarket.model.QnaBoard;

@Repository
public class QnaDaoImpl implements QnaDao {
	private SqlSession session;

	//게시판에저장
	public void QnaInsert(QnaBoard qnaboard) {
		session.insert("qna.qna_insert", qnaboard); 
		// qna.xml 파일의 id가 "qna_insert" 를 실행해라, qnaboard 객체를 전달해서
		// qnaboard insert문이 실행되기 위한값
		// [qnano]시퀀스 / [member_id]다른테이블 / [product_num]다른테이블 / [qna_re]/[qna_content]/[qna_date]
		// qnaboard에서 전달받은값
		//[member_id][product_num][qna_re][qna_content]
		
	}
}
