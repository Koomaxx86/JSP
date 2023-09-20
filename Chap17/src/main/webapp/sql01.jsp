<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL - sql</title>
</head>
<body>
	<!-- JDBC 데이터 소스 설정 -->
	<sql:setDataSource var="dataSource" 
		url="jdbc:mysql://localhost:3306/joeun?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"
		driver="com.mysql.cj.jdbc.Driver"
		user="joeun"
		password="123456"
	/>
	
	<!-- 데이터 조회 -->
	<sql:query var="list" dataSource="${dataSource}">
		SELECT * FROM product
	</sql:query>
	
	<!-- 데이터 목록 -->
	<table border="1">
		<tr>
			<th>이미지</th>
			<c:forEach var="col" items="${list.columnNames}">
				<th><c:out value="${col}" /></th>
			</c:forEach>
		</tr>
		<c:forEach var="row" items="${list.rowsByIndex}">
			<tr>
				<td>
					<img src="shop/img?id=${row[0]}" width="100" />
 				</td>
				<c:forEach var="col" items="${row}" varStatus="i">
					<td>
						<c:out value="${col}"/>
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>












