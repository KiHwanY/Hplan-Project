package hplan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import hplan.dto.ReviewDTO;
import sqlmap.MybatisManager;

public class ReviewDAO {

	public void commentAdd(ReviewDTO dto) {
	
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("review.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

		
	}

	public List<ReviewDTO> commentList(int product_id) {
		List<ReviewDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("review.commentList", product_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
		return list;
	}
}