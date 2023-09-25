<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CodeInLatte 첫 화면(접속 모드 선택)</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<jsp:include page="/layout/header.jsp" />  
	 
	 <%
		String root = request.getContextPath();
	 %>
    <div class="container-fluid h-100"
    		style="height: 1000px;">
        
        <div class="row h-100 justify-content-center align-items-center">
            
            <div class="col-sm-12 text-center"> 
                
                <button class="btn" 
                style="background-color: #8B4513; color: white; margin: 20px;
                 		width: 250px; height: 200px; font-size: 40px;" 
                onclick="location.href='<%= root %>/page/start/login.jsp'">회원</button>
                
                <button class="btn" 
                style="background-color: #8B4513; color: white; margin: 20px;
                		width: 250px; height: 200px; font-size: 40px;" 
                onclick="location.href='<%= root %>/page/main/main_cat1.jsp'">비회원</button>
                
                <button class="btn" 
                style="background-color: #8B4513; color: white; margin: 20px;
                		width: 250px; height: 200px; font-size: 40px;" 
                onclick="location.href='<%= root %>/page/start/admin_login.jsp'">관리자</button>
            </div>
        </div>
    </div>
    
    <jsp:include page="/layout/footer.jsp" />
    <jsp:include page="/layout/script.jsp" /> 
</body>
</html>