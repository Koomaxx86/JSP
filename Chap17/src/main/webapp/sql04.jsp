<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL - sql</title>
</head>
<body>
	<h1>상품 삭제</h1>
	<form action="sql04_pro.jsp" method="post">
		
		<div>
			<label id="">상품 코드</label>
			<input type="text" name="productId">
		</div>
		
		<div>
			<input type="submit" value="삭제" />
		</div>
	
	</form>
</body>
</html>