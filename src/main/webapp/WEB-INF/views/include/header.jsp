<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>


	
			<div class="header">
				<div class="login">
					<%
						if(session.getAttribute("loginUser")==null){
					%>
							<span><a onclick="login_go()">주문조회</a></span>
					<%
						}else{
					%>
							<span><a href="/mypage/mypage_select">주문조회</a></span>
					<%
						}
					%>
					<span class="login_line">
					<%
						if(session.getAttribute("loginUser")==null){
					%>
							<a onclick="login_go()">로그인</a>
					<%
						}else{
					%>
							<a href="/logout">로그아웃</a>
					</span>
					<span class="login_line">
						<a>${loginUser.userName }님</a>
					<%
						}
					%>
					
					
					</span>


				</div>
				
				<div class="menu">
					<div class="mark_li">
					<a class="mark" href="/home"><img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/img/mcdelivery_logo_ko.jpg" alt="" /></a>
					</div>
					<div class="menu_list">
					<ul class="menu_un">
						<li class="menu_li">
							<a href="/menu/menu_recommend"><i class="fas fa-hamburger"></i>  메뉴</a>
						</li>
						<li class="menu_mypage">
							<%
								if(session.getAttribute("loginUser")==null){
							%>
								<a onclick="login_go()"><i class="fas fa-user"></i> 마이 페이지</a>
							<%}else{ %>
								<a href="/mypage/mypage_select"><i class="fas fa-user"></i> 마이 페이지</a>
							<%} %>
						</li>
						<li class="menu_etc">
							<a href="#"><i class="fas fa-headset"></i> 기타정보</a>
							<ul>
								<li><a href="#">ㅇㅇㅇㅇㅇ1</a></li>
								<li><a href="#">ㅇㅇㅇㅇㅇ2</a></li>
								<li><a href="#">ㅇㅇㅇㅇㅇ3</a></li>
								<li><a href="#">ㅇㅇㅇㅇㅇ4</a></li>
							</ul>
						</li>
						

						
					</ul>
					</div>

				</div>
			
			</div>

</body>
</html>