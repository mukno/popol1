<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String basicURL=request.getRequestURI();

%>

<!DOCTYPE html>
<html>
<head>

</head>
<body>

<div class="singin">
		<div class="view">
			<div class="view_content">
				<div class="mark_exit">
					<a href="#" onclick="mark_x()"><i class="fas fa-times"></i></a>
					
				</div>
			
				<div class="mark_li">
					<a class="mark" href="#"><img src="https://www.mcdelivery.co.kr/kr/static/1575943212598/assets/82/img/mcdelivery_logo_ko.jpg" alt="" /></a>
				</div>
			
				<div class="login_header">
						<h2>주문을 하시려면 로그인하시기 바랍니다.</h2>	
						
				</div>
				
				<div class="login_body">
					<form action="../home" method="post">
									<input type="hidden" name="basicURL" value="<%=basicURL %>"/>
								<div class="login_box">
									<input type="text" name="userId" placeholder="아이디"/>
								
								</div>
								<div class="login_box">
									<input type="password" name="userPw" placeholder="비밀번호" />
								</div>
								<div class="login_etc">
									<button type="submit">로그인</button>
									<p class="etc_pwd"><a href="">비밀번호 찾기</a></p>
									<p><a href="">신규 회원<br>주문하기</a></p>
									
								</div>
								
							</form>
							
				</div>
				
				
						
					
					
			</div>	
		
		</div>
	
	</div>
	
</body>
</html>