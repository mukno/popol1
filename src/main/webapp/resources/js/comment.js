/**
 * 
 */

function writeCnt(){
	var comment_board=$("#comment_board").val();
	var comment_content=$("#comment_content").val();
	
	
	
	$.ajax({
		url:"/board/commentAction",
		data:"comment_content="+comment_content+"&comment_board="+comment_board,
		success:function(data){
			
			if(data==1){
				
				$("#comment_content").val("");
				refresh();
			}else{
				alert("에러입니다.");
				
			}
			
			
		}
		
		
		
		
	})
	
	
	
}

function refresh(){
	
	var comment_show="";
	comment_show+="<tr>";
	comment_show+="<td class='replyCnt' colspan='3' style='text-align: left;'><i class='fas fa-angle-down'></i> <a>코멘트</a>(${vo.replyCnt })</td>";
	comment_show+="</tr>";
	comment_show+="<c:if test='${vo.replyCnt > 0}'>";
	comment_show+="<c:forEach var='comment' items='${comment_list}'>";
	comment_show+="<%@include file='../include/comment.jsp' %>";
	comment_show+="</c:forEach>";
	comment_show+="</c:if>";
	$(".comment_show").html(comment_show);
	

}


