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
top: 15px;

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
#joinTitle{margin-left: 300px; margin-bottom: 50px; font-size: 20px; font-weight: normal;}
#join_font1{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 20px;
line-height: 36px;

color: #000000; 
}
#join_font2{

font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 24px;
color: #8C8C8C;
}
#join {margin-left: 350px;}
li {list-style-type: none; margin-bottom: 10px;}
label {color:gray;}
input {height: 20px;}
.error{color : red; display: none;}
.joinimg{
	
}
</style>
</head>
<body>
<body translate="no">
<div class="bg-dark text-white">
<h6 align="center"><a href ="${path}/member/join.jsp" class="text-white">HELLO  !  Various Style ,  HPLAN</a></h6>
</div>
	<a href="${path}/hplan/index.jsp" id="home">HOME</a>
<div id="categoly"  style="text-align:right; margin: 0px; padding: 0px 30px 0px 0px;">


	<c:if test="${sessionScope.user_id != null }">
	<span>${sessionScope.user_id}님 환영합니다.</span> |
	<a href="${path}/member_servlet/logout.do">LOGOUT</a> | <!-- 로그아웃 -->
	<a href="${path}/member_servlet/mylist.do?user_id=${sessionScope.user_id}">ME</a> | <!-- 개인 정보 수정 -->
	<a href="cart.jsp">MYSHOP</a> |
	<a href="#">CART</a> |
	<a href="#">ORDER</a> |
	<a href="#">CMOMUNITY</a> 
	</c:if>
	<c:if test="${sessionScope.user_id == null }">
	<a href="${path}/member/login.jsp">LOGIN</a> |
	<a href="${path}/member/join.jsp">JOIN</a>
	</c:if>
	
</div>
<div style="margin: 0px; padding: 5px 0px; ">
	<div style="margin: 0px; padding: 5px 0px;">
	<header><h1 align="center"><a href="${path}/hplan/index.jsp" >H Plan</a></h1></header>
	</div>
</div>
<div>
	<div style="text-align:center; margin: 0px; padding: 10px 0px 0px 0px; word-spacing: 50px;">
	
	<a  href="outer.html" target="blank">OUTER</a>
	<a  href="top.html" target="blank">TOP</a>
	<a  href="top.html" target="blank">KNIT</a>
	<a  href="bottom.html" target="blank">BOTTOM</a>
	<a  href="#" target="blank">SHOES</a>
	</div>
	</div>
<hr>