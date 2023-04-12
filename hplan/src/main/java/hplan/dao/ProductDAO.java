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

	public void product_insert(ProductDTO dto) {
		SqlSession session = null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("product.product_insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public ProductDTO product_view(String manager_id) {
		ProductDTO dto = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("product.product_view", manager_id);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
