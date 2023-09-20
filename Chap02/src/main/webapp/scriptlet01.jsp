<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i = 1; i <= 10; i++ ) {
			out.println("<h3>" + i + "</h3>"); 
		}
	%>
	
	<hr>
	
	<%-- 반복문 시작. 중괄호를 열기만 했다. --%>
	<%
		for(int i = 1; i <= 10; i++ ) {	
	%>
	
		<%-- html태그 중간 삽입.i의 값은 java의 반복값을 가져온다.--%>
		<h3><%= i %></h3>
	
	<%-- 반복문을 완성시킨다 --%>
	<%
		}
	%>
</body>
</html>