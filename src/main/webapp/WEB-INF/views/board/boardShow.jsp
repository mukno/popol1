<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<form action="/board/writeAction" method="post">
					<table>
						<tr class="boardShow_header">
	                        <th nowrap width="80">${vo.writer }</th>
	                        <th nowrap width="180">${vo.updatedate }</th>
	                        <th nowrap width="60">조회: ${vo.hits }</th>
						</tr>
						<tr>
							<td colspan="3" class="boardShow_title">
								${vo.title }
							</td>
						
						</tr>
						<tr>
							<td colspan="3" class="boardShow_content">
								${vo.board_content }
							</td>
							
						</tr>
						<tr>
							<th colspan="3" style="text-align: right; padding:7px;">
								<a href="/board/board_index"><i class="fas fa-pencil-alt"></i> 목록</a>
								
								<c:if test="${loginUser.userId eq vo.userId}">
									<a href="/board/board_update?bno=${vo.bno }"><i class="fas fa-pencil-alt"></i> 수정</a>
									<a onclick="board_delete(${vo.bno})"><i class="fas fa-pencil-alt"></i> 삭제</a>
								</c:if>
								
								<c:choose>
									<c:when test="${loginUser eq null }">
										<a onclick="login_go()"><i class="fas fa-pencil-alt"></i> 글쓰기</a>
									</c:when>
									<c:otherwise>
										<a href="/board/board_write"><i class="fas fa-pencil-alt"></i> 글쓰기</a>
									</c:otherwise>
								</c:choose>
							</th>
							
						
						</tr>
					</table>
				</form>
			
			
			</div>
				
				
		</div>
	</div>
</div>	
	
<%@include file="../include/footer.jsp" %>	
	
<script type="text/javascript" src="../js/home.js"></script>
<script type="text/javascript" src="../js/board.js"></script>


</body>
</html>