<%@page import="hplan.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
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
#joinTitle{margin-left: 300px; margin-bottom: 50px; font-size: 20px; font-weight: normal; font-style: normal;}
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
li {list-style-type: none; margin-bottom: 10px; margin-left: 250px;}
label {color:gray;}
input {height: 20px;}
.error{color : red; display: none;}

img.absolute {
		position: absolute;
		left: 1200px;
}
</style>
</head>
<body>
<%@ include file="../include/adminMenu.jsp" %>

<div align="center">

	<p id="join_font1">회원 정보</p>
	<p id="join_font2">${dto.user_name}님 정보를 확인하여 주세요.</p>
</div>
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;

<form id="join" name="join"  method="post" >
	
	

	<fieldset>
		<ul>
	
			<li>
				<label for="user_id">ID</label><br>
				<input type="text" name="user_id" id="user_id" value="${dto.user_id}" readonly="readonly" >&nbsp;&nbsp;&nbsp;&nbsp;
			
			</li>
			<li>
				<label for="user_pwd">PASSWORD</label><br>
				<input type="password" name="user_pwd" id="user_pwd" value="${dto.user_pwd }" readonly="readonly" >
				
			
			</li>
			<li>
				<label for="user_name">이름</label><br>
				<input type="text" name="user_name" id="user_name" value="${dto.user_name}" readonly="readonly"  >
				
			</li>
				<li>
				<label for="user_email">E-MAIL</label><br>
				<input type="text" name="user_email" id="user_email" value="${dto.user_email}" readonly="readonly" >
				
			</li>
			<li>
				<label>우편번호</label><br>
				<input type="text" name="zip_code" id="zip_code" size="5" readonly="readonly" value="${dto.zip_code}" readonly="readonly" >&nbsp;&nbsp;&nbsp;&nbsp;
				
				
			</li>
			<li>
				<label for="address1">기본주소</label><br>
				<input type="text" name="address1" id="address1" size="60" readonly="readonly" value="${dto.address1}" readonly="readonly" >
				
			</li>
			<li>
				<label for="address2">상세주소</label><br>
				<input type="text" name="address2" id="address2" size="60"  value="${dto.address2}" readonly="readonly" >
				
			</li>
			<li>
				<label for="phone">PHONE</label><br>
				<input type="tel" name="phone" id="phone"  maxlength="13" value="${dto.phone}" readonly="readonly" >
				
				
			</li>
			
	
		</ul>
	</fieldset>
	<div style="margin-top: 15px; margin-left: 270px;" >
		<img src="../joinimg/listbtn.png" alt="뒤로가기" width="100" height="30" onclick="history.back();"/>
		<button type="button" id="btndelete"><img src="../joinimg/memberreset.png" width="100" height="30"> </button>
		
	</div>
</form>
<script type="text/javascript">
$("#btndelete").click(function() {
	if(confirm("회원 탈퇴를 하시겠습니까?")){
		document.join.action="${path}/member_servlet/memberDeleteform.do";
		document.join.submit();
	}
});

</script>


</body>
</html>