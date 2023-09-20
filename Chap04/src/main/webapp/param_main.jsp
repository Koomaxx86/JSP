<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>param 액션 태그</h1>
	<h3>페이지를 이동하면서 파라미터 전달하기</h3>
	
	<%-- 외부 jsp파일 호출(액션태그) --%>
	<jsp:forward page="param_detail.jsp">
	<%-- param태그를 통해 매개변수와 값을 저장 --%>
		<jsp:param value="aloha" name="id"/>
		<jsp:param value="20" name="age"/>
		</jsp:forward>
		
</body>
</html>