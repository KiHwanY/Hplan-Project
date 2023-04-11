package hplan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import hplan.dto.ProductDTO;
import sqlmap.MybatisManager;

public class ProductDAO {

	public List<ProductDTO> list() {
		List<ProductDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("product.list");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
			
		}
				
		
		
		return list;
	}

}
