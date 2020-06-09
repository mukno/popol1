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
	
	var comment_board=$("#comment_board").val();
	
	$.ajax({
		
		url:"/board/refreshAction",
		data:"comment_board="+comment_board,
		dataType:"json",
		success:function(data){
			var comment_show="";
			comment_show+="<tr>";
			comment_show+="<td class='replyCnt' colspan='3' style='text-align: left;'><i class='fas fa-angle-down'></i> <a>코멘트</a>("+Object.keys(data).length+")</td>";
			comment_show+="</tr>";
			
			
			if(Object.keys(data).length>0){
				$.each(data, function(idx, val){
				comment_show+="<tr>";
				comment_show+="<td class='comment_one'>";
				comment_show+="<div>";
				comment_show+=val.comment_name;
				comment_show+="<font size='2' color='Lighgray'>("+val.comment_date+")</font> <i class='far fa-window-close'></i>";
				comment_show+="</div>";
				comment_show+="<div class='content'>";
				comment_show+=val.comment_content;
				comment_show+="</div>";
				comment_show+="<div class='fix'>";
				comment_show+="<a>[답글]</a>";
				comment_show+="</div>";
				comment_show+="</td>";
				comment_show+="</tr>";
				});
				
			}
			
			$(".comment_show").html(comment_show);
			
			
			console.log(data);
			
		}
		
		
	})

	

}


