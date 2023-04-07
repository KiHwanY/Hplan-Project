<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="hplan.dao.JoinDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
div {text-align: center; margin: 30px; font-size: 11px; font-style: none;}
.font1 {
	font-weight: bold; color:gray; font-size: 13px; opacity: 80%
}
button {font-size: 11px; font-style: none;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String user_id = request.getParameter("user_id");


JoinDAO jdao = new JoinDAO();
int result = jdao.joinIdCheck(user_id);
if(result == 1){
%>
	<form id =user_id>
	<div><span class="font1"><%= user_id %> </span>는 사용 가능한 아이디 입니다.</div>
	<div>
		<button type="button" onclick="selectid()">ID 사용</button>
	</div>
	</form>
	<%
}else if(result == 0){
	
	%>
	<div><span class="font1"><%= user_id %> </span>는 중복된 아이디 입니다.</div>
	<div>
		<button type="button" onclick="deleteid()">확인</button>
	</div>
	
		<%
}else{
	out.print("에러 발생(-1)");
}
	%>
	<script type="text/javascript">
	function selectid() {
		
		opener.document.join.idDuplication.value = "idCheck";
		opener.document.join.value = document.getElementById("user_id").value;
		
		if(opener != null){
			opener.idCheck = null;
			self.close();
		}
		
	}
	function deleteid() {
		opener.document.join.idDuplication.value = "idCheck";
		window.close();
	}

	</script>
</body>
</html>