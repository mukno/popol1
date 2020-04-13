<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>김태욱 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/mypage_side.css">
<script src="https://kit.fontawesome.com/f29e9424f2.js"></script>
</head>
<body>	
<%@include file="../include/sign.jsp" %>
<div class="wrapper">
		<div class="container">
<%@include file="../include/header.jsp" %>
			<div class="wrapper_mypage">
				<%@include file="../include/mypage_side_menu.jsp" %>
				<div class="main_mypage">
					<h3>계정 설정</h3>
					<div class="content_mypage">
					
					
					
					
					</div>
					
				
				
				</div>
				<div class="clear1"></div>
				
			
			
			</div>
		</div>
	</div>
		
<%@include file="../include/footer.jsp" %>	
	
<script type="text/javascript" src="../js/mypage_side.js"></script>
	
<script type="text/javascript" src="../js/home.js"></script>
	


</body>
</html>