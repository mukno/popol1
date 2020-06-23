<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
	String basic_uri=request.getRequestURI();
	String uri=basic_uri.substring(14,basic_uri.length()-4);
%>
</head>
<body>
<div class="main_menu">
				<div class="wrapper_menu">
					<%@include file="../include/side_menu.jsp" %>
					<form>
						<input type="hidden" id="uri" value="<%=uri%>"/>
					</form>
					<div class="wrapper_content_menu">
						<div class="content_header">
							<div>
								<a href="">메뉴</a>> 추천메뉴${loginResult }
							</div>
						
						</div>
						<div class="wrapper_content">
						 	<div>
								<div class="item_menu">
								
									<c:forEach var="items" items="${items }">
										<div class="item_root">
											<div class="item">
												<div class="item_body">
													<img src="../img/${items.item_Num }.png" alt="" />
													<h5>${items.item_Name }</h5>
												</div>
												<div class="item_footer">
													<div class="item_footer_wrapper">
														<div class="item_info">
															<div class="item_detail">
																<div class="item_cost">가격 ${items.item_Price }(원)</div>
																<div class="item_kcal">
																<i class="fas fa-plug"></i>
																${items.item_Kcal }Kcal</div>
															</div>
														</div>
														<div class="item_add">
															<button onclick="
															<%
																if(session.getAttribute("loginUser")!=null){
															%>
																	Do_add(${items.item_Num })
															<%
																}else{ 
															%>
																	login_go()
															<%
																} 
															%>
															">추가
															</button>
														</div>
														<div class="clear1"></div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									
									
								
								</div>
								<%
									if(session.getAttribute("loginUser")==null){
								%>
								<div class="img_menu">
									<img src="https://www.mcdelivery.co.kr/kr/static/1580199157743/assets/82/img/how_mcdelivery_works_portrait_ko.png" alt="" />
								</div>
								<%
									}else{
								%>
								<%@include file="../include/order_list.jsp" %>
								<%
									}
								%>
								<div class="clear1"></div>
							</div>
						
						</div>
						
						
					</div>
					<div class="clear1"></div>
				
				
				</div>
						 
				
			
			</div>

</body>
</html>