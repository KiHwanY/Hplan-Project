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
<div style="text-align:center; margin: 0px; padding: 10px 0px 0px 0px; word-spacing: 50px;">
	
	<a  href="outer.html" target="blank">OUTER</a>
	<a  href="top.html" target="blank">TOP</a>
	<a  href="top.html" target="blank">KNIT</a>
	<a  href="bottom.html" target="blank">BOTTOM</a>
	<a  href="#" target="blank">SHOES</a>
	</div>
	<hr>
	
<form name="form1" method="post" action="${path}/product_servlet/search.do">
<select name="search_option">
 <option value="writer">상품명</option>
 <option value="content">내용</option>
 <option value="all">상품명+내용</option>
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>
<form id="form1"  enctype="multipart/form-data" method="post">
<table border="1" style="width: 100%;" >
  <tr>
    <th>상품 번호</th>
    <th>카테고리</th>
    <th>상품 이미지</th>
    <th>상품명</th>
    <th>상품 가격</th>
    <th>재고 수량</th>
    <th>판매 수량</th>
    <th>상품 등록일</th>
    
  </tr>
  <c:forEach var="dto" items="${list}">
  <c:choose>
   <c:when test="${dto.show == 'y'}">
	  <tr>
	    <td>${dto.product_id}</td>
	    <td>${dto.cate_name } </td>
	    <td><img src="${path}/img/${dto.pf_img}" width="100px" height="100px"></td>
	    <td>   
	    <a href="${path}/product_servlet/product_view.do?product_id=${dto.product_id}">${dto.p_name}</a>
	     <!-- 댓글갯수 표시 --> 
	     <%-- <c:if test="${dto.comment_count > 0}"> --%>
	     <%-- 	<span style="color: red;">(${dto.comment_count})</span>
	     </c:if> --%>
	    </td>
	    <td>${dto.p_price}</td>
	    <td align="center">${dto.p_stock }</td>
	    <td align="center">${dto.p_sell}</td>
	    <td >${dto.p_enroll}</td>
	    </tr>
	  	</c:when>
	    <c:otherwise>
	     <tr>
	      <td>${dto.prodcut_id}</td>
	      <td colspan="8" align="center">삭제된 게시물입니다.</td>
	     </tr>
	    </c:otherwise>
	    </c:choose>
	  </c:forEach>
	
</table>
</form>
<script type="text/javascript">
function btnWrite() {
	document.form1.action="${path}/product_servlet/product_insert.do";
	document.form1.summit();
	
}
</script>
</body>
</html>