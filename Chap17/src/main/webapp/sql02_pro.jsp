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
	<c:set var="name" value="${param.name}" />
	<c:set var="unitPrice" value="${param.unitPrice}" />
	<c:set var="description" value="${param.description}" />
	<c:set var="manufacturer" value="${param.manufacturer}" />
	<c:set var="category" value="${param.category}" />
	<c:set var="unitsInStock" value="${param.unitsInStock}" />
	<c:set var="condition" value="${param.condition}" />
	<c:set var="file" value="sample" />

	
	<!-- JDBC 데이터 소스 설정 -->
	<sql:setDataSource var="dataSource" 
		url="jdbc:mysql://localhost:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"
		driver="com.mysql.cj.jdbc.Driver"
		user="joeun"
		password="123456"
	/>


	<sql:update dataSource="${dataSource}" var="resultSet">
		INSERT INTO product (product_id, name, unit_price, description, manufacturer, category, units_in_stock, `condition`, file)				
		VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ? )
		<sql:param value="${productId}" />
		<sql:param value="${name}" />
		<sql:param value="${unitPrice}" />
		<sql:param value="${description}" />
		<sql:param value="${manufacturer}" />
		<sql:param value="${category}" />
		<sql:param value="${unitsInStock}" />
		<sql:param value="${condition}" />
		<sql:param value="${file}" />
	</sql:update>
	
	<p>
		<c:out value="${resultSet}" /> 건이 등록되었습니다.
	</p>
	
	<a href="sql01.jsp">목록</a>
	
	<%
		// response.sendRedirect("sql01.jsp");
	%>
</body>
</html>




