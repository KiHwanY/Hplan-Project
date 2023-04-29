<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Member</title>
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
#Title{margin-left: 300px; margin-bottom: 50px; font-size: 20px; font-weight: normal; font-style: normal;}
#unregister_font1{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 20px;
line-height: 36px;

color: #000000; 
}
#unregister_font2{

font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 24px;
color: #8C8C8C;
}
#unregisterMember {margin-left: 400px;}
li {list-style-type: none; margin-bottom: 10px; margin-left: 250px;}
label {color:gray;}
input {height: 20px;}
.error{color : red; display: none;}
#pwd_btn{
	margin-left: 260px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="Title">UNREGISTER </div>
<div align="center">

	<p id="unregister_font1">회원 탈퇴</p>
	<p id="unregister_font2">원활한 탈퇴를 위해 비밀번호를 입력하여 주세요.</p>
</div>
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<form id="unregisterMember" name="unregisterMember"  method="post" >

	<fieldset>
		<ul>
	
			<li>
				<label for="user_id">ID</label><br>
				<input type="text" name="user_id" id="user_id" value="${dto.user_id}"  readonly="readonly" style="background-color: gray; ">&nbsp;&nbsp;&nbsp;&nbsp;
				<p>(영문소문자/숫자8~16자)</p>
			</li>
			<li>
				<label for="user_pwd">PASSWORD</label><br>
				<input type="password" name="user_pwd" id="user_pwd" >
				<p>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,8자~16자)</p>
				  <c:if test="${param.message == 'error'}">
   				 <span style="color: red;">비밀번호가 일치하지 않습니다.</span>
 				  </c:if>
			
			</li>
			
		</ul>
	</fieldset>
	<div style="margin-top: 15px; margin-left: 270px;" >
		<button type="button" id="btndelete"><img  src="../joinimg/memberreset.png" width="100" height="30" ></button>
		<button type="button" id="reset"><img  src="../joinimg/reset.png" width="100" height="30"> </button>
	</div>
	</form>

	<script type="text/javascript">
	$(function() {
		$("#btndelete").click(function() {
			document.unregisterMember.action ="${path}/member_servlet/pass_check.do";
			document.unregisterMember.submit();
			
		});
	});
	
	$(function() {
		$("#reset").click(function() {
			if(confirm("회원 탈퇴를 취소하시겠습니까?")){
				document.unregisterMember.action="../hplan/index.jsp";
				document.unregisterMember.submit();
			}
		});
	});
	
	
	
	</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>