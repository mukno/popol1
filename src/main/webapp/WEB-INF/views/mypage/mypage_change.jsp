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
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<link rel="stylesheet" type="text/css" href="../css/pay.css">
<script src="https://kit.fontawesome.com/f29e9424f2.js"></script>
</head>
<body>	
<%@include file="../include/sign.jsp" %>
<div class="pay">
	<div class="pay_modal">
		<div class="pay_modal_content">
			<p style="font-size:25px;">비밀번호 변경이 완료 되었습니다.</p>
			<button onclick="">확인</button>
		
		</div>
		
	
	</div>
	
</div>
		
<div class="wrapper">
	<div class="container">
	<%@include file="../include/header.jsp" %>
		<div class="wrapper_mypage">
			<%@include file="../include/mypage_side_menu.jsp" %>
			<div class="main_mypage">
				<h3>비밀번호 변경</h3>
				<p style="margin-bottom:20px;">비밀번호를 변경하시려면 기존 비밀번호와 변경하실 새로운 비밀번호를 아래에 입력해 주시기 바랍니다.</p>
				<div class="content_mypage">
					<div class="changeform">
						<form id="change_form">
							<p>* 기존 비밀번호:</p>
							<input type="password" name="userPw">
							<p>* 새로운 비밀번호:</p>
							<input type="password" id="new_userPw" name="new_userPw" maxlength="12">
							<p style="font-size:14px;color:#ddd;margin-left:12px;">
							비밀번호는 영문자, 숫자를 조합한 최소 6 글자 최대 12 글자이어야 합니다
							</p>
							<p>* 새로운 비밀번호 재입력:</p>
							<input type="password" id="check_new_userPw" name="check_new_userPw">
						</form>
							<button onclick="change_userPw()">비밀번호 저장</button>
					</div>
				
				</div>
				
			
			
			</div>
			<div class="clear1"></div>
			
		
		
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp" %>	

	
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/home.js"></script>
<script type="text/javascript" src="../js/mypage_side.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>




</body>
</html>