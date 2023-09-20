<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인에 성공했습니다</h3>
	<%
		// 클라이언트 디렉티브 tag에서 charset이 utf-8로 되있기에 맞춰줘야 한다.
		request.setCharacterEncoding("UTF-8"); 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<p> 아이디 : <%= id %> </p>
	<p>	비밀번호 : <%= pw %> </p>
</body>
</html>