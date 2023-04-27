<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>join</title>
<%@ include file="../include/header.jsp" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
 <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
 <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 <style type="text/css">
 *{margin:0; padding:0; list-style:none;}
a{text-decoration:none;	color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}
	
a {text-decoration-line: none; }

p {
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 3px;
line-height: 18px;
}
h1, h2{text-shadow:none; text-align:center;}
h1{	color: #666; text-transform:uppercase;	font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 

}
table{
	border-collapse: collapse;
}
table tr th,td{
	border: 1px solid gray;
	text-align: center;
	text-align: center;
	padding: 5px;
}
#cartTitle{margin-left: 300px; margin-bottom: 50px; font-size: 20px; font-weight: normal; font-style: normal;}
#cart_font1{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 20px;
line-height: 36px;

color: #000000; 
}
#cart_font2{

font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 24px;
color: #8C8C8C;
}
table th{
	font-size: 18px;
	color: #999999;
}
#totalMoney{
 font-size: 25px;
 color: #000000;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="cartTitle">CART</div>
<div align="center">

	<p id="cart_font1">장바구니</p>
	<p id="cart_font2">구매하실 상품을 확인하세요.</p>
</div>
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;

<form id="form1" name="form1" enctype="multipart/form-data" method="post" action="${path}/cart_servlet/update.do">
<table border="1" style="width: 100%;" >
  <tr>
    <th>카테고리</th>
    <th>이미지</th>
    <th>상품정보</th>
    <th>판매가</th>
    <th>수량</th>
    <th>배송비</th>
    <th>합계</th>
    <th>선택</th>
    
    
  </tr>
  <c:forEach var="row" items="${map.list}">
  <c:choose>
   <c:when test="${row.user_id != null}">
	  <tr>
	    <td>${row.cate_name } </td>
	    <td><img src="/upload/${row.pf_img}" width="100px" height="100px"></td>
	    <td>   
	    <a href="${path}/product_servlet/product_view.do?product_id=${row.product_id}">${row.p_name}</a>
	  
	    </td>
	    <td>${row.p_price}원</td>
	    <td align="center">
	     <input type="number" id="amount" name="amount" value="${row.amount}" style="width: 50px; height: 30px;">
	    <input type="hidden" id="cart_id"name="cart_id" value="${row.cart_id}">
	    </td>
	    <td >${map.fee}원</td>
	    <td>${map.sumMoney}원</td>
	    <td>
	    <input type="submit" id="btnUpdate" value="상품수정" style="width: 50px; height: 30px;" ><br>
	    <input class="btn btn-dark" type="button" id="cartDelete" value="삭제">
	    </td>
	    </tr>
	  	</c:when>
	    </c:choose> 
	  </c:forEach>
	
</table>
<div align="right">
	<input class="btn btn-secondary" type="button" id="AllDelete" value="장바구니비우기">
</div>
&nbsp;&nbsp;&nbsp;
<table  border="1" style="width: 100%;" >
<tr>
	<th>총 상품금액</th>
	<th>총 배송비</th>
	<th>결제예정급액</th>
</tr>
<tr id="totalMoney">
	
	<td>${map.sumMoney}원</td>
	<td>+${map.fee}원</td>
	<td>=&nbsp;${map.sum}원</td>

</tr>
</table>
<div align="right">
	<input class="btn btn-secondary" type="button" id="mainList" value="쇼핑계속하기">
</div>
</form>
<script type="text/javascript">
var form1 = document.form1;

$(function() {
	
	
	$("#cartDelete").click(function() {
		if(confirm("선택 상품을 삭제하시겠습니까?")){	
		document.form1.action="${path}/cart_servlet/delete.do";
		document.form1.submit();
		}
	});
	
	$("#AllDelete").click(function() {
		if(confirm("전체 상품을 삭제하시겠습니까?")){
		document.form1.action="${path}/cart_servlet/Alldelete.do";
		document.form1.submit();
		}
	});
	$("#mainList").click(function() {
		location.href="../hplan/index.jsp";
	});
});
</script>


</body>
</html>