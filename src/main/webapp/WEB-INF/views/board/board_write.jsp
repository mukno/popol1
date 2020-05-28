<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script src="https://kit.fontawesome.com/f29e9424f2.js"></script>
</head>
<body>
<%@include file="../include/sign.jsp" %>
<div class="wrapper">
		<div class="container">
<%@include file="../include/header.jsp" %>
			<div class="wrapper_mypage">
			<div class="board">
				<table>
					<tr>
                        <th nowrap>제 목 : <input type="text" name="board_title" maxlength="50"></th>
					</tr>
					<tr>
						<td><textarea name="board_content" maxlength="2048" style="height:350px"></textarea></td>
					</tr>
					<tr>
						<th colspan="5" style="text-align: right; padding:7px;"><a href="/board/board_write"><i class="fas fa-pencil-alt"></i> 작성완료</a></th>
					</tr>
				
				</table>
			
			
			</div>
				
				
		</div>
	</div>
</div>	
		
<%@include file="../include/footer.jsp" %>	
	
	
<script type="text/javascript" src="../js/home.js"></script>


</body>
</html>