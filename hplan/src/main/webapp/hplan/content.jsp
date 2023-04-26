<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

</head>
<body>
<div id="productTitle"></div> 
<div id="productList">
	
	
		 <c:forEach var="dto" items="${list}">
		   <c:choose>
   			<c:when test="${dto.show == 'y'}">
		<div class="product">
  		
		
			<div class="product">
			<div>
				
				<a href="${path}/product_servlet/productViewAction.do?product_id=${dto.product_id}">
					<img src="/upload/${dto.pf_img}" alt="대표이미지" id="p_img" width="470px;" height= "470px;"/>
				</a>
			</div>
			
			<span id="p_name">${dto.p_name}</span>
			
			<div>
				<span id="p_price">${dto.p_price}원</span>
			</div>
			</div>
		
	
		</div>
		</c:when>
		</c:choose>
		</c:forEach>
</div>
</body>
</html>