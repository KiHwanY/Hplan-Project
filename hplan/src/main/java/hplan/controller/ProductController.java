package hplan.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import hplan.dao.ProductDAO;
import hplan.dto.ProductDTO;


@WebServlet("/product_servlet/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		ProductDAO dao = new ProductDAO();
		if(url.indexOf("product_insert.do") != -1) {
			File uploadDir = new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) { // 디렉토리가 없으면
				uploadDir.mkdir(); // 디렉토리 생성
			}
			MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH,Constants.MAX_UPLOAD, "utf-8" , new DefaultFileRenamePolicy());
			
		}else if(url.indexOf("product_list.do") != -1 ) {
			
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/product/product_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
