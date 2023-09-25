<%@page import="cafe.dao.CouponRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.dao.CouponRepository"%>
<%@ page import="cafe.dto.Coupon"%> 
<%@ page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠폰 목록 불러오기</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/admin_header.jsp" />
	
	<%
		CouponRepository couponDAO = new CouponRepository();
		List<Coupon> couponList = couponDAO.couponlist();		
	%>

	<h3 class="text-center">쿠폰 목록</h3>
	<!-- 쿠폰 목록 -->
	<div class="container">
			<table class="table text-center">
			<thead>
				<tr class="color-black">
					<th scope="col">쿠폰번호</th>
					<th scope="col">쿠폰명</th>
					<th scope="col">쿠폰 발행일</th>
					<th scope="col">쿠폰 이미지</th>
					<th scope="col">회원번호</th>
					<th scope="col">쿠폰 사용 여부</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">

			<%
				for(int i = 0 ; i < couponList.size() ; i++) {
					Coupon coupon = couponList.get(i);
			%>
				<tr>
					<td><%= coupon.getCouponNo() %></td>			
					<td><%= coupon.getCouponName()%></td>			
					<td><%= coupon.getCouponDate() %></td>			
					<td><%= coupon.getCouponImg() %></td>			
					<td><%= coupon.getUserNo() %></td>			
					<td><%= coupon.getCouponCheck() %></td>			
					<td><a href="" class="btn btn-danger">삭제</a></td>			
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<%
					if( couponList.isEmpty() ) {
				%>
				<tr>
					<td colspan="6">발행된 쿠폰이 없습니다.</td>	
				</tr>
				<% } else { %>
				<tr>
					<td></td>
					<td></td>
					<td>총 발행된 쿠폰 수</td>
					<td><%= couponList.size() %></td>
					<td></td>
				</tr>
				<%
					}
				%>
			</tfoot>
		</table>
	</div>
	
	<!-- 버튼 영역 -->
	<div class="d-flex justify-content-between mt-5 mb-5">
		<div class="item">
			<a href="javascript: history.back()" class="btn btn-lg btn-success">이전</a>
		</div>  
	</div>
		
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>