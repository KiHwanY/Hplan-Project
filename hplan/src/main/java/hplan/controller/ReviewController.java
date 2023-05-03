package hplan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hplan.dao.ReviewDAO;
import hplan.dto.ReviewDTO;


@WebServlet("/review_servlet/*")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		ReviewDAO dao = new ReviewDAO();
		if(url.indexOf("comment_add.do") != -1) {
			ReviewDTO dto = new ReviewDTO();
			
			int product_id=Integer.parseInt(request.getParameter("product_id"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setProduct_id(product_id);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			
			
		}else if(url.indexOf("commentList.do") != -1) {
			int product_id=Integer.parseInt(request.getParameter("product_id"));
			System.out.println("댓글을 위한 게시물 번호 : " + product_id);
			//댓글 목록 리턴
			List<ReviewDTO> list=dao.commentList(product_id);
			//request 영역에 저장
			request.setAttribute("list", list);
			//출력 페이지로 이동
			String page="/community/review_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("delete.do") != -1) {
			int comment_num = Integer.parseInt(request.getParameter("comment_num"));
			
			System.out.println("댓글 번호 : " + comment_num);
			dao.delete(comment_num);
			
			String page="/review_servlet/commentList.do";
			response.sendRedirect(contextPath+page);
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
