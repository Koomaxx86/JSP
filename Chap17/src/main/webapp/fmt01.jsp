<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		Date now = new Date();
		pageContext.setAttribute("now", now);
	%>
	<h1><c:out value="${now}" /></h1>
	<h1><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></h1>
	<h1><fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /></h1>
	
	<hr>
	
	<h1><fmt:formatDate value="${now}" type="date" /></h1>
	<h1><fmt:formatDate value="${now}" type="time" /></h1>
	<h1><fmt:formatDate value="${now}" type="both" /></h1>
	
	<hr>
	
	<h1><fmt:formatNumber value="12.4567" type="number" /></h1>
	<h1><fmt:formatNumber value="12.4567" type="currency" /></h1>
	<h1><fmt:formatNumber value="12.4567" type="percent" /></h1>
	<h1><fmt:formatNumber value="12.4567" pattern=".0" /></h1>
	<h1><fmt:formatNumber value="12.4567" pattern="₩0.0" /></h1>

	
</body>
</html>






