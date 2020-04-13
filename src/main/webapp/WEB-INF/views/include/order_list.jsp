<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<style>
.shop_item_left{
	float:left;
	padding:0 5px;
}

.shop_box{
	margin:10px 0;
	border-bottom:1px solid #eee;
	padding-bottom:10px;
}
.shop_item_header{
	margin-bottom:10px;
}

.shop_item_quantity{
	width:5%;
	font-size: 1.5rem;
	text-align: center;

}
.shop_item_number{
	width:23%;

}

.shop_item_number img{
	max-width: 100%;

}
.shop_item_name{
	font-size: 0.875rem;
}
.shop_item_modify{
	width:40%;
	text-align: center;
}
.shop_item_price{
	float:right;
	font-size: 1.25rem;
    color: #44900c;

}


</style>


</head>
<body>
<script type="text/javascript">



$(document).ready(function() {
	

	
});


 
</script>
<div class="order_list">
									<div class="order_list_wrapper">
										<div class="order_info">
											<h2>내 주문 정보</h2>
										</div>
										<div class="deliver_addr">
											<div class="title">
												배달 주소:
											</div>
											<div class="content">
												${loginUser.userAdd }

											</div>
											<div class="clear1"></div>
											
										</div>
										<div class="deliver_time">
											<div class="title">
												배달 시간:
											</div>
											<div class="content">
												<input class="otime" type="hidden" value="">
												예상 배달 시간:<br><p class="dtime"></p>

											</div>
											<div class="clear1"></div>
										    
										</div>
										<div class="order_count">
											<div class="title content_padding">
												총 주문합계:
											</div>
											<div class="content content_right">
												<c:choose>
													<c:when test="${empty shops }">
														0 원
													</c:when>
													<c:otherwise>
														<c:set var = "sum" value = "0" />

														<c:forEach var="shops" items="${shops }">
														
														<c:set var= "sum" value="${sum + shops.item_price }"/>
														</c:forEach>
														<c:out value="${sum }"></c:out>원
															
													</c:otherwise>
												</c:choose>
												
											</div>
											<div class="clear1"></div>
											<c:choose>
												<c:when test="${sum >0}">
													<button class="button2"  onclick="pay_go()">결제</button>
												</c:when>
												<c:otherwise>
													<p class="count_alarm">최소 주문 금액에서 ₩ 10,000 원이 부족합니다.</p>
													<button class="button1">결제</button>
												</c:otherwise>
											</c:choose>
											
											
											
										</div>
										<div class="order_detail">
											<p>주문 세부사항</p>
											<c:choose>
												<c:when test="${empty shops }">
													<h3>추가된 항목이 없습니다</h3>
												</c:when>
												<c:otherwise>
													<c:forEach var="shops" items="${shops }">
														<div class="shop_box">
															<div class="shop_item_header">
																<div class="shop_item_quantity shop_item_left">
																	${shops.item_amount }
																</div>
																<div class="shop_item_number shop_item_left">
																	<img src="../img/${shops.item_number }.png" alt="" />
																</div>
																<div class="shop_item_name shop_item_left">
																${shops.item_name}
																
																</div>
																<div class="clear1"></div>
															</div>
															<div class="shop_item_body">
																<div class="shop_item_modify shop_item_left">
																	<a href="/menu/shop_delete?item_turn=${shops.item_turn }">
																	
																		<i class="fas fa-trash-alt"></i>
																	</a>
															
																</div>
																<div class="shop_item_price">
																	${shops.item_price } 원
																</div>
																<div class="clear1"></div>
															</div>
														
														</div>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											
										
										</div>
										
										
									
									</div>
								
		
								</div>
								



</body>
<script>

</script>
</html>