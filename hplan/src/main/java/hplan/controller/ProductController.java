package hplan.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import hplan.dao.AdminDAO;
import hplan.dao.ProductDAO;
import hplan.dto.AdminDTO;
import hplan.dto.ProductDTO;


@WebServlet("/product_servlet/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		ProductDAO dao = new ProductDAO();
		AdminDAO admindao = new AdminDAO();
		if(url.indexOf("product_insert.do") != -1) {
			File uploadDir = new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) { // 디렉토리가 없으면
				uploadDir.mkdir(); // 디렉토리 생성
			}
			MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH,Constants.MAX_UPLOAD, "utf-8" , new DefaultFileRenamePolicy());
			
			String cate_name = multi.getParameter("cate_name");
			String p_name = multi.getParameter("p_name");
			int p_price = Integer.parseInt( multi.getParameter("p_price"));
			String p_info = multi.getParameter("p_info");
			int p_stock = Integer.parseInt(multi.getParameter("p_stock"));
			
			String pf_img = " ";
			int filesize = 0;
			
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					
					String file1=(String)files.nextElement();
					pf_img =multi.getFilesystemName(file1);
					File f1 = multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length(); // 파일 사이즈 저장
					}
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			ProductDTO dto = new ProductDTO();
			
			dto.setCate_name(cate_name);
			dto.setP_name(p_name);
			dto.setP_price(p_price);
			dto.setP_info(p_info);
			dto.setP_stock(p_stock);
			
			if(pf_img == null || pf_img.trim().equals("")) {
				pf_img="-";
			}
			dto.setPf_img(pf_img);
			
			dao.product_insert(dto);
			String page="/product_servlet/product_list.do";
			response.sendRedirect(contextPath+page);

		}else if(url.indexOf("product_insert_form.do") != -1) {
			
			String manager_id = request.getParameter("manager_id");
			
			AdminDTO dto =admindao.idcheck(manager_id);
			
			
			System.out.println("관리자 번호 : " + manager_id );
			
			request.setAttribute("dto", dto);
			String page= "/product/product_insert.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("product_list.do") != -1 ) {
			
			List<ProductDTO> list = dao.list();
			request.setAttribute("list", list);
			String page ="/product/product_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("product_view.do") != -1) {
			
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			
			HttpSession session = request.getSession();
			Map<String, Object> map = new HashMap<>();
	
			int sum = dao.priceSum(product_id);
			
			ProductDTO dto = dao.product_view(product_id);
			map.put("sum", sum);
			
			request.setAttribute("dto", dto);
			request.setAttribute("map", map);
			String page = "/product/product_view.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
