/**
 * 
 */


var $markActive=$(".side_list");
var menu_num=$(".menu_num");


$markActive.on("mouseover","li",function(){
		
	if($(this).index()!=menu_num.val()){
		change($(this).index());
	}
		
		
	
	});
	
$markActive.on("mouseout","li",function(){
	
	if($(this).index()!=menu_num.val()){
		dechange($(this).index());
	}
	
	
});


function change(index){
	$markActive.find("li").eq(index).find("span").removeClass("side_list_circle").addClass("mactive");
	$markActive.find("li").eq(index).find("a").css("color","#e71b23");
	
	
}
function dechange(index){
	$markActive.find("span").eq(index).removeClass("mactive").addClass("side_list_circle");
	$markActive.find("li").eq(index).find("a").css("color","#a25716");

	
}

	var $side_move=$(".side_menu");
	var $footer=$(".footer");
	
	$(window).scroll(function(event){
		
		//console.log($side_move.offset().top);
		//console.log($(document).scrollLeft());
		//console.log($(document).scrollTop());
		//console.log($(document).scrollTop());
		//console.log($(".wrapper_content_menu").offset().left);

		var height = $(document).scrollTop()+117;
			

		if($(document).scrollLeft()>0){
			$side_move.css("position","relative");
			$side_move.css("top",$(document).scrollTop()+"px");
			if($side_move.offset().top>$footer.offset().top-375){
				
				$side_move.removeClass("side_menu").addClass("side_menu_fixed");
		
			}
			if(height<$footer.offset().top-375){
				
				$side_move.removeClass("side_menu_fixed").addClass("side_menu");
			}
			return false;
		}else{
			$side_move.css("position","fixed");
			$side_move.css("top","auto");
			if($side_move.offset().top>$footer.offset().top-375){
				
				$side_move.removeClass("side_menu").addClass("side_menu_fixed");
		
			}
			if(height<$footer.offset().top-375){
				
				$side_move.removeClass("side_menu_fixed").addClass("side_menu");
			}
			
		}

		
		/* console.log($side_move.offset().top);
		console.log($footer.offset().top-345);
		console.log(height); */
		
		
		
	});
	
	
	$(document).ready(function() { 
		var $menu_li=$(".menu_li");
		$menu_li.find("a").css("color","#ffc423");
		$menu_li.find("i").css("color","#ffc423");
		change(menu_num.val());
		
		
		
	
	});
	
	



