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