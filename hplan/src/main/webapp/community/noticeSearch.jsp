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
table{
	border-collapse: collapse;
}
table tr th,td{
	border: 1px solid gray;
	text-align: center;
	text-align: center;
	padding: 5px;
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
&nbsp;&nbsp;&nbsp;&nbsp;
<form name="form1" method="post" action="${path}/notice_servlet/search.do">

<select name="search_option">
<c:choose>
 <c:when test="${search_option == 'writer' }">
	 <option value="writer" selected>이름</option>
	 <option value="subject">제목</option>
	 <option value="content">내용</option>
	 <option value="all">이름+제목+내용</option>
 </c:when>
 <c:when test="${search_option == 'subject' }">
	 <option value="writer" >이름</option>
	 <option value="subject" selected>제목</option>
	 <option value="content">내용</option>
	 <option value="all">이름+제목+내용</option>
 </c:when>
 <c:when test="${search_option == 'content' }">
	 <option value="writer" >이름</option>
	 <option value="subject">제목</option>
	 <option value="content" selected>내용</option>
	 <option value="all">이름+제목+내용</option>
 </c:when>
 <c:when test="${search_option == 'all' }">
	 <option value="writer" >이름</option>
	 <option value="subject">제목</option>
	 <option value="content">내용</option>
	 <option value="all" selected>이름+제목+내용</option>
 </c:when>
</c:choose> 
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>
<c:if test="${sessionScope.manager_num != null}">
<button id="btnWrite">글쓰기</button>
</c:if>
<button id="btnList">목록</button>
<table border="1" style="width: 100%;" >
  <tr id = "cate_font">
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>작성일</th>
    <th>조회</th>
  </tr>
  <c:forEach var="dto" items="${list}">
  <c:choose>
   <c:when test="${dto.show == 'y'}">
	  <tr>
	    <td >${dto.num}</td>
	    <td>
	     <!-- 답글 들여쓰기 -->
	     <c:forEach var="i" begin="1" end="${dto.re_level}" >
	      &nbsp;&nbsp;
	     </c:forEach>
	    <a href="${path}/board_servlet/view.do?num=${dto.num}" >${dto.subject}</a>
	    </td>
	    <td >${dto.writer}</td>
	    <td>${dto.reg_date}</td>
	    <td>${dto.readcount}</td>
	    </c:when>
	    <c:otherwise>
	     <tr>
	      <td>${dto.num}</td>
	      <td colspan="4" align="center">삭제된 게시물입니다.</td>
	     </tr>
	    </c:otherwise>
	    </c:choose>
	  </c:forEach>
	
</table>
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/notice_servlet/write.do";
	});
	$("#btnList").click(function() {
		location.href="${path}/notice_servlet/noticeList.do";
	});
});

</script>
</body>
</html>

</body>
</html>