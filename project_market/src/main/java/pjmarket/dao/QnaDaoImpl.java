package pjmarket.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pjmarket.model.Product;
import pjmarket.model.QnaBoard;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	private SqlSessionTemplate session;

	// 게시판에저장
	@Override
	public int QnaInsert(QnaBoard qnaboard) {
		if (qnaboard.getMember_id().equals("admin")) {
			int admin_result = session.insert("qnans.qna_admininsert", qnaboard);
			return admin_result;
		} else {
			int user_result = session.insert("qnans.qna_userinsert", qnaboard);
			return user_result;
		}
	}

	// 게시글 수 조회
	@Override
	public int getListCount(int product_num) {
		return session.selectOne("qnans.qna_count",product_num);
	}

	// 게시글리스트조회
	@Override
	public List<QnaBoard> getBoardList(int product_num, int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_num", product_num);
		map.put("page", page);

		List<QnaBoard> list = session.selectList("qnans.qna_list", map);
		return list;
	}

	// 수정폼을위한 1개의 객체정보 조회
	@Override
	public QnaBoard getMember(int qna_no) {
		return session.selectOne("qnans.qna_select", qna_no);
	}

	// 수정 후 1개의 객체정보 업데이트
	@Override
	public int UpdateQna(QnaBoard qnaboard) {
		int result = session.update("qnans.qna_update", qnaboard);
		return result;
	}

	// QNA삭제
	@Override
	public int DeleteQna(QnaBoard qnaboard) {
		int result = -1;
		int qna_re = qnaboard.getQna_re();
		int qna_group = qnaboard.getQna_group();
		
		if (qna_re == 0) { // 사용자일경우
			result = session.delete("qnans.qna_userdelete", qna_group);
		} else { // 관리자일경우
			result = session.delete("qnans.qna_admindelete", qna_group);
		}
		return result;
	}
	
	// product_detail 페이지에서 로드된 qna_boardlist에서 작동하는메소드
	@Override 
	public Product getProduct(int product_num) {
		return session.selectOne("qnans.product_select", product_num );
	}

}
