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
				
				console.log("ok");
			}else{
				console.log("nk");
				
			}
			
			
		}
		
		
		
		
	})
	
	
	
}