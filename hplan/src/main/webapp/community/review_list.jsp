<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
</head>
<body>
<table border="1" style="width: 100%" id="review">
	<tr>
		<th colspan="4" style="border-bottom: 1px solid gray;">
			<p style="font-size: 15px; text-align: left;">REVIEW</p>
		</th>
	</tr>
					
<c:forEach var="row" items="${list}">
 <tr>
  <td  style="padding-top: 5px; font-size: 12px;">
  ID) ${row.writer}(<fmt:formatDate value="${row.reg_date}" 
   pattern="yyyy-MM-dd hh:mm:ss"/>)<br>
  </td>
 </tr>
 <tr>
 	<td colspan="4" style="padding-top: 10px; border-bottom: 1px solid gray;">
 	${row.content}
 	
 	</td>
 
 </tr>
</c:forEach>
</table>
</body>
</html>