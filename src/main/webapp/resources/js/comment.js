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
	var userId=$("#userId").val();
	
	
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
				comment_show+="<td class='comment_one' id='comment_"+val.comment_num+"'>";
				comment_show+="<div>";
				comment_show+=val.comment_name;
				comment_show+="<font size='2' color='Lighgray'>("+val.comment_date+")</font> ";
				if(val.comment_id==userId){
					comment_show+="<a class='cursor_button' onclick='comment_delete("+val.comment_num+")'><i class='far fa-window-close'></i></a>";
				}
				comment_show+="</div>";
				comment_show+="<div class='content'>";
				comment_show+=val.comment_content;
				comment_show+="</div>";
				comment_show+="<div class='fix'>";
				comment_show+="<a class='cursor_button' onclick='comment_comment("+val.comment_num+")'>[답글]</a>";
				comment_show+="</div>";
				comment_show+="</td>";
				comment_show+="</tr>";
				});
				
			}
			
			$(".comment_show").html(comment_show);
			
			
			
		}
		
		
	})

	

}

function comment_delete(comment_num){
	
	var comment_board=$("#comment_board").val();
	var check=confirm("해당 댓글을 삭제하시겠습니까? ");
	
	if(check==true){
		$.ajax({
			url:"/board/comment_Delete",
			data:"comment_num="+comment_num+"&comment_board="+comment_board,
			success:function(data){
					if(data==1){
						refresh();
						
					}
				
				}
				
				
		})
	}
	
}

var comment_comment_state=1;
function comment_comment(comment_num){
	
	var userName=$("#userName").val();
	var comment=$("#comment_"+comment_num);
	var comment_write="";
	comment_write+="<table class='comment_write' id='comment_write_"+comment_num+"'>"
	comment_write+="<td width='150'>";
	comment_write+="<div>";
	comment_write+=userName;
	comment_write+="</div>";
	comment_write+="</td>";
	comment_write+="<td>";
	comment_write+="<div>";
	comment_write+="<textarea maxlength='256' id='comment_content' style='width: 99%; height:70px;'></textarea>";
	comment_write+="</div>";
	comment_write+="</td>";
	comment_write+="<td width='150'>";
	comment_write+="<button class='comment_button' onclick='writeCnt()'>";
	comment_write+="등록";
	comment_write+="</button>";
	comment_write+="</td>";
	comment_write+="</tr>";
	comment_write+="</table>";
		
	
	if(comment_comment_state==1){
		$(".comment_write").css("display","none");
		comment_comment_state=comment_num;
		comment.append(comment_write);
	}else if(comment_comment_state==comment_num){
		$(".comment_write").css("display","table");
		comment_comment_state=1;
		var comment=$("#comment_write_"+comment_num);
		comment.remove();
	}else{
		var comment=$("#comment_write_"+comment_comment_state);
		comment.remove();
		comment_comment_state=comment_num;
		var comment=$("#comment_"+comment_num);
		comment.append(comment_write);
		
	}
		
	
			
			
		
		
	

	
	
}



