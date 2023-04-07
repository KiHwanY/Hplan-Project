<%@page import="java.io.PrintWriter"%>
<%@page import="hplan.dto.MemberDTO"%>
<%@page import="hplan.dao.JoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
script.println("alert('회원가입을 축하드립니다! 로그인 후 이용하세요.')");
script.println("location.href ='login.jsp'");
script.println("</script>");


%>
</body>
</html>