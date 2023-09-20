<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// EncodingFilter 에서 공통으로 처리됨
	// request.getCharacterEncoding("UTF-8");

	// 쿠키에 주문 정보를 저장
	Cookie cartId = new Cookie("ship_cartId", URLEncoder.encode(request.getParameter("cartId"), "UTF-8"));
	Cookie name = new Cookie("ship_name", URLEncoder.encode(request.getParameter("name"), "UTF-8"));
	Cookie date = new Cookie("ship_date", URLEncoder.encode(request.getParameter("shippingDate"), "UTF-8"));
	Cookie country = new Cookie("ship_country", URLEncoder.encode(request.getParameter("country"), "UTF-8"));
	Cookie zipCode = new Cookie("ship_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "UTF-8"));
	Cookie addressName = new Cookie("ship_addressName", URLEncoder.encode(request.getParameter("addressName"), "UTF-8"));
	
	int time = 24 * 60 * 60;
	cartId.setMaxAge(time);
	name.setMaxAge(time);
	date.setMaxAge(time);
	country.setMaxAge(time);
	zipCode.setMaxAge(time);
	addressName.setMaxAge(time);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(date);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("order.jsp");
%>




