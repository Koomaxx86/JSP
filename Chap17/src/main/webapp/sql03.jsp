<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL - sql</title>
</head>
<body>
	<h1>상품 수정</h1>
	<form action="sql03_pro.jsp" method="post">
		
		<div>
			<label id="">상품 코드</label>
			<input type="text" name="productId">
		</div>
		
		<div>
			<label id="">상품명</label>
			<input type="text" name="name">
		</div>
		
		<div>
			<label id="">가격</label>
			<input type="number" name="unitPrice">
		</div>
		<div>
			<label id="">상세 정보</label>
			<textarea name="description"></textarea>
		</div>
		<div>
			<label id="">제조사</label>
			<input type="text" name="manufacturer">
		</div>
		<div>
			<label id="">분류</label>
			<input type="text" name="category">
		</div>
		<div>
			<label id="">재고 수</label>
			<input type="number" name="unitsInStock">
		</div>
		<div>
			<div>
				<label id="">상태</label>
			</div>
			<div>
				<div>
					<div>
						<input type="radio" name="codition" value="NEW" id="condition-new"> 
						<label for="condition-new">신규 제품</label>
					</div>
					
					<div>
						<input type="radio" name="codition" value="OLD" id="condition-old"> 
						<label for="condition-old">중고 제품</label>
					</div>
					
					<div>
						<input type="radio" name="codition" value="RE" id="condition-re"> 
						<label for="condition-re">재생 제품</label>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<input type="submit" value="수정" />
		</div>
	
	</form>
</body>
</html>