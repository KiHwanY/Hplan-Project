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
			
			String cate_name = multi.getParameter("cate_name");
			String p_size = multi.getParameter("p_size");
			String p_name = multi.getParameter("p_name");
			String color=multi.getParameter("color");
			int p_price = Integer.parseInt( multi.getParameter("p_price"));
			String p_info = multi.getParameter("p_info");
			int p_stock = Integer.parseInt(multi.getParameter("p_stock"));
			
			String pf_img = " ";
			int filesize = 0;
			
			String product_img = " ";
			int filesize2 = 0;
			
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					
					String file1=(String)files.nextElement();
					File f1 = multi.getFile(file1);
					
					String file2 = (String)files.nextElement();
					File f2 = multi.getFile(file2);
					product_img = multi.getFilesystemName(file1);
					pf_img =multi.getFilesystemName(file2);
					if(f1 != null) {
						filesize=(int)f1.length(); // 파일 사이즈 저장
					}
					
					if(f2 != null) {
						filesize2=(int)f2.length();
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
			dto.setColor(color);
			dto.setP_size(p_size);
			
			
			if(pf_img == null || pf_img.trim().equals("")) {
				pf_img="-";
			}
			if(product_img == null || product_img.trim().equals("")) {
				product_img="-";
			}
			dto.setPf_img(pf_img);
			dto.setProduct_img(product_img);
			
			dao.product_insert(dto);
			String page="/product_servlet/product_list.do";
			response.sendRedirect(contextPath+page);

		}else if(url.indexOf("product_insert_form.do") != -1) {
			
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
			
			
			int sum = dao.priceSum(product_id);
			
			ProductDTO dto = dao.product_view(product_id);
			
			
			request.setAttribute("sum", sum);
			
			request.setAttribute("dto", dto);
			
			String page = "/product/product_view.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("product_updateForm.do") != -1) {
			
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			
			ProductDTO dto = dao.product_view(product_id);
			
			request.setAttribute("dto", dto);
			
			String page = "/product/product_UpdateForm.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("product_update.do") != -1 ) {
			
			File productUpload = new File(Constants.UPLOAD_PATH);
			
			if(! productUpload.exists()) {
				productUpload.mkdir(); // 디렉토리 생성
			}
			
			MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8", new DefaultFileRenamePolicy());
			
			int product_id = Integer.parseInt(multi.getParameter("product_id"));
			String cate_name = multi.getParameter("cate_name");
			String color = multi.getParameter("color");
			String p_name = multi.getParameter("p_name");
			String p_size = multi.getParameter("p_size");
			int p_price = Integer.parseInt( multi.getParameter("p_price"));
			String p_info = multi.getParameter("p_info");
			int p_stock = Integer.parseInt(multi.getParameter("p_stock"));
			
			String pf_img = " ";
			int filesize = 0;
			String product_img=" ";
			int filesize2 = 0;
			
			try {
				Enumeration files = multi.getFileNames();
				while(files.hasMoreElements()) {
					
					String file1=(String)files.nextElement();
					File f1 = multi.getFile(file1);
					
					String file2 = (String)files.nextElement();
					File f2 = multi.getFile(file2);
					product_img = multi.getFilesystemName(file1);
					pf_img =multi.getFilesystemName(file2);
					if(f1 != null) {
						filesize=(int)f1.length(); // 파일 사이즈 저장

						if(f2 != null) {
							filesize2=(int)f2.length();
				
						}
					}
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			ProductDTO dto = new ProductDTO();
			
			dto.setProduct_id(product_id);
			dto.setCate_name(cate_name);
			dto.setP_name(p_name);
			dto.setP_price(p_price);
			dto.setP_info(p_info);
			dto.setP_stock(p_stock);
			dto.setColor(color);
			dto.setP_size(p_size);
			
			
			//파일 첨부를 하지 않을 경우 기존 정보를 가져옴
			if(pf_img == null || pf_img.trim().equals("")) {
				
				ProductDTO dto2 = dao.product_view(product_id);
				String pf_img2 = dto2.getPf_img();
				dto.setPf_img(pf_img2);
				
			}else {
				dto.setPf_img(pf_img);
			}
			if(product_img == null || product_img.trim().equals("")) {
				ProductDTO dto3 = dao.product_view(product_id);
				String product_img2 = dto3.getProduct_img();
				dto.setProduct_img(product_img2);
				
			}else {
				dto.setProduct_img(product_img);
			}
			
			// 첨부파일 삭제 처리
			String fileDel = multi.getParameter("fileDel");
			String fileDel2 = multi.getParameter("fileDe2");
			
			
			if(fileDel != null && fileDel.equals("on")) {
				String pf_img1 = dao.getFileName(product_id);
				File f = new File(Constants.UPLOAD_PATH+pf_img);
				f.delete();
				
				dto.setPf_img("-");
				System.out.println("첨부파일 삭제!");
			}
			
			if(fileDel2 != null && fileDel2.equals("on")) {
				String product_img1 = dao.getFileName(product_id);
				File f = new File(Constants.UPLOAD_PATH+product_img);
				f.delete();
				
				dto.setProduct_img("-");
				System.out.println("상품 상세 이미지 삭제!");
				
			}
			
			dao.productUpdate(dto);
			
			String page ="/product_servlet/product_list.do";
			response.sendRedirect(contextPath+page);
			System.out.println("상품 수정 완료");
		}else if(url.indexOf("product_delete.do") != -1) {
			
			MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH
					,Constants.MAX_UPLOAD,"utf-8", new DefaultFileRenamePolicy());
			
			int product_id = Integer.parseInt(multi.getParameter("product_id"));
			
			 dao.productDelete(product_id);
			 
			 String page ="/product_servlet/product_list.do";
			 response.sendRedirect(contextPath+page);
			 
		}else if(url.indexOf("search.do") != -1) {
			
			String search_option = request.getParameter("search_option");
			String keyword = request.getParameter("keyword");
			
			List<ProductDTO> list = dao.searchLIst(search_option,keyword);
			
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			
			String page ="/product/search.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
		}else if(url.indexOf("contentList.do") != -1) {
			
			List<ProductDTO> list = dao.list();
			
			request.setAttribute("list", list);
			String page ="/hplan/content.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("productViewAction.do") != -1) {
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			ProductDTO dto = dao.product_view(product_id);
			request.setAttribute("dto", dto);
			
			String page = "/product/product_Userview.jsp";
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
