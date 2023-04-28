package hplan.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import hplan.dto.CartDTO;
import sqlmap.MybatisManager;

public class CartDAO {
	
	public void insertCart(CartDTO dto) {
		SqlSession session =null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("cart.insertCart", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public List<CartDTO> listCart(String user_id) {
		List<CartDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("cart.listCart",user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}

	public int sumMoney(String user_id) {
		int sumMoney = 0;
		SqlSession session = null;
		try {
			session=MybatisManager.getInstance().openSession();
			sumMoney = session.selectOne("cart.sumMoney", user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return sumMoney;
	}

	public void modifyCart(CartDTO dto) {
		SqlSession session = null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("cart.modifyCart", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

	public void delete(int cart_id) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("cart.delete", cart_id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}

}
