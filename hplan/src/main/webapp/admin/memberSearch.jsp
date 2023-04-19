<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
</style>
</head>
<body>
<%@ include file="../include/adminMenu.jsp" %>
<form name="form1" method="post" action="${path}/member_servlet/membersearch.do">

<select name="search_option">
<c:choose>
 <c:when test="${search_option == 'user_id' }">
	<option value="user_id" selected>ID</option>
 	<option value="user_name">회원명</option>
 	<option value="all">ID+회원명</option>
 </c:when>
 <c:when test="${search_option == 'user_name' }">
	<option value="user_id" >ID</option>
 	<option value="user_name" selected>회원명</option>
 	<option value="all">ID+회원명</option>
 </c:when>
 <c:when test="${search_option == 'all' }">
	<option value="user_id" >ID</option>
 	<option value="user_name">회원명</option>
 	<option value="all" selected>ID+회원명</option>
 </c:when>
</c:choose> 
</select>
<input name="keyword" value="${keyword}">
<button id="btnSearch">검색</button>
</form>
<input type="button" value="목록" id="btnList">
<form id="form1" method="post">
<table border="1" style="width: 100%;" >
  <tr>
    <th>회원 번호</th>
    <th>ID</th>
    <th>회원명</th>
    <th>E-MAIL</th>
    <th>PHONE</th>
    <th>가입일자</th>
   
  </tr>
  <c:forEach var="dto" items="${list}">
  <c:choose>
   <c:when test="${dto.show == 'y'}">
	  <tr>
	    <td>${dto.member_id}</td>
	    <td>${dto.user_id } </td>
	     
	   <td> <a href="${path}/member_servlet/member_view.do?member_id=${dto.member_id}">${dto.user_name}</a>
	    </td>
	    <td>${dto.user_email}</td>
	    <td>${dto.phone }</td>
	    <td>
	    <fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd"/> 
	  	</td>
	    </tr>
	  	</c:when>
	    <c:otherwise>
	     <tr>
	      <td>${dto.member_id}</td>
	      <td colspan="8" align="center">탈퇴한 회원입니다.</td>
	     </tr>
	    </c:otherwise>
	    </c:choose>
	  </c:forEach>
	
</table>
</form>
<script type="text/javascript">
$(function() {
	$("#btnList").click(function() {
		location.href="${path}/member_servlet/member_list.do";
	});
});

</script>
</body>
</html>