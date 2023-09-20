<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL</title>
</head>
<body>
	<h1>데이터 목록</h1>
	<table border="1">
		<c:forEach var="i" begin="1" end="10">
			<tr>
				<c:forEach var="j" begin="1" end="3">
					<td>데이터 ${j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	<h1>리스트 목록</h1>
	<%
		ArrayList<String> list = new ArrayList<String>();
		list.add("아이템1");	
		list.add("아이템2");	
		list.add("아이템3");
		// JAVA -> JSTL
		pageContext.setAttribute("list", list);
	%>
	
	<c:forEach items="${list}" var="item">
		${item}
	</c:forEach>
	
	
	
	
</body>
</html>












