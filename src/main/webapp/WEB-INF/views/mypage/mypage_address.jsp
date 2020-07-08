<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>김태욱 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
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
					<h3>주소록</h3>
					<div class="content_mypage">
						<div class="address">
							<div class="address_header">
								<p>주소</p>
							</div>
							<div class="address_content">
								<table>
								<c:forEach var="address" items="${address }" varStatus="status">
									<tr>
										<td class="address_num">${status.index+1}</td>
										<td class="address_name">${address.useradd }</td>
										<td class="address_delete">
										<c:if test="${address_count >1 }">
										<a href="/mypage/delete_addr/${address.add_num}"><i class="fas fa-trash-alt"></i></a>
										</c:if>
										</td>
									</tr>
									<input type="hidden" id="address_num" value="${address.add_num}"/>
								</c:forEach> 
									<tr>
										<td class="go_add_address" colspan="3">
											<a class="address_button" href="/mypage/mypage_add_address">새로운 주소 추가</a>
										</td>
									</tr>
								</table>
							</div>
							
						</div>
					
					
					
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