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
#pwdTitle{margin-left: 300px; margin-bottom: 50px; font-size: 20px; font-weight: normal; font-style: normal;}
#pwd_font1{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 20px;
line-height: 36px;

color: #000000; 
}
#pwd_font2{

font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 10px;
line-height: 24px;
color: #8C8C8C;
}
#pwdUpdate {margin-left: 400px;}
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
<div id="pwdTitle"> Change PASSWORD </div>
<div align="center">

	<p id="pwd_font1">비밀번호 변경</p>
	<p id="pwd_font2">아래 정보를 확인하여 주세요.</p>
</div>
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<form name="pwdUpdate" id ="pwdUpdate" method="post" >
		<ul>
			<li>
			<label for="userid">Current PASSWORD</label><br>
			<input type="text" name="user_pwd"  id ="user_pwd" value="${dto.user_pwd}" readonly="readonly" style="background-color: gray;">
			</li>
			<li>
			<label for="passwd">Change PASSWORD</label><br>
			<input type="password" name="repw" id="repw" value="">
			</li>	
			<li>
				<label for="pw">PASSWORD CHECK</label><br>
				<input type="password" name="repw2" id="repw2">
			</li>
		</ul>
	<div id="pwd_btn">
		<input type="hidden" name="user_id" value="${dto.user_id}" >
		<button type="button" id="pwdUpdateResult"><img src="../joinimg/pwdUpdate.png" width="100" height="30"> </button>
		<button type="button" id="reset"><img  src="../joinimg/reset.png" width="100" height="30"> </button>
	</div>
	
	</form>
<script type="text/javascript">
$(function() {
	$("#pwdUpdateResult").click(function() {
		
		var form = document.pwdUpdate;
		
		var pwReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{9,15}$/g;
		
		if(!form.repw.value){
			alert("비밀번호를 입력하세요.");
			return false;
		}else if(!pwReg.test($("#repw").val())) {
			alert("비밀번호는 영문자,숫자,특수문자의 조합으로 된 10~16 범위의 문자로만 작성 가능합니다.");
			return false;
		}
		if(form.repw.value != form.repw2.value){
			alert("새로운 비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		alert("비밀번호가 수정되었습니다.");
		document.pwdUpdate.action ="${path}/member_servlet/pwdupdateresult.do";
		document.pwdUpdate.submit();
		
	});
	
	$(function() {
		$("#reset").click(function() {
			if(confirm("비밀번호 변경을 취소하시겠습니까?")){
				document.pwdUpdate.action="../hplan/index.jsp";
				document.pwdUpdate.submit();
			}
		});
	});
	
});

</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>