<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
							<tr>
								<td class="comment_one">
									<div>
										${comment.comment_id} 
										<font size="2" color="Lighgray">${comment.comment_date }</font>
									</div>
								
									<div class="content">
										${comment.comment_content }
									</div>
									<div class="fix">
										<a>[수정]</a>
										<a>[삭제]</a>
									</div>
								</td>
							
								
							</tr>


</body>
</html>