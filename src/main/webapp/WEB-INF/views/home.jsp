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
<link rel="stylesheet" type="text/css" href="css/home.css">
<script src="https://kit.fontawesome.com/f29e9424f2.js" crossorigin="anonymous"></script>
</head>
<body>	
<%@include file="./include/sign.jsp" %>
<div class="wrapper">
		<div class="container">
		<%@include file="./include/header.jsp" %>
			<div class="main">
				<div class="slide_wrap">
					<div class="slide_show">
						<div class="slide_img">
							<div class="slide">
								<img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/banners/landing_53581_WOS.jpg?WOS" alt="이미지1" />
							</div>
							<div class="slide">
								<img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/banners/landing_53630_WOS_B.jpg?WOS_B" alt="이미지2" />
							</div>
							<div class="slide">
								<img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/banners/landing_53615_WOS.jpg?WOS" alt="이미지3" />
							</div>
							<div class="slide">
								<img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/banners/landing_53464_WOS.jpg?WOS" alt="이미지4" />
							</div>
						</div>
						<div class="slide_dot"></div>
					</div>
					
					<div class="login_wrap">
					<%
						if(session.getAttribute("loginUser")==null){
					%>
						<div class="login_header">
							<h2>주문을 위해 로그인 해주세요</h2>	
						
						</div>
						
						<div class="login_body">
							<form action="home" method="post" name="login_form">
								<div class="login_box">
									<input type="text" name="userId" placeholder="아이디" onkeypress="javascript:login_press(this.form)"/>
								
								</div>
								<div class="login_box">
									<input type="password" name="userPw" placeholder="비밀번호" onkeypress="javascript:login_press(this.form)"/>
								</div>
								<p class="result">${loginResult }</p>
								<div class="login_etc">
									<button type="submit" style="cursor:pointer;">로그인</button>
									<p class="etc_pwd"><a href="">회원가입</a></p>
									<p><a href="">신규 회원<br>주문하기</a></p>
									
								</div>
								
								
							
							
							</form>
						</div>
					<%
						}else{
					%>
						<div class="login_header">
								<h2>안녕하세요 ${loginUser.userName } 고객님</h2><br>
								<h2 style="font-size: 1.375rem;">다음의 주소로 배달됩니다:</h2>	
							
							</div>
							
							<div class="login_body">
								<form action="/menu/menu_recommend">
									<!-- <div class="login_box" style="margin-top:15px;margin-bottom:15px;">
										<input style="background-color:white;" type="text" value="${loginUser.userAdd }" disabled/>
										<select>
											<c:forEach var="addr" items="${address_List }">
												<option>${addr.useradd }</option>
											
											</c:forEach>
										
										</select>
									
									</div>
									 -->
									<div class="select-box select-script">
									    <label for="selectbox">${loginUser.userAdd }</label>
									    <select id="selectbox">
									        <option selected="selected">${loginUser.userAdd }</option>
									        <c:forEach var="addr" items="${address_List }">
												<option>${addr.useradd }</option>
											
											</c:forEach>
									    </select>
									</div>


									
									<div class="login_etc">
										<button type="submit" style="margin-top:15px;margin-bottom:15px;cursor:pointer;">새로 주문하기</button>
										
										<p style="margin-top:15px;"><a href="/mypage/mypage_select" >주문 조회</a></p>
										
									</div>
									
									
								
								
								</form>
							</div>
					
					<%
						}
					%>
					
					</div>
					
				</div>
				<div class="line">
				
				</div>
				<div class="map">
					<h1>맥딜리버리 이용 방법!</h1>
						<a href="/menu/menu_recommend"><img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/img/how_mcdelivery_works_ko.png" alt="" /></a>
				
				</div>
				
			
			</div>
		</div>
	</div>
		
<%@include file="./include/footer.jsp" %>	
	
	
<script type="text/javascript" src="js/home.js"></script>
	



</body>
</html>