<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>

	<c:set var="productId" value="${param.productId}" />
	
	<!-- JDBC 데이터 소스 설정 -->
	<sql:setDataSource var="dataSource" 
		url="jdbc:mysql://localhost:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"
		driver="com.mysql.cj.jdbc.Driver"
		user="joeun"
		password="123456"
	/>


	<sql:update dataSource="${dataSource}" var="resultSet">
		DELETE FROM product 
		WHERE product_id  = ? 
		<sql:param value="${productId}" />
	</sql:update>
	
	<p>
		<c:out value="${resultSet}" /> 건이 삭제되었습니다.
	</p>
	
	<a href="sql01.jsp">목록</a>
	<%
		// response.sendRedirect("sql01.jsp");
	%>
</body>
</html>




