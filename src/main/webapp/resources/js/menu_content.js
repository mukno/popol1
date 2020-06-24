/**
 * 
 */

function Do_add(num){
	$(".shop").css("display","block");
	$(".wrapper").css("display","none");
	$(".footer").css("display","none");
	$("body").css("height","auto");
	
	$.ajax({
		
		url:'/menu/add',
		data:"num="+num,
		success:function(data){
			//actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				$(".item_img").find("img").attr("src","../img/"+data.item_Num+".png");
				$(".img-colum").find("img").attr("src","../img/"+data.item_Num+".png");
				$(".item_header_padding").find(".inner_text").html(data.item_Name);
				$(".item_number").attr("value",data.item_Num);
				
				
				$(".price").html(data.item_Price);
				$(".price2").html(data.item_Set_Price);
				$(".kcal-colum").html("<i class='fas fa-plug'></i>"+data.item_Kcal+"Kcal");
				
				if(data.item_categori!='1'){
					$(".two").css("display","none");
					
				}else{
					$(".two").find(".kcal-colum").html("<i class='fas fa-plug'></i>"+(parseInt(data.item_Kcal)+200)+"Kcal");
					
				}
				
				
			
		}
		
	});

	
};

function add_close(){
	$(".shop").css("display","none");
	$(".wrapper").css("display","block");
	$(".footer").css("display","block");
	$(".input-group").find("input").attr("value",0);
	$(".qunatity_num").html(0);
	$(".one").css("background-color","#f3f3f3");
	$(".two").css("background-color","#f3f3f3");
	$(".select-one").html('<p class="select-zero">아직 아무 메뉴도 선택하지 않으셨습니다.</p>');
	item_change(0);
	tot=0;
	

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
	
	
};
function minus(t){

	var t_b="."+t;
	var a=$(t_b).find("input").val();

		var x=parseInt(a);
		if(x>0){
		var y=x-1;
		
		$(t_b).find("input").attr("value",y);
		change_qunatity(-1);
		item_change(t,0);
		}
		if(y<1){
			$(t_b).css("background-color","#f3f3f3");
			
		}
		
}
function plus(t){

	var t_b="."+t;
	var a=$(t_b).find("input").val();

	var x=parseInt(a);
	if(x<10){
	var y=x+1;

	$(t_b).find("input").attr("value",y);
	change_qunatity(1);
	item_change(t,1);
	}
	
	if(y>=1){
		$(t_b).css("background-color","white");
		
	}
	
	
}
var tot=0;

function change_qunatity(amount){
	
	tot=tot+amount;
	$(".qunatity_num").html(tot);
	
}

function item_change(t,amount){
	var qunatity_num=$(".qunatity_num").html();
	var body=t;
	var input_num=$("."+body).find("input").val();
	
	var text="";
	
	
	if(body=='one'){
		
			if(amount==1){
			
			text+="<div class='amount_item single "+input_num+"'>";
			text+="단품";
			text+="</div>";
			
			$(".select-one").append(text);
			}else{
				input_num=parseInt(input_num)+1;
				$(".select-one").find(".amount_item.single."+input_num).remove();
				
			}
	}else{
		
		
					
			if(amount==1){
			
			text+="<div class='amount_item set "+input_num+"'>";
			text+="세트";
			text+="</div>";
			$(".select-one").append(text);
			
			}else{
				input_num=parseInt(input_num)+1;
				$(".select-one").find(".amount_item.set."+input_num).remove();
				
			}
	}
	
	if(qunatity_num==0){
		
		$(".select-one").html('<p class="select-zero">아직 아무 메뉴도 선택하지 않으셨습니다.</p>');
		$(".body_right").find("button").css("background-color","#00000075");
		$(".body_right").find("button").css("border-color","#00000075");
		$(".body_right").find("button").css("cursor","default");
		$(".body_right").find("button").attr("onclick","");
		
	}else{
		$(".select-zero").remove();
		$(".body_right").find("button").css("background-color","#d21920");
		$(".body_right").find("button").css("border-color","#bb161d");
		$(".body_right").find("button").css("cursor","pointer");
		$(".body_right").find("button").attr("onclick","add_shop()");
		
	}
	
	
}

function add_shop(){

	var uri=$("#uri").val();
	var item_number=$(".item_number").val();
	var item_amount=$(".one").find(".input-group").find("input").val();
	var item_set_amount=$(".two").find(".input-group").find("input").val();

	$.ajax({
		
		url:'/menu/shop_add',
		data:"item_number="+item_number+"&item_amount="+item_amount+"&item_set_amount="+item_set_amount,
		success:function(data){
			
			
			location.href=uri;
		}
		
	});
	
}



function pay_go(){
	
	$(".pay").css("display","block");

	$("body").addClass("sign_body");
	
	var deliver_address=$(".deliver_addr").find(".content").text();
	var deliver_time=$(".dtime").text();
	var order_time=$(".otime").val();
	
	
	$.ajax({
		
		url:'/menu/pay',
		data:"order_time="+order_time+"&deliver_time="+deliver_time+"&deliver_address="+deliver_address,
		success:function(data){
		
			
			
		}
		
	});
	
	
	
}



$(document).ready(function() {
	
	$(".pay").click(function (e) {
		
		// 팝업 아이디

		var pay_modal = $(".pay_modal");

		if (!pay_modal.has(e.target).length){

		
			pay_exit();
			
		}	

		});
	

	
	
	// 시간을 딜레이 없이 나타내기위한 선 실행
	
	realTimer();
	
	
	
	// 이후 0.5초에 한번씩 시간을 갱신한다.
	
	setInterval(realTimer, 10000);
	
});

function realTimer(){
	

	$.ajax({
		
		url:'/menu/time',
		type:'GET',
		dataType:"json",
		success:function(data){
			
			$(".dtime").html(data.deliver_time);
			$(".otime").attr("value",data.order_time);
			
			
			
		}
		
	});

}	

function pay_exit(){

	$(".pay").css("display","none");
	$("body").removeClass("sign_body");

	var uri=$("#uri").val();
	
	location.href=uri;
	
}


