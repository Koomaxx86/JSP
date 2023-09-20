<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<%-- <%@ include file="경로"  외부 jsp 파일을 불러온다 --%>
	<%-- 유지 보수를 간편히 하기 위해 공통페이지를 include로 잡아준다. --%>
	<%-- 디렉티브 include. main에서 선언한 변수 사용가능 --%>
	<%@ include file="include01_header.jsp" %>
	
	<div class="container">
		<h1>컨텐츠 영역</h1>
	</div>
	
	<%@ include file="include01_footer.jsp" %>
</body>
</html>