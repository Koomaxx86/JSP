<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<jsp:include page="/layout/meta.jsp" /> 
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<% 
		String root = request.getContextPath();
		String error = request.getParameter("error");
		
		// 이미 로그인한 경우
		String loginId = (String) session.getAttribute("loginId");
		loginId = loginId != null ? loginId : "";
		
		if( loginId != null && !loginId.equals("") ) {
			response.sendRedirect(root + "/user/logged.jsp");
		}
		
		// 아이디 저장 쿠키 가져오기
		String rememberId = ""; 	// 변수 선언
		Cookie[] cookies = request.getCookies();	// 저장된 쿠키를 가져옴
		if( cookies != null ) { // 쿠키에 값이 있는지 확인
			for(int i = 0 ; i < cookies.length	 ; i++) { // 쿠키 전체 체크
				Cookie cookie = cookies[i]; // 쿠키의 값을 변수에 담기
				String cookieName = cookie.getName(); // 쿠키의 값중 이름을 가져온다
				// 특수문자 활용을 위해 쿠키의 값을 디코딩하여 변수에 저장
				String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
				switch(cookieName) { // 쿠키에서 해당되는 키워드의 값을 가져온다.
				 	case "loginId" 			: loginId = cookieValue;		break;
				 	case "rememberId" 		: rememberId = cookieValue;		break;
				}
			}
		}
		
	%>
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">로그인</h1>
	</div>
	
	<!-- 로그인 영역 -->
	<main class="form-signin login-box w-100 m-auto">
	  <form action="login_pro.jsp" method="post">
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="id" 
	      		 value="<%= loginId %>" placeholder="아이디" autofocus>
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name="pw" placeholder="비밀번호">
	      <label for="floatingPassword">비밀번호</label>
	    </div>
	
	    <div class="form-check text-start my-3 d-flex justify-content-around">
	    	<div class="item">
	    	  <%
	    	  	if( rememberId != null && rememberId.equals("on") ) {
	    	  %>
			      <input class="form-check-input" type="checkbox" name="remember-id" id="flexCheckDefault1"
			      		 checked>
			  <%
	    	  	} else {
	    	  %>  
			      <input class="form-check-input" type="checkbox" name="remember-id" id="flexCheckDefault1">
			  <% 
	    	  	}
	    	  %>	
		      <label class="form-check-label" for="flexCheckDefault1">아이디 저장</label>
	    	</div>
	    	<div class="item">
		      <input class="form-check-input" type="checkbox" name="remember-me" id="flexCheckDefault2">
		      <label class="form-check-label" for="flexCheckDefault2">자동 로그인</label>
	    	</div>
	      
	    </div>
	    <p class="text-center text-danger">
	    	<%
	    		if( error != null && error.equals("0") ) {
	    	%>
	    		아이디 또는 비밀번호를 잘못 입력했습니다.
	    	<%
	    		}
	    	%>
	    </p>
	    
	    <div class="d-grid gap-2">
		    <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
		    <a href="<%= root %>/user/join.jsp" class="btn btn-success w-100 py-2">회원가입</a>
	    </div>
	  </form>
	</main>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>








