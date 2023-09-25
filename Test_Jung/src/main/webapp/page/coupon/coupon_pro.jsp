<!-- 쿠폰 사용하기 기능 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> 
<%@ page import="cafe.dao.AdminRepository"%>
<%@ page import="cafe.dto.Admin" %>
 
 <%
	// 쿠폰 발행
 	AdminRepository couponDAO = new AdminRepository();

 	String couponCount = request.getParameter("couponCount"); // coupon.jsp에서 가져오는 정보
 	int count = Integer.parseInt(couponCount);
 	
 	for(int i=0; i < count; i++){
	 	int couponNo = Integer.parseInt(request.getParameter("couponNo"));
	 	int userNo = Integer.parseInt(request.getParameter("userNo"));
	 	String couponName = "아메리카노(HOT/ICE) 1잔 무료 교환 쿠폰";
	 	String couponDate = request.getParameter("couponDate");
	 	String couponImg = "C:\\Users\\Sophie\\git\\CodeInLatte\\CodeInLatte\\src\\main\\webapp\\static\\img\\coffee.jpg";
	 	int couponCheck = 0; // 미사용
				
	 	Admin coupon = new Admin();
	 	coupon.setCouponNo(couponNo);
	 	coupon.setUserNo(userNo);
	 	coupon.setCouponName(couponName);
	 	coupon.setCouponDate(couponDate);
	 	coupon.setCouponImg(couponImg);
	 	coupon.setCouponCheck(couponCheck);

		int result = couponDAO.generate(coupon);		// 쿠폰 데이터 등록
 	}
%>


	

 

 
 