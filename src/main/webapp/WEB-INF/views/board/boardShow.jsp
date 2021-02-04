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
<link rel="stylesheet" type="text/css" href="../css/comment.css">
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
							<th class="tablebutton" colspan="3" style="text-align: right; padding:7px;">
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
				
				
				<form id="boardShow_form">
						<input type="hidden" id="comment_board" value="${vo.bno }">
						<input type="hidden" id="last_comment_num" value="${last_comment_num }">
						<input type="hidden" id="userId" value="${loginUser.userId }">
						<input type="hidden" id="userName" value="${loginUser.userName }">
				</form>
				
				<div class="comment">
					<div class="comment_wrapper">
					
					<table class="comment_show">
						<tr>
							<td class="replyCnt" colspan="3" style="text-align: left;"><i class="fas fa-angle-down"></i> <a>코멘트</a>(${vo.replyCnt })</td>
						</tr>
						
						<c:if test="${vo.replyCnt > 0}">
							<c:forEach var="comment" items="${comment_list}">
									<c:choose>
										<c:when test="${comment.comment_child == 0 }">
											<tr>
											<td class="comment_one" id="comment_${comment.comment_num }">
												<div>
													${comment.comment_name} 
													<font size="2" color="Lighgray">(${comment.comment_date })</font> 
														<c:if test="${comment.comment_id eq loginUser.userId}">
															<a class="cursor_button" onclick="comment_delete(${comment.comment_num })"><i class='far fa-window-close'></i></a>
														</c:if>
												</div>
											
												<div class="content">
													${comment.comment_content }
												</div>
												<%if(session.getAttribute("loginUser")!=null){ %>
													<div class="fix">
														<a class="cursor_button" onclick="comment_comment(${comment.comment_num })">[답글]</a>
													</div>
												<%}else{ %>
													<div class="fix">
														<a class="cursor_button" onclick="login_go()">[답글]</a>
													</div>
												<%} %>
											</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
											<td class="comment_comment_one" id="comment_${comment.comment_num }">
												<div class="comment_c">
												<div class="comment_child_mark">
													<i class="fas fa-long-arrow-alt-right"></i>
												</div>
												<div class="comment_child_content">
													<div>
														${comment.comment_name} 
														<font size="2" color="Lighgray">(${comment.comment_date })</font> 
															<c:if test="${comment.comment_id eq loginUser.userId}">
																<a class="cursor_button" onclick="comment_delete(${comment.comment_num })"><i class='far fa-window-close'></i></a>
															</c:if>
													</div>
													<div class="content">
														${comment.comment_content }
													</div>
												</div>
												</div>
											</td>
											</tr>
										</c:otherwise>
									</c:choose>
							
							</c:forEach>
					
						</c:if>
					</table>
					
					<div class="comment_refresh cursor_button">
						<a onclick="refresh()"><i class="fas fa-sync-alt"></i>새로고침</a>
					</div>
					<%if(session.getAttribute("loginUser") != null){ %>
					<table class="comment_write">
						<tr>
							<td width="150">
								<div>
									${loginUser.userName }
								</div>
							</td>
							<td>
								<div>
									<textarea maxlength="256" id="comment_content" style="width: 99%; height:70px;"></textarea>
								</div>
							</td>
							<td width="150">
								<button class="comment_button" onclick="writeCnt(0)">
									등록
								</button>
							</td>
							
						</tr>
					</table>
					<%}else{ %>
					<table class="comment_write">
						<tr>
							<td width="20">
								<div>
									
								</div>
							</td>
							<td>
								<div>
									<textarea onclick="login_go()" maxlength="256" id="comment_content" style="width: 99%; height:70px;"></textarea>
								</div>
							</td>
							<td width="150">
								<button class="comment_button" onclick="login_go()">
									등록
								</button>
							</td>
							
						</tr>
					</table>
					<%} %>
					
					
				</div>
			</div>
			
			</div>
				
				
		</div>
	</div>
</div>	
	
<%@include file="../include/footer.jsp" %>	
	
<script type="text/javascript" src="../js/home.js"></script>
<script type="text/javascript" src="../js/comment.js"></script>
<script type="text/javascript" src="../js/board.js"></script>


</body>
</html>