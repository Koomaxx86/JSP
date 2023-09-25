<%@page import="cafe.dto.Order"%>
<%@page import="cafe.dao.OrderRepository"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
	<meta charset="UTF-8">
	<title>전체 사용자 주문 내역 목록 불러오기</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<%
		OrderRepository orderDAO = new OrderRepository();
		List<Order> orderList = orderDAO.list();
	%>
	<jsp:include page="/layout/admin_header.jsp" />
	<div class="container">
		<table class="table text-center">
  <thead>
    <tr class="color-black">
      <th scope="col">ORDER NUMBER</th>
      <th scope="col">MENU</th>
      <th scope="col">QUANTITY</th>
      <th scope="col">PHONE</th>
      <th scope="col">DATE</th>
      <th scope="col">TOTAL</th>
      <th scope="col">비고</th>
    </tr>
  </thead>
  <tbody  class="table-group-divider">
   
			<%
					int sum = 0;
				for(int i = 0 ; i < orderList.size() ; i++) {
					Order order = orderList.get(i);
					sum += Integer.parseInt(order.getOrderPrice());
			%>
				<tr>
					<td><%= order.getOrderNo() %></td>			
					<td><%= order.getOrderName()%></td>			
					<td><%= order.getOrderCnt()%></td>			
					<td><%= order.getUserTel() %></td>			
					<td><%= order.getOrderDate() %></td>			
					<td><%= order.getOrderPrice() %></td>			
					<td><a href="" class="btn btn-danger">삭제</a></td>			
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<%
					if( orderList.isEmpty() ) {
				%>
				<tr>
					<td colspan="7" class="text-center">발행된 쿠폰이 없습니다.</td>	
				</tr>
				<% } else { %>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>총 매출</td>
					<td><%= sum %></td>
					<td></td>
				</tr>
				<%
					}
				%>
			</tfoot>
		</table>

	
	
	
	
	
	</div>
	
	
	
	
	
	
	
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>