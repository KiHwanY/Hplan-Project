package hplan.controller;

import java.io.IOException;
import java.net.URLEncoder;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import hplan.dao.JoinDAO;
import hplan.dto.MemberDTO;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();

		JoinDAO dao = new JoinDAO();

		if (url.indexOf("join.do") != -1) {

			try {
				MemberDTO dto = new MemberDTO();

				String user_id = request.getParameter("user_id");
				String user_pwd = request.getParameter("user_pwd");
				String user_name = request.getParameter("user_name");
				String user_email = request.getParameter("user_email");
				String zip_code = request.getParameter("zip_code");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String phone = request.getParameter("phone");
				
				dto.setUser_id(user_id);
				dto.setUser_pwd(user_pwd);
				dto.setUser_name(user_name);
				dto.setUser_email(user_email);
				dto.setZip_code(zip_code);
				dto.setAddress1(address1);
				dto.setAddress2(address2);
				dto.setPhone(phone);
				
					
			dao.joinInsert(dto);
				 	
				 	
		
			String page = "/member/joinAction.jsp";
					
			response.sendRedirect(contextPath+page);
				

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(url.indexOf("loginCheck.do") != -1) {
			
			String user_id = request.getParameter("user_id");
			String user_pwd = request.getParameter("user_pwd");
			
			System.out.println("유저 아이디 : "+ user_id);
			System.out.println("유저 비밀번호 : " + user_pwd);
			
			
			String name = dao.loginCheck(user_id,user_pwd);
			String message = "";
			String page = "";
			
			if(name == null) { //로그인 실패
				message= "아이디 또는 비밀번호가 일치하지 않습니다.";
				message = URLEncoder.encode(message,"utf-8");
				page = "/member/login.jsp?message="+ message;
				
			}else { // 로그인 성공
				
				HttpSession session = request.getSession(); //서블릿에서는 세션 객체 생성을 해야한다.
				session.setAttribute("user_id", user_id); //세션에 저장
				page = "/hplan/index.jsp";
			}
			
			System.out.println(message);
			
			response.sendRedirect(request.getContextPath()+page); //세션이 다르기 때문에 getContextPath를 써야한다.
			
			
		}else if(url.indexOf("logout.do") != -1) {
			
			HttpSession session = request.getSession();
			
			session.removeAttribute("user_id");
			String page = "/hplan/index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("mylist.do") != -1) {
			
			String user_id = request.getParameter("user_id");
			
			
			MemberDTO dto = dao.view(user_id);
			
			request.setAttribute("dto", dto);
			String page ="/member/mylist.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
			
		}else if(url.indexOf("update.do") != -1) {
			
			
			String user_id = request.getParameter("user_id");
			String user_pwd = request.getParameter("user_pwd");
			String user_name = request.getParameter("user_name");
			String user_email = request.getParameter("user_email");
			String zip_code = request.getParameter("zip_code");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String phone = request.getParameter("phone");
			
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUser_id(user_id);
			dto.setUser_pwd(user_pwd);
			dto.setUser_name(user_name);
			dto.setUser_email(user_email);
			dto.setZip_code(zip_code);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dto.setPhone(phone);
			
			dao.memberUpdate(dto);
			
			String page = "/hplan/index.jsp";
			response.sendRedirect(contextPath+page);

			
		}else if(url.indexOf("pwdUpdateform.do") != -1) {
			String user_id = request.getParameter("user_id");
			
			System.out.println("유저 아이디 : " + user_id);
			
			MemberDTO dto = dao.passwordView(user_id);
			 
			request.setAttribute("dto", dto);
			
			String page = "/member/pwdUpdate.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("pwdupdateresult.do") != -1) {
			String user_id = request.getParameter("user_id");
			
			String repw = request.getParameter("repw");
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUser_id(user_id);
			dto.setUser_pwd(repw);
			
			dao.pwdUpdate(dto);
			System.out.println("비밀변호 변경 : " + repw);
			
			String page = "/hplan/index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("memberDeleteform.do") != -1) {
			String user_id = request.getParameter("user_id");
			
			System.out.println("회원 아이디 : "+ user_id);
			
			MemberDTO dto = dao.view(user_id);
			
			request.setAttribute("dto", dto);
			
			String page ="/member/userDeleteForm.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("pass_check.do") != -1) {
			String user_id = request.getParameter("user_id");
			String user_pwd = request.getParameter("user_pwd");
			
			System.out.println("회원 아이디 : " + user_id);
			System.out.println("회원 비밀번호 : " +user_pwd);
			String result = dao.passWordCheck(user_id,user_pwd);
			
			String page = "";
			
			if(result != null) {
				page = "/member/deleteAction.jsp";
				dao.userDelete(user_id);
				
				HttpSession session = request.getSession();
				session.removeAttribute("user_id");
				response.sendRedirect(contextPath+page);
				System.out.println("회원 정보 삭제 : " + user_id);
				
			}else {
				page = contextPath+"/member_servlet/memberDeleteform.do?user_id="+user_id+"&message=error";
				response.sendRedirect(page);
			}
			
			
			
		}
	

	
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
