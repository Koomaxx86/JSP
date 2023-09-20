<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- main에서 저장한 변수와 매개변수를 request내장 객체에 get매소드를 이용해서 가져옴 --%>
	<%
	
		String id = request.getParameter("id");
		int age = Integer.parseInt(request.getParameter("age"));
	%>
	<h3>이름 : <%= id %></h3>
	<h3>나이 : <%= age %></h3>
</body>
</html>