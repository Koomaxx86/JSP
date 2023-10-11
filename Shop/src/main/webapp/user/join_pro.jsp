<!-- 
	회원 가입 처리
 -->
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	User user = new User(); // 유저 객체 생성

	// 전달받은 데이터에서 유저정보 저장
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw_confirm = request.getParameter("pw_confirm");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("month");
	String birth = year + "/" + month + "/" + day;
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	// 저장된 유저 정보를 User에 저장
	user.setId(id);
	user.setPassword(pw);
	user.setName(name);
	user.setGender(gender);
	user.setBirth(birth);
	user.setMail(email);
	user.setPhone(phone);
	user.setAddress(address);
	
	// UserRepository를 통해 db에 저장
	UserRepository userDAO = new UserRepository();
	int result = userDAO.insert(user);
	
	// 반환값이 확인 후 페이지 이동
	if( result > 0 ) {
		response.sendRedirect("complete.jsp?msg=1");
	} else {
		response.sendRedirect("join.jsp");
	}
%>
    
    

    
    
    
    
    
    