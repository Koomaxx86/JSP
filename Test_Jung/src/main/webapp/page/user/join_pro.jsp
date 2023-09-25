<%@page import="cafe.dao.UserRepository"%>
<%@page import="cafe.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	User user = new User();
	
	// 입력정보 join에서 받아옴
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	// user객체에 값 셋팅
	user.setUserId(id);
	user.setUserPW(pw);
	user.setUserName(name);
	user.setUserBirth(birth);
	user.setUserTel(tel);
	user.setUserAddress(address);
	
	// 회원 정보 등록 요청
	UserRepository userDAO = new UserRepository();
	int result = userDAO.insert(user);
	
	if( result > 0  ) {
		response.sendRedirect("complete.jsp?msg=1");		
	} else {
		response.sendRedirect("join.jsp");		
	}

%>








