/**
 * 
 */
var $sidebar=$(".sidebar");
var page_num=$(".page_num");



function change(num){
	$sidebar.find("li").eq(num).find("span").removeClass("side_list_circle").addClass("side_list_active_circle");
	$sidebar.find("li").eq(num).css("color","red");
}
$(document).ready(function() { 
	
	
	
		var $menu_mypage=$(".menu_mypage");
		$menu_mypage.find("a").css("color","#ffc423");
		$menu_mypage.find("i").css("color","#ffc423");
		change(page_num.val());
	

});
