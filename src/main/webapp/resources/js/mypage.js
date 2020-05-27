/**
 * 
 */

function blind_open(index){
	$header_index=$("#header_"+index);
	$content_index=$("#content_"+index);
	
	$header_index.find("i").attr("class","fas fa-chevron-up");
	$header_index.find("button").attr("onclick","blind_close("+index+")");
	$content_index.removeClass("close").addClass("open");
	
	
	
}
function blind_close(index){
	$header_index=$("#header_"+index);
	$content_index=$("#content_"+index);
	
	$header_index.find("i").attr("class","fas fa-chevron-down");
	$header_index.find("button").attr("onclick","blind_open("+index+")");
	$content_index.removeClass("open").addClass("close");
	
	
}

function change_userPw(){
	
	//사용자가 입력한 값 가져오기
	//userid,userpw,confirmpwd,gender,email.mobile
	
	var new_userPw=$("#new_userPw").val();
	var check_new_userPw=$("#check_new_userPw").val();
	
	//비밀번호 검증
	if(password_check(new_userPw)){
		$(".pay_modal_content").find("p").html("비밀번호는 영문자, 숫자를 조합한 최소 6 글자 최대 12 글자이어야 합니다");
		pay_go(3);
		return false;
	}
	
	//userpw != confirmpwd
	//경고창 띄우고 돌아감
	if(new_userPw!=check_new_userPw){
		$(".pay_modal_content").find("p").html("비밀번호가 일치하지않습니다 ");
		pay_go(4);
		return false;
	}
	//confirmpwd도 패턴규칙이 맞는지 확인
	if(password_check(check_new_userPw)){
		$('#check_new_userPw').focus();
		return false;
	}
	
	
	
	var form_data=$("#change_form").serialize();
	$.ajax({
		
		url:"/change_pwd",
		data:form_data,
		dataType:"html",
		success:function(data){
			if(data==1){
				$(".pay_modal_content").find("p").html("비밀번호 변경이 완료 되었습니다.");
				pay_go(1);
			}else if(data==2){
				$(".pay_modal_content").find("p").html("기존 비밀번호와 동일합니다 다른 비밀번호를 입력해주세요.");
				pay_go(2);
			}else{
				$(".pay_modal_content").find("p").html("기존 비밀번호가 틀립니다.");
				pay_go(0);
				
			}
			
		},error:function(request,status,error){
			$(".pay_modal_content").find("p").html("비밀번호 변경 에러입니다.");
			pay_go(0);
	       }

		
	});
	
	
}

function password_check(pwd){
	var regPwd=/(?=.*[A-Za-z])(?=.*\d).{6,12}$/;
	if(!regPwd.test(pwd)){
		console.log("222");
		return true;
	}
	
	
}



function pay_go(result){
	
	$(".pay").css("display","block");

	
	$("body").addClass("sign_body");
	
	$(".pay_modal_content").find("button").attr("onclick","pay_exit("+result+")");
	
	
	
}


$(document).ready(function() {
	
	$(".pay").click(function (e) {
		
		// 팝업 아이디

		var pay_modal = $(".pay_modal");

		if (!pay_modal.has(e.target).length){

		
			pay_exit();
			
		}	

		});
	


});



function pay_exit(result){

	$(".pay").css("display","none");
	$("body").removeClass("sign_body");
	
	if(result==1){
		
		location.href="/home";
	}else if(result==0){
		location.href="/home";
	}else if(result==2||result==3){
		$("#new_userPw").focus();
	}else if(result==4){
		$("#check_new_userPw").focus();
	}
	
	
}


function add_address(){
	

	var zipNo=$("#zipNo");
	var roadAddrPart1=$("#roadAddrPart1");
	var addrDetail=$("#addrDetail");
	var zipNo_check=$(".zipNo_check");
	var roadAddrPart_check=$(".roadAddrPart_check");
	
	if(zipNo.val()==""||zipNo.val()==null){
		zipNo_check.html("* 필수 입력항목입니다.");
		zipNo.focus();
		return false;
	}
	if(roadAddrPart1.val()==""||roadAddrPart1.val()==null){
		zipNo_check.html("");
		roadAddrPart_check.html("* 필수 입력항목입니다.");
		roadAddrPart1.focus();
		return false;
	}
	var roadAdd=roadAddrPart1.val();
	var roadAdd2=addrDetail.val();
	
	console.log(roadAdd);
	console.log(roadAdd2);
	$.ajax({
		url:"/mypage/add_address",
		data:"roadAddrPart1="+roadAdd+"&addrDetail="+roadAdd2,
		dataType:"html",
		success:function(data){
			if(data==1){
				location.href="/home";
				
			}
			
		}
		
		
	});
	
	
	

	
	
	
}
