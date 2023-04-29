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
<h3>NOTICE</h3>
<form name="form1" method="post" action="${path}/notice_servlet/search.do">
<select name="search_option">
 <option value="writer">이름</option>
 <option value="subject">제목</option>
 <option value="content">내용</option>
 <option value="all">이름+제목+내용</option>
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>
<c:if test="${sessionScope.manager_id != null }">
<button id="btnWrite">글쓰기</button>
</c:if>

<table border="1" style="width: 100%;"  class="table table-hover" >
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
	    <a href="${path}/notice_servlet/view.do?num=${dto.num}" >${dto.subject}</a>
	    </td>
	    <td >${dto.writer}</td>
	    <td>${dto.reg_date}</td>
	    <td>${dto.readcount}</td>
	    </c:when>
	    </c:choose>
	  </c:forEach>
	  <!-- 페이지 네비게이션 출력 -->
	  <tr>
		  <td colspan="5" align="center">
		  <!-- onclick시 index.jsp의 자동 호출되었던 메모리에 기억하고 있는 function list(curPage)를 호출한다. -->
		   <c:if test="${page.curPage > 1}">
		    <a href="#" onclick="list('1')">[처음]</a>
		   </c:if>
		   <c:if test="${page.curBlock > 1}">
		    <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
		   </c:if>
		   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
		    <c:choose>
		     <c:when test="${num == page.curPage}">
		      <span style="color: red">${num}</span>
		     </c:when>
		     <c:otherwise>
		      <a href="#" onclick="list('${num}')">${num}</a>
		     </c:otherwise>
		    </c:choose>
		   </c:forEach>	<!-- 현재페이지블록 < 전체 페이지블록 갯수 -->
		   <c:if test="${page.curBlock < page.totBlock}">
		    <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
		   </c:if>
		   				<!-- 현재 페이지 < 전체 페이지 갯수 -->
		   <c:if test="${page.curPage < page.totPage}">
		    <a href="#" onclick="list('${page.totPage}')">[끝]</a>
		   </c:if>
		  </td>
 </tr>
</table>
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/community/noticewrite.jsp";
	});
});
function list(page) {
	location.href="${path}/notice_servlet/noticeList.do?curPage="+page;
}
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
