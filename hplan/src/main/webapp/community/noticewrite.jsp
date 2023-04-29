<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COMMUNITY</title>
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
#community_font1{
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 20px;
line-height: 36px;

color: #000000; 
}
#community_font2{

font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 13px;
line-height: 24px;
color: #8C8C8C;
}
li {list-style-type: none; margin-bottom: 10px; margin-left: 250px;}
label {color:gray;}
input {height: 20px;}
.error{color : red; display: none;}
#com_title {
margin-top: 80px;
}
#cate_font{
color: #8C8C8C;
font-size: 15px;
}
h3 {
	margin : 0 auto;
	text-align: center;
	margin-bottom: 15px;
	font-size : 12px;
	color: #555;
}
#content{
	
	height: 800px;
	resize: none;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div align="center" id="com_title">

	<p id="community_font1">COMMUNITY</p>
	<a id="community_font2" href="${path}/notice_servlet/noticeList.do">NOTICE</a> |
	<a id="community_font2" href="${path}/review_servlet/reviewList.do">REVIEW Q/A</a> 
</div>
<hr>
&nbsp;&nbsp;&nbsp;

<h3>NOTICE</h3>
&nbsp;&nbsp;&nbsp;
<form method="post" name="form1">
<div class="mb-3">
  <label for="writer" class="form-label">작성자</label>
  <input type="text" class="form-control" id="writer" name ="writer"placeholder="HPALN">
</div>
<div class="mb-3">
  <label for="subject" class="form-label">제목</label>
  <input type="text" class="form-control" id="subject" name="subject">
</div>
<div class="mb-3">
  <label for="content" class="form-label">내용</label>
  <textarea class="form-control" id="content" rows="3" name="content" placeholder="내용을 작성하세요..!"></textarea>
</div>
<div>
<button type="button" id="btninsert" class="btn btn-dark" >작성하기</button>
<button type="button" class="btn btn-light" id="reset">취소</button>
</div>
</form>
<script type="text/javascript">
		var form1 = document.form1;
		

$(function() {
	$("#btninsert").click(function() {
		var writer=$("#writer").val();
		var subject=$("#subject").val();
		var content=$("#content").val();
	
		if(writer==""){
			alert("이름을 입력하세요.");
			$("#writer").focus();
			return;
		}
		if(subject==""){
			alert("제목을 입력하세요.");
			$("#subject").focus();
			return;
		}
		if(content==""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return;
		}
		document.form1.action="${path}/notice_servlet/insert.do";
		document.form1.submit();
	});
	
	$("#reset").click(function() {
		location.href="${path}/notice_servlet/noticeList.do";
	});
});

</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>