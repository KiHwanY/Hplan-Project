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

#home{
position: absolute;
width: 40px;
height: 34px;
left: 0px;
top: 45px;

font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 29px;
color: black;
}
#categoly{

color: black;
font-size: 10px;
}
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

</style>
</head>
<body>
<body translate="no">
<div class="bg-dark text-white">
<h6 align="center"><a href ="${path}/admin/adminForm.jsp" class="text-white">HELLO  !  Various Style ,  HPLAN</a></h6>
</div>
<div id="categoly"  style="text-align:right; margin: 0px; padding: 0px 30px 0px 0px;">

	<c:choose>
	<c:when test="${sessionScope.manager_id != null }">
	<span>${sessionScope.manager_id}님 안녕하세요.</span> |
	<a href="${path}/admin_servlet/logout.do">LOGOUT</a> | 
	</c:when>
	</c:choose>
	
	
</div>
<div style="margin: 0px; padding: 5px 0px; ">
	<div style="margin: 0px; padding: 5px 0px;">
	<header><h1 align="center"><a href="${path}/admin/adminForm.jsp" >H Plan</a></h1></header>
	</div>
</div>
<div>
	<div style="text-align:center; margin: 0px; padding: 10px 0px 0px 0px; word-spacing: 50px;">
	
	<a  href="${path}/product_servlet/product_list.do">상품목록</a>
	<a  href="${path}/product_servlet/product_insert_form.do">상품등록</a>
	<a  href="top.html" target="blank">유저목록</a>
	<a  href="bottom.html" target="blank">주문관리</a>
	<a  href="#" target="blank">주문리스트</a>
	</div>
	</div>
<hr>

</body>

