<%@page import="cafe.dto.Coupon"%>
<%@page import="cafe.dao.CouponRepository"%>
<%@page import="cafe.dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/layout/link.jsp" />
</head>
<body>
<%
	OrderRepository orderDAO = new OrderRepository();
	List<Order> orderList = orderDAO.list();
	int sum = 0;
	for(int i = 0 ; i < orderList.size() ; i++) {
		Order order = orderList.get(i);
		sum += Integer.parseInt(order.getOrderPrice());
	}
	CouponRepository couponDAO = new CouponRepository();
	List<Coupon> couponList = couponDAO.couponlist();
	int number = couponList.size();
	
%>
	<jsp:include page="/layout/admin_header.jsp" />
	
	
	<div class="container marketing">
		
		<div class="mt-300 d-flex align-items-center">
	      <div class="col-md-7 text-center" width="500" height="500">
	        <h1 class="featurette-heading fw-normal lh-100">이번달 총 매출액</h1>
	        <br>
	        <h2 class="featurette-heading fw-normal lh-100"><%=sum %>원</h2>
	      </div>
	      <div class="col-md-5">
	       <img alt="" src="" width="400" height="400" class="border-black">
	      </div>
		</div>

	<hr class="featurette-divider h-200">
		<div class="mt-300 d-flex align-items-center" style>
	      <div class="col-md-5">
			<img alt="" src="" width="400" height="400" class="border-black">
	      </div>
	      <div class="col-md-7 text-center" width="500" height="500">
	        <h1 class="featurette-heading fw-normal lh-100">총 쿠폰 발행 수</h1>
	        <br>
	        <h2 class="featurette-heading fw-normal lh-100"><%= number %>개</h2>
	      </div>
	      </div>
	</div>
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>