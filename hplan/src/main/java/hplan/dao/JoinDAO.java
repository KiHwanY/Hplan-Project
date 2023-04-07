package hplan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.DB;
import hplan.dto.MemberDTO;
import sqlmap.MybatisManager;


public class JoinDAO {


	public int joinInsert(MemberDTO dto) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DB.getConn();
			String sql = "insert into member values (member_seq.nextval,?,?,?,?,?,?,?,?, sysdate,sysdate)";
					 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getUser_id());
			pstmt.setString(2,dto.getUser_pwd());
			pstmt.setString(3,dto.getUser_name());
			pstmt.setString(4,dto.getUser_email());
			pstmt.setString(5,dto.getZip_code());
			pstmt.setString(6,dto.getAddress1());
			pstmt.setString(7,dto.getAddress2());
			pstmt.setString(8,dto.getPhone());
			
			System.out.println("회원가입 성공");
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		}finally {
			try {
				/* if(rs != null) rs.close(); */
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
		
		
	}
	public int joinIdCheck(String user_id) {
	
		
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn =DB.getConn();
			String sql ="select user_id from member where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result =0;
				
			}else {
				result = 1;
		
			}
			System.out.println("아이디 중복체크 결과 : " + result);
			
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
	
	public String loginCheck(String user_id, String user_pwd) {
		String name = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		try {
			conn = DB.getConn();
			String sql = "select user_name from member\r\n"
					+ "where user_id =? and user_pwd=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id); // 1번 물음표
			pstmt.setString(2, user_pwd); // 2번 물음표
			rs = pstmt.executeQuery();
			if(rs.next()) { // 레코드가 존재하면(로그인 성공)
				name = rs.getString("user_name"); //이름 저장
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
		return name;
		
	}
	//my page 목록 리턴
	public MemberDTO view(String user_id) {
		MemberDTO dto = null;
		SqlSession session = null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto = session.selectOne("member.view", user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}
	//my page 수정
	public void memberUpdate(MemberDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("member.mypageUpdate", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
		
	}
	public MemberDTO passwordView(String user_id) {
		
		MemberDTO dto = null;
		SqlSession session = null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto = session.selectOne("member.pwdCheck", user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	
	}
	public void pwdUpdate(MemberDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("member.pwdUpdate", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}
}

