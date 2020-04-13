<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>김태욱 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/f29e9424f2.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<link rel="stylesheet" type="text/css" href="../css/mypage_side.css">
<style>

</style>

</head>
<body>	
<%@include file="../include/sign.jsp" %>
<div class="wrapper">
		<div class="container">
<%@include file="../include/header.jsp" %>
			<div class="wrapper_mypage">
				<%@include file="../include/mypage_side_menu.jsp" %>					
				<div class="main_mypage">
					<h3>주문 조회</h3>
					<div class="content_mypage">
					<table>
						<c:forEach var="recode" items="${recode}" >
							<tr class="recode_one">
								<td>주문번호:<br><p>${recode.order_count}</p></td>
								<td>예상 배달 시간<br><p>${recode.deliver_time}</p></td>
								<td><p>주문 접수<br><i class="fas fa-phone-volume"></i></p></td>
								<td><p>준비중<br><i class="fas fa-hamburger"></i></p></td>
								<td><p>배달중<br><i class="fas fa-truck"></i></p></td>
								<td><p>배달완료<br><i class="fas fa-home"></i></p></td>
							</tr>
						</c:forEach>
					</table>
						
					
					
					
					
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