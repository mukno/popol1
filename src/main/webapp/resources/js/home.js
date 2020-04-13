/**
 * 
 */
var $slideWrap=$(".slide_wrap"),
		$slideShow=$slideWrap .find(".slide_show"),
		$slideImg=$slideShow.find(".slide_img"),
		$slides=$slideImg.find(".slide"),
		$slideDot=$slideWrap.find(".slide_dot"),
		
		slideCount=$slides.length,
		currentIndex=0,
		dot="";
		timer="";
	
	//각 이미지 위치
	$slides.each(function(i){
		$(this).css({left:100*i+"%"});
		
		var name=$(this).find("img").attr("alt");
		console.log(name);
		
		
		dot +="<a href='#'></a>";
	});
	//이미지 갯수만큼 닷 표시
	$slideDot.html(dot);
	
	//이미지 움직이기
	function gotoSlide(index){
		$slideImg.animate({left:-100*index+"%"},300);
		currentIndex=index;
		update();
		
		
	}
	//닷 활성화 /비활성화
	function update(){
		
				
		//활성화 된 이미지 닷 활성화
		$slideDot.find("a").removeClass("active").eq(currentIndex).addClass("active");
		
		
		//활성화 된 이미지한테 클래스 추가하기
		$slides.removeClass("active").eq(currentIndex).addClass("active");
		
	}
	
	//타이머 설정하기
	function startTimer(){
		timer=setInterval(function(){
			var nextIndex=(currentIndex+1)%slideCount;
			gotoSlide(nextIndex);

		},5000);
	}
	
	startTimer();
	
	//마우스 오버하면 타이머 멈추기
	function stopTimer(){
		clearInterval(timer);
		
	}
	$slideWrap.on({
		mouseenter:stopTimer,
		mouseleave:startTimer
	})
	
	//닷 클릭시 이동
	$slideDot.on("click","a",function(e){
		e.preventDefault();
		if(!$(this).hasClass("active")){
			gotoSlide($(this).index());
			
		}
		
	});
	
	$(document).ready(function() {
		
		$(document).mouseup(function (e) {
			
			// 팝업 아이디

			var view = $(".view");

			if (!view.is(e.target) && view.has(e.target).length === 0){

			
				mark_x();

			}	

			});

		
	});
	
	
	
		 

	//첫번째 이미지 슬라이드 활성화
	gotoSlide(currentIndex);
	
	//x클릭시 로그인창 비활성화
	function mark_x(){

		$(".singin").css("opacity","0");
		$(".singin").css("pointer-events","none");
		$("body").removeClass("sign_body");
		
		
	}
	
	//로그인창 활성화
	function login_go(){
		
		
		$(".singin").css("opacity","1");
		$(".singin").css("pointer-events","auto");
		
		$("body").addClass("sign_body");
		
		
	}
	