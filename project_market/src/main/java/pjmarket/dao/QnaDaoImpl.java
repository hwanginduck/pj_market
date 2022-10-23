package pjmarket.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.QnaBoard;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSessionTemplate session;

	//게시판에저장
	public void QnaInsert(QnaBoard qnaboard) {
		System.out.println("QnaDao:" + qnaboard);
		System.out.println("--------------------@Repository--------------------");
		System.out.println(qnaboard.getMember_id());
		System.out.println(qnaboard.getProduct_num());
		System.out.println(qnaboard.getQna_re());
		System.out.println(qnaboard.getQna_content());
		System.out.println("--------------------------------------------------");
		session.insert("qnans.qna_insert", qnaboard); 
	}
}
