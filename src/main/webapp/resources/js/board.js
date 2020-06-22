/**
 * 
 */
function board_delete(bno){
	var check=confirm("해당 글을 삭제하시겠습니까? ");
	
	if(check==true){
		location.href="/board/board_delete?bno="+bno;
		
	}else if(check==false){
		location.href="/board/boardShow?bno="+bno;
		
	}
	
}


var actionForm=$("#actionForm");
$(".paging a").click(function(e){
	e.preventDefault();

	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
	
	

});