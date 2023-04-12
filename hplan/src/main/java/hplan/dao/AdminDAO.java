package hplan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.session.SqlSession;

import config.DB;
import hplan.dto.AdminDTO;
import sqlmap.MybatisManager;

public class AdminDAO {


	public String adminCheck(String manager_id, String manager_pwd) {
		String result = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try {
			conn = DB.getConn();
			String sql = "select manager_name from admin\r\n"
					+ "where manager_id =? and manager_pwd=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, manager_id);
			pstmt.setString(2, manager_pwd); 
			rs = pstmt.executeQuery();
			if(rs.next()) { // 레코드가 존재하면(로그인 성공)
				result = rs.getString("manager_name"); //이름 저장
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				
				if(rs != null) rs.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				
				if(pstmt != null) pstmt.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				
				if(conn != null) conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	public AdminDTO idcheck(String manager_id) {
		AdminDTO dto = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			dto = session.selectOne("admin.idcheck", manager_id);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
		
	}


}
