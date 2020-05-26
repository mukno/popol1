<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="side_mypage">
					<div class="sidebar_mypage">
						<h2>마이 페이지</h2>
						<ul class="sidebar">
							<li><a href="/mypage/mypage_select"><span class="side_list_circle"></span>주문 조회</a></li>
							<li><a href="/mypage/mypage_order"><span class="side_list_circle"></span>주문 내역</a></li>
							<li><a href="/mypage/mypage_address"><span class="side_list_circle"></span>주소록</a></li>
							<li><a href="/mypage/mypage_change"><span class="side_list_circle"></span>비밀번호 변경</a></li>
							
						
						</ul>
						
						<form>
							<input type="hidden" class="page_num" value="${page_num }">
						</form>
					</div>
				</div>

</body>
</html>