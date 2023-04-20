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
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="joinTitle">JOIN</div>
<div align="center">

	<p id="join_font1">회원 가입</p>
	<p id="join_font2">아래 정보를 확인하여 주세요.</p>
</div>
<hr>
&nbsp;&nbsp;&nbsp;&nbsp;

<form id="join" name="join"  method="post" action="${path}/member_servlet/join.do" onsubmit="return checkValue()">
	

	<fieldset>
		<ul>
			<li>
				<label for="user_id">ID</label><br>
				<input type="text" name="user_id" id="user_id" onkeydown="inputIdChk()">&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="idCheck"><img src="../joinimg/idcheck.png" alt="idCheckImg" id="idCheckImg"  width="100" height="30" ></span><p>(영문소문자/숫자8~16자)</p>
				<input type="hidden" name="idDuplication" value="idUncheck">
				
			</li>
			<li>
				<label for="user_pwd">PASSWORD</label><br>
				<input type="password" name="user_pwd" id="user_pwd"><p>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,8자~16자)</p>
			
			</li>
			<li>
				<label for="pw">PASSWORD CHECK</label><br>
				<input type="password" name="repw" id="repw">
				
			</li>
			<li>
				<label for="user_name">이름</label><br>
				<input type="text" name="user_name" id="user_name">
				
			</li>
				<li>
				<label for="user_email">E-MAIL</label><br>
				<input type="text" name="user_email" id="user_email" placeholder="xxx@xxx.xxx">
				
			</li>
			<li>
				<label>우편번호</label><br>
				<input type="text" name="zip_code" id="zip_code" size="5" readonly="readonly">&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="postSearch"><img  src="../joinimg/zipcode.png" alt="postSearch"  width="100" height="30"></span>
				
			</li>
			<li>
				<label for="address1">기본주소</label><br>
				<input type="text" name="address1" id="address1" size="60" readonly="readonly">
				
			</li>
			<li>
				<label for="address2">상세주소</label><br>
				<input type="text" name="address2" id="address2" size="60">
				
			</li>
			<li>
				<label for="phone">PHONE</label><br>
				<input type="tel" name="phone" id="phone" placeholder="010-000-0000" maxlength="13">
				
				
			</li>
			
		</ul>
	</fieldset>
	<div style="margin-top: 15px; margin-left: 250px;" >
		<button type="submit"><img  src="../joinimg/joincheck.png" width="100" height="30"></button>
		<button type="reset"><img  src="../joinimg/joinreset.png" width="100" height="30"> </button>
	</div>
</form>
<script type="text/javascript">

function checkValue() {
	
	var form = document.join;
	
	if(!form.user_id.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	var pwReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{9,15}$/g;
	if(!form.user_pwd.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}else if(!pwReg.test($("#user_pwd").val())) {
		alert("비밀번호는 영문자,숫자,특수문자의 조합으로 된 10~16 범위의 문자로만 작성 가능합니다.");
		return false;
	}
	
	if(form.user_pwd.value != form.repw.value){
		alert("비밀번호를 동일하게 입력하세요.");
		return false;
	}
	if(!form.user_name.value){
		alert("이름을 입력하세요.");
		return false;
	}
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if(!form.user_email.value){
		alert("이메일을 입력하세요.");
		return false;
	}else if(!emailReg.test($("#user_email").val())) {
		alert("이메일을 형식(avc@abc.com)에 맞게 입력해 주세요..");
		return false;
	}
	
	
	if(!form.zip_code.value){
		alert("우편번호를 입력하세요.");
		return false;
	}
	if(!form.address1.value){
		alert("기본주소를 입력하세요.");
		return false;
	}
	if(!form.address2.value){
		alert("상세주소를 입력하세요.");
		return false;
	}
	if(!form.phone.value){
		alert("전화번호를 입력하세요.");
		return false;
	}

	}
	function inputIdChk() {
		document.join.idDuplication.value="idUncheck";
	}
	





$("#idCheck").click(function() {
	//아이디 관련 에러메세지가 보여지지 않도록 설정	
	

	//팝업창 실행하여 아이디 중복 검사 페이지(id_check.jsp) 요청 - 아이디 전달
	window.open("${path}/member/id_check.jsp?user_id="+$("#user_id").val()
			,"idCheck","width=450,height=130,left=700,top=400");
});



$("#postSearch").click(function() {
	
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$("#postSearch").click(function() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        $("#zip_code").val(data.zonecode);
	        $("#address1").val(data.address);
	    }
	}).open();
});
</script>

</body>
</html>