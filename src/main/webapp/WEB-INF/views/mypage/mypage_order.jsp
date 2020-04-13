<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>김태욱 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/mypage_side.css">
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<script src="https://kit.fontawesome.com/f29e9424f2.js"></script>
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
					<h3>주문 내역</h3>
					<div>
					
					<c:forEach var="recode" items="${recode}" varStatus="status" >
						
						<div class="recode">
							<div class="recode_header" id="header_${status.index }"><!-- <i class="fas fa-chevron-down"></i> -->
								<div class="recode_open"><button class="blind" onclick="blind_open(${status.index})"><i class="fas fa-chevron-down"></i></button></div>
								<div class="recode_order_time"><p>주문 일자: ${recode.order_time }</p></div>
								<div class="clear"></div>
							</div>
							<div class="recode_content close" id="content_${status.index }">
								<div class="recode_detail">
									
									<div class="recode_detail_content">
										<div class="content">
											주문 번호:<br><p>${recode.order_count }</p>
													
										</div>
										<div class="clear1"></div>
									    
									</div>
									<div class="recode_detail_content">
										<div class="content">
											배달 시간:<br><p>${recode.deliver_time }</p>

										</div>
										<div class="clear1"></div>
									    
									</div>
									<div class="recode_detail_content">
										<div class="content">
											주소:<br><p>${recode.deliver_address }</p>

										</div>
										<div class="clear1"></div>
									    
									</div>
								</div>
								<div class="recode_items">
									<div class="recode_item_content">
										<c:set var="sum" value="0"/>
										<c:forEach var="recode_item" items="${recode_item[status.index] }">
											<div class="recode_item">
												<div class="recode_item_amount">${recode_item.item_amount }</div>
												<div class="recode_item_number"><img src="../img/${recode_item.item_number }.png" alt="" /></div>
												<div class="recode_item_name">${recode_item.item_name }</div>
												<div class="clear"></div>
												
											</div>
											<c:set var="sum" value="${sum+recode_item.item_price }"/>
										
										</c:forEach>
										
									</div>
								
								
								</div>
								<div class="recode_items_sum">
									총 주문합계:<br>
									<p><c:out value="${sum }"/> 원</p>
								
											
								</div>
								<div class="clear"></div>
							
							</div>
						</div>
					</c:forEach>
					
					
					
					
					</div>
					
				
				
				</div>
				<div class="clear1"></div>
				
			
			
			</div>
		</div>
	</div>
		
<%@include file="../include/footer.jsp" %>	
<script type="text/javascript" src="../js/mypage_side.js"></script>
	
<script type="text/javascript" src="../js/home.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>




</body>
</html>