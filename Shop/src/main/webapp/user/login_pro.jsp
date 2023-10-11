<!-- 로그인 처리 -->
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@page import="shop.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	UserRepository userDAO = new  UserRepository();
	User loginUser = userDAO.login(id, pw);
	
	// 로그인 실패
	if( loginUser == null ) { // UsrRepository에서 null 응답시 실행
		response.sendRedirect("login.jsp?error=0");		
		return;
	}
	
	// 로그인 성공
	// - 세션에 아이디 등록
	session.setAttribute("loginId", id);
	
	// id저장 체크시 
	// 입력받은 id를 rememberId에 저장
	String rememberId = request.getParameter("remember-id");
	// 자동로그인 체크시 전달받은 값을 rememberMe에 저장
	String rememberMe = request.getParameter("remember-me");		
	//
	Cookie cookieRememberId = new Cookie("rememberId", "" );
	Cookie cookieRememberMe = new Cookie("rememberMe", "" );
	Cookie cookieToken = new Cookie("token", "" );
	// 쿠키의 경로를 루트로 지정
	cookieRememberMe.setPath("/");
	cookieToken.setPath("/");
	// 쿠키의 유효시간 셋팅
	cookieRememberMe.setMaxAge(7*24*60*60);
	cookieToken.setMaxAge(7*24*60*60);
	Cookie cookieLoginId = new Cookie("loginId", "" );
	
	// 아이디 저장
	if( rememberId != null && rememberId.equals("on") ) {
		// 아이디 저장 - 쿠키 생성
		cookieRememberId.setValue(URLEncoder.encode( rememberId, "UTF-8"));
		cookieLoginId.setValue(URLEncoder.encode( id, "UTF-8"));
	} 
	else {
		// 아이디 저장 - 쿠키 삭제
		cookieRememberId.setMaxAge(0);
		cookieLoginId.setMaxAge(0);
	}
	
	// 자동 로그인
		if( rememberMe != null && rememberMe.equals("on") ) {
		String tokenValue = userDAO.refreshToken(id);
		// 자동 로그인 - 쿠키 생성
		cookieRememberMe.setValue(URLEncoder.encode( rememberMe, "UTF-8"));
		cookieToken.setValue(URLEncoder.encode( tokenValue, "UTF-8"));
	} else {
		// 자동 로그인 - 쿠키 삭제
		cookieRememberMe.setMaxAge(0);
		cookieToken.setMaxAge(0);
	}
	
	// 쿠키 전달
	response.addCookie(cookieRememberId);
	response.addCookie(cookieRememberMe);
	response.addCookie(cookieToken);
	response.addCookie(cookieLoginId);
	
	// 로그인 성공 페이지로 이동
	response.sendRedirect("complete.jsp?msg=0");		

%>





