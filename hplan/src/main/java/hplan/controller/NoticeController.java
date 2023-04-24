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

import hplan.dao.NoticeDAO;
import hplan.dto.NoticeDTO;
import hplan.pager.Pager;


@WebServlet("/notice_servlet/*")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		String contextPath = request.getContextPath();
		NoticeDAO dao = new NoticeDAO();
		
		if(url.indexOf("noticeList.do") != -1) {
			
			int count = dao.conut();

			int curPage=1;
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			
			List<NoticeDTO> list = dao.noticeList(start,end);
			
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			String page ="/community/communityForm.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("search.do") != -1) {
			String search_option = request.getParameter("search_option");
			String keyword = request.getParameter("keyword");
			
			List<NoticeDTO> list = dao.searchList(search_option,keyword);
			
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			
			String page ="/community/noticeSearch.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("view.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			HttpSession session = request.getSession();
			
			dao.plusReadCount(num,session);
			
			NoticeDTO dto = dao.view(num);
			request.setAttribute("dto", dto);
			String page="/community/noticeView.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insert.do") != -1) {
			
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			NoticeDTO dto = new NoticeDTO();
			
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			
			dao.insert(dto);
			
			String page ="/notice_servlet/noticeList.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("noticeUpdateForm.do") != -1) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			request.setAttribute("dto", dao.view(num));
			String page ="/community/noticeUpdateForm.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("btnUpdate.do") != -1) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			
			NoticeDTO dto = new NoticeDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			
			dao.update(dto);
			
			String page ="/notice_servlet/noticeList.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("noticeDelete.do") != -1){
			int num = Integer.parseInt(request.getParameter("num"));
			
			dao.delete(num);
			
			String page ="/notice_servlet/noticeList.do";
			response.sendRedirect(contextPath+page);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
