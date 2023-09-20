<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
			선언문	: 변수 선언 O, 메소드 정의 O
					- _jspService( ) 외부에 변수 선언(전역변수)
			스크립틀릿	: 변수 선언 O, 메소드 정의 X
					- _jspService( ) 내부에 변수 선언(지역변수)
 	--%>
 
 	<%-- 선언문 --%>
 	<%-- 로딩 및 초기화 단계에서 선언문이 이루어 진다 --%>
 	<%!
 		int a = 100;
 	%>
 	
 	<%-- 스크립틀릿 --%>
	<%
		int a = 10;
		int b = 20;
		int c = 30;
		int sum = a + b + c;
	%>
	
	<%-- 
			출력시 스크립틀릿에 선언한 a의 값이 적용된다.
			jspServise() 에서 만들어져서 출력된다.
	 --%>
	 <%-- 표현식 --%>
	<%= a + b + c %>

</body>
</html>