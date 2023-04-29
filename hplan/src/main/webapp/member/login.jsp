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
margin-left: 700px; margin-bottom: 35px; font-size: 50px; font-weight: normal; font-style: normal; font-family:'Inter';
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
<div id="loginTitle">Login</div>

&nbsp;&nbsp;&nbsp;&nbsp;
	<form name="login" id ="login" method="post" action="${path}/member_servlet/loginCheck.do">
		<ul>
		<li>
			<label for="userid">ID</label><br>
			<input type="text" name="user_id"  id ="user_id" value="">
			</li>
			<li>
			<label for="passwd">PASSWORD</label><br>
			<input type="password" name="user_pwd" id="user_pwd" value="">
		</li>	
		</ul>
	<div id="login_btn">
	
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
 	<div id ="joincheckform" style="margin-left: 680px;">
 		<p>!아직도 회원이 아니시라면 지금 바로 가입하세요.</p>
 		<button type="button" id="joincheckForm"><img src="../joinimg/joincheck.png" width="70" height="30"></button>
 	</div>
 	
 	<script type="text/javascript">
 	$("#joincheckForm").click(function() {
 		document.login.action="../member/join.jsp";
		document.login.submit();
	});
 	
 	</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>