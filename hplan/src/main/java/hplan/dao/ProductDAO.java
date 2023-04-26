package hplan.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public ProductDTO product_view(int product_id) {
		ProductDTO dto = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("product.product_view", product_id);
			String content = dto.getP_info();
			content=content.replace("\n", "<br>");
			dto.setP_info(content);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
		return dto;
	}

	public int priceSum(int product_id) {
		int sum = 0;
		
		SqlSession session = null;
		try {
			session= MybatisManager.getInstance().openSession();
			sum = session.selectOne("product.product_priceSum", product_id);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sum;
	}

	public String getFileName(int product_id) {
		String result = "";
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			result = session.selectOne("product.getFileName", product_id);	
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			if(session != null) session.close();
		}
		return result;
	}
	 //상품 수정
	public void productUpdate(ProductDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("product.productUpdate", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public void productDelete(int product_id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("product.delete", product_id); // 상품 진짜 삭제 x
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public List<ProductDTO> searchLIst(String search_option, String keyword) {
		List<ProductDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String, String> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword.toUpperCase()+"%");
			list = session.selectList("product.searchList" , map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


}
