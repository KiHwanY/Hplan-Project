package hplan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hplan.dao.ProductDAO;
import hplan.dto.ProductDTO;


//메인페이지 상품 리스트 출력 CONTROLLER
@WebServlet("/main_servlet/*")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		ProductDAO dao = new ProductDAO();
		
		if(url.indexOf("outer.do") != -1) {
			
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/hplan/outer.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("top.do") != -1) {
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/hplan/top.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("knit.do") != -1) {
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/hplan/knit.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("bottom.do") != -1) {
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/hplan/bottom.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("shoes.do") != -1) {
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/hplan/shoes.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
