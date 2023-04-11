<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
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
#loginTitle{
margin-left: 550px; margin-bottom: 35px; font-size: 50px; font-weight: normal; font-style: normal; font-family:'Inter';
 }
#login_font1{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 20px;
line-height: 36px;

color: #000000; 
}
#login_font2{

font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 24px;
color: #8C8C8C;
}
#login {margin-left: 350px;}
li {list-style-type: none; margin-bottom: 10px; margin-left: 300px;}
label {color:gray;}
input {height: 20px;}
.error{color : red; display: none;}
#login_btn{
	margin-left: 330px;
}
</style>
</head>
<body translate="no">
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div id="loginTitle">Administrator Login</div>

&nbsp;&nbsp;&nbsp;&nbsp;
	<form name="login" id ="login" method="post" action="${path}/admin_servlet/loginCheck.do">
		<ul>
		<li>
			<label for="userid">MANAGER ID</label><br>
			<input type="text" name="manager_id"  id ="manager_id" value="">
			</li>
			<li>
			<label for="passwd">MANAGER PASSWORD</label><br>
			<input type="password" name="manager_pwd" id="manager_pwd" value="">
		</li>	
		</ul>
	<div id="login_btn">
	<input type="hidden" id="manager_num" name="manager_num">
	<button type="submit"><img src="../joinimg/loginbutton.png" width="170px" height="40px"> </button>
	</div>
	
	</form>
	<!-- 로그인 실패 시 메세지 출력 -->
	<%
 String message = request.getParameter("message");
 if(message != null){
	 %>	 
	 <span style="color : red; margin-left: 610px;"><%= message %></span>
 <%
 }
 %>
 	
 	</script>
	<div id ="footer">
	<br><br><br><br><br><br><br><br>
	<div class="footer" style="margin-left: 450px;">

		<ul>
		<span>COMPANY: H PLAN</span>
		<span>OWNER: H PLAN</span>
		<span>BUSINESS LICENSE: 111-11-1111</span>
		<span>ONLINE BUSINESS: 2023-서울역삼-2099</span><br>
		<span>ADDRESS: 서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층</span><br>
		<span>E - MAIL: HPLAN@naver.com</span>
		</ul>
	</div>
	</div>
</body>
</html>