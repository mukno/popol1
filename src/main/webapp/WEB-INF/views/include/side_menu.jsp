<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<div class="side_menu">
						<ul class="side_main">
							<li class="side">
								<a href="" class="side_header">
									<span>일반 메뉴</span>
								</a>
								<ul class="side_list">
									<li><a href="/menu/menu_recommend"><span class="side_list_circle"></span>추천 메뉴</a></li>
									<li><a href="/menu/menu_hamburger"><span class="side_list_circle"></span>버거 & 세트</a></li>
									<li><a href="/menu/menu_snack"><span class="side_list_circle"></span>스낵 & 사이드</a></li>
									<li><a href="/menu/menu_drink"><span class="side_list_circle"></span>음료</a></li>
									<li><a href="/menu/menu_dessert"><span class="side_list_circle"></span>디저트</a></li>
									<li><a href=""><span class="side_list_circle"></span>해피밀</a></li>
									
								</ul>
							</li>
							<li class="side_etc">
								<span>아침 메뉴</span><h3>></h3>
							</li>
						</ul>
						<form>
							<input type="hidden" class="menu_num" value="${menu_num }">
						</form>
						
					
</div>


</body>
</html>