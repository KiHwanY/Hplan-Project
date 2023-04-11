package hplan.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hplan.dao.AdminDAO;


@WebServlet("/admin_servlet/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		AdminDAO dao = new AdminDAO();
		
		if(url.indexOf("loginCheck.do") != -1) {
			
			String manager_id = request.getParameter("manager_id");
			String manager_pwd = request.getParameter("manager_pwd");
			
			String result = dao.adminCheck(manager_id, manager_pwd);
			
			String message = "";
			String page = "";
			
			if(result == null) { //로그인 실패
				message= "아이디 또는 비밀번호가 일치하지 않습니다.";
				message = URLEncoder.encode(message,"utf-8");
				page = "/admin/adminLogin.jsp?message="+ message;
				
			}else { // 로그인 성공
				
				HttpSession session = request.getSession(); //서블릿에서는 세션 객체 생성을 해야한다.
				session.setAttribute("manager_id", manager_id); //세션에 저장
				page = "/hplan/index.jsp";
			}
			
			System.out.println(message);
			
			response.sendRedirect(request.getContextPath()+page);
			
		}
		
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		doGet(request, response);
	}

}
