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
				<table class="board_main">
					<tr>
						<th nowrap width="80">번 호</th>
                        <th nowrap>제 목</th>
                        <th nowrap width="140">글쓴이</th>
                        <th nowrap width="100">등록일</th>
                        <th nowrap width="120">조회</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.bno }</td>
							<td style="text-align: left; padding-left:70px;"><a href="/board/boardShow?bno=${list.bno }">${list.title } </a>
							<c:if test="${list.replyCnt > 0}">
								<a class="replyCnt">[${list.replyCnt }]</a>
							</c:if>
							</td>
							<td>${list.writer }</td>
							<td>${list.updatedate }</td>
							<td>${list.hits }</td>
						</tr>
					</c:forEach>
					<tr>
						<% if(session.getAttribute("loginUser")==null){ %>
							<th class="tablebutton" colspan="5" style="text-align: right; padding:7px;"><a onclick="login_go()"><i class="fas fa-pencil-alt"></i> 글쓰기</a></th>
						<%}else{ %>
							<th class="tablebutton" colspan="5" style="text-align: right; padding:7px;"><a href="/board/board_write"><i class="fas fa-pencil-alt"></i> 글쓰기</a></th>
						<%} %>
						
					</tr>
					<tr>
						<th colspan="3">
							<ul class="paging">
								<c:choose>
									<c:when test="${paging.prev }">
										<li>
											<a href="/board/board_index?pageNum=${paging.startPage-1 }"><i class="fas fa-angle-double-left truecolor"></i> 이전</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a><i class="fas fa-angle-double-left"></i> 이전</a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="page" begin="${paging.startPage}" end="${paging.endPage }">
									<c:choose>
										<c:when test="${paging.pageNum eq page}">
											<li>
		                           				<a class="nowPage" href="/board/board_index?pageNum=${page }">${page }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li>
		                           				<a href="/board/board_index?pageNum=${page }">${page }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${paging.next }">
										<li>
											<a href="/board/board_index?pageNum=${paging.endPage+1 }">다음 <i class="fas fa-angle-double-right truecolor"></i></a> 
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a>다음 <i class="fas fa-angle-double-right"></i></a> 
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</th>
						<th colspan="2" style="text-align: right;">제목검색</th>
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