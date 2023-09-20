<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL</title>
</head>
<body>
	<%
		// String number = request.getParameter("number");
	%>
	<c:set var="number" value="${param.number}" />
	숫자 : <c:out value="${number}" />
	<hr>
	<!-- 다중 조건 -->
	<c:choose>
		<c:when test="${number % 2 == 0}">
			<c:out value="${number}" /> 은 짝수 입니다.
		</c:when>
		<c:when test="${number % 2 == 1}">
			<c:out value="${number}" /> 은 홀수 입니다.
		</c:when>
		<c:otherwise>
			숫자가 아닙니다.
		</c:otherwise>
	</c:choose>
	
	<hr>

	<!-- 단일 조건 -->
	<!-- c:if 는 단독 조건문만 가능 (else 개념이 없음)  -->	
	<c:if test="${number % 2 == 0}">
		<c:out value="${number}" /> 은 짝수 입니다.
	</c:if>
	<c:if test="${number % 2 == 1}">
		<c:out value="${number}" /> 은 홀수 입니다.
	</c:if>
	글자수 : <c:out value="${fn:length(number)}" /> 
	
	
	
	
</body>
</html>




