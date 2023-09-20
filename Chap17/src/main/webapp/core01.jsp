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
	<!-- 
		* 실행순서 
		HTML → CSS → JavaScript → 스크립틀릿(자바) → JSTL
	 -->

	<!-- 스크립틀릿 변수 선언 -->
	<% String name = "김조은"; %>
	
	<!-- 스크립틀릿 변수 출력 -->
	<% out.print(name); %>
	
	<hr>
	
	<!-- JSTL 변수 선언 -->
	<%-- <c:set var="변수명" value="값" /> --%>
	<c:set var="name" value="김조은" />
	
	<!-- JSTL 출력 -->
	<%-- <%= name %> --%> <!-- JSTL 선언한 변수는 표현문으로 사용불가 --> 
	<!-- 스크립틀릿에서 선언한 변수와 jstl의 변수명은 중복이 가능하다 서로 불러올수는 없다. -->
	<c:out value="${name}" />
</body>
</html>










