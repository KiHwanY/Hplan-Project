<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%

PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('회원 탈퇴 하셨습니다.')");
script.println("location.href ='../hplan/index.jsp'");
script.println("</script>");


%>

</body>
</html>