package hplan.controller;

import java.io.IOException;
import java.net.URLEncoder;
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

import hplan.dao.CartDAO;
import hplan.dto.CartDTO;
import hplan.dto.ProductDTO;


@WebServlet("/cart_servlet/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String url = request.getRequestURI().toString();
		String contextPath = request.getContextPath();
		CartDAO dao = new CartDAO();
		if(url.indexOf("productinit.do") != -1) {
			HttpSession session = request.getSession();
			String user_id = (String) session.getAttribute("user_id");
			if(user_id != null) { //로그인 한 경우
				
				int product_id = Integer.parseInt(request.getParameter("product_id"));
				int amount = Integer.parseInt(request.getParameter("amount"));
			
				String color = request.getParameter("color_option");
				String p_size = request.getParameter("size_option");
				
				
				CartDTO dto = new CartDTO();
				
				
				
				System.out.println("product_id : " + product_id );
				System.out.println("amount : " + amount );
				System.out.println("color : " + color );
				System.out.println("p_size : " + p_size );
				
				dto.setUser_id(user_id);
				dto.setProduct_id(product_id);
				dto.setAmount(amount);
				dto.setColor(color);
				dto.setP_size(p_size);
				
				
				dao.insertCart(dto);		
				String page="/cart_servlet/cartList.do";
				response.sendRedirect(contextPath+page);
			
			}else {
				String page="/member/login.jsp";
				response.sendRedirect(contextPath+page);
			}
			
			
		}else if(url.indexOf("cartList.do") != -1) {
			Map<String, Object> map = new HashMap<>();
			HttpSession session = request.getSession();
			String user_id =(String)session.getAttribute("user_id");
			System.out.println("유저 아이디 : " + user_id);
			if(user_id != null) { 
				List<CartDTO> list = dao.listCart(user_id);
				int sumMoney = dao.sumMoney(user_id);
				int fee = sumMoney >= 50000 ? 0 : 3000;
				
				map.put("sumMoney", sumMoney);
				map.put("fee", fee);
				map.put("sum",  sumMoney + fee);
				
				map.put("list", list);
				map.put("count", list.size());
				
				request.setAttribute("map", map);
				
				String page="/cart/cart_list.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}
				
		
		}else if(url.indexOf("update.do") != -1) {
			HttpSession session = request.getSession();
			String user_id =(String)session.getAttribute("user_id");
			
			if(user_id != null) {
				
				int amount = Integer.parseInt(request.getParameter("amount")); 
				int cart_id =Integer.parseInt(request.getParameter("cart_id")); 
				System.out.println("수량 : " + amount); 
			
				System.out.println("카트 번호 : " + cart_id);
				CartDTO dto = new CartDTO();
				dto.setUser_id(user_id);
			
				dto.setAmount(amount);
				dto.setCart_id(cart_id);
				dao.modifyCart(dto);
				if(amount != 0) {
					String page="/cart_servlet/cartList.do";
					response.sendRedirect(contextPath+page);
				}else {
					dao.delete(cart_id);
					String page="/cart_servlet/cartList.do";
					response.sendRedirect(contextPath+page);
				}
			
				
				
			}
		}else if(url.indexOf("delete.do") != -1) { // 선택 삭제
			HttpSession session = request.getSession();
			String user_id =(String)session.getAttribute("user_id");
			
			if(user_id != null) {
				int cart_id = Integer.parseInt(request.getParameter("cart_id"));
				System.out.println("카트 번호 : " + cart_id);
				dao.delete(cart_id);
				
				String page="/cart_servlet/cartList.do";
				response.sendRedirect(contextPath+page);
			
				
			}else {
				String page="/member/login.jsp";
				response.sendRedirect(contextPath+page);
			}
			
		}else if(url.indexOf("allCartDe.do") != -1) { // 전체 삭제
			HttpSession session = request.getSession();
			String user_id =(String)session.getAttribute("user_id");
			
			System.out.println("유저 아이디 : "+ user_id);
			if(user_id != null) {
				dao.deleteAll(user_id);
				
				String page="/cart_servlet/cartList.do";
				response.sendRedirect(contextPath+page);
			
				
			}else {
				String page="/member/login.jsp";
				response.sendRedirect(contextPath+page);
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
