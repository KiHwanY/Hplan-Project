<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
#productList {margin-left: 50px; display: flex; flex-wrap: wrap; width: 1500px;}
#productTitle{ margin-top: 35px; font-size: 25px; font-weight: normal; font-style: normal; font-family:'Inter';}
#font2{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 24px;
color: #8C8C8C;
}
#paging{text-align: center;}
.product {float: left; width: 480px;  text-align: left; border: 1px solid white; }
#p_name {
	font-size: 12px;
	color: #999999;
	display: flex;
	font-weight: normal;
	line-height: 18px;
	margin: 20px 0 0 7px;
	flex-direction: column;
	line-height: 0.75em;
	padding-left: 30px;
}
#p_price {
	font-size: 12px;
	color: #999999;
	font-style: italic;
	font-weight: normal;
	line-height: 18px;
	display: flex;
	margin: 10px 0 50px 7px;
	flex-direction: column;
	line-height: 0.75em;
	padding-left: 30px;
}


</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div align="center">
<div id="productTitle">OUTER</div> 
<p id="font2">아래 상품을 확인하여 주세요.</p>
</div>
<hr>
<div id="productList">
	
	
		 <c:forEach var="dto" items="${list}">
		   <c:choose>
   			<c:when test="${dto.cate_name == 'outer'}">
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