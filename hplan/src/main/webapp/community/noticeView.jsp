<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COMMUNITY</title>
<%@ include file="../include/header.jsp" %>
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
#join {margin-left: 350px;}
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
#board_detail {
	width: 500px;
	margin-left: 500px;
}
table {
	border: 0;
	border-collapse: collapse;
}
th, td {
	padding: 5px;
	border-top: 1px solid #e8e8e8;
	border-bottom: 1px solid #e8e8e8;
	color: #757575;
}
th {
	width: 100px;
	background-color: #FFFFF;
}
td {
	width: 400px;
}
.title, .content {
	text-align: left;
	color : black;
}
.content {
	height: 100px;
	vertical-align: middle;
}
#listBtn {
	border : 1px solid #d7d5d5;
}
#content{
	width: 400px;
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

<form name="form1" method="post">
<div id="board_detail">
<hr>
	<h3>NOTICE</h3>
	<table>
		<tr>
			<th>글번호</th>
			<td>
				${dto.num}
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td class="title">
				${dto.subject}
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				${dto.writer}
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				${dto.reg_date}
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="content">
			 <textarea class="form-control" id="content" rows="3" name="content" readonly="readonly">${dto.content}</textarea>
			</td>
		</tr>
	</table>
	<hr>
	<div id="board_menu">
		
		
		
		<button type="button" id="listBtn" class="btn btn-light">글목록</button>
		<c:if test="${sessionScope.manager_id != null }">
		<input type="hidden" id="num" name="num" value="${dto.num}">
		<button type="button" id="updateBtn"  class="btn btn-light">수정</button>
		<button type="button" id="deleteBtn"  class="btn btn-dark">삭제</button>
		</c:if>
	</div>
</div>
 </form>
 <script type="text/javascript">
$(function() {
	var form1 = document.form1;
	
	 $("#listBtn").click(function() {
			location.href="${path}/notice_servlet/noticeList.do";
	 });
	 $("#updateBtn").click(function() {
	 		document.form1.action="${path}/notice_servlet/noticeUpdateForm.do";
	 		document.form1.submit();
	 		
	});
	 $("#deleteBtn").click(function() {
		if(confirm("게시물을 삭제하시겠습니까?")){
			document.form1.action="${path}/notice_servlet/noticeDelete.do";
			document.form1.submit();
		}
	 
	});
});
 
 
 </script>
 <%@ include file="../include/footer.jsp" %>
</body>
</html>