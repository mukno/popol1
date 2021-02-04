var myApp = angular.module("myApp", []);
myApp.controller("RegisterCtrl", function ($scope) {

});

var register_alert=$(".register_alert");
function register_go(){
	var password=$("#password");
	var first_name=$("#first-name");
	var last_name=$("#last-name");
	var roadAddrPart1=$("#roadAddrPart1");
	var addrDetail=$("#addrDetail");
	
	
	if(first_name.val()==""||first_name.val()==null){
		register_alert.find("p").html("아이디를 입력하세요.");
		register_alert.css("display","block");
		first_name.focus();
		return false;
	}
	
	if(password.val()==""||password.val()==null){
		register_alert.find("p").html("비밀번호를 입력하세요.");
		register_alert.css("display","block");
		password.focus();
		return false;
	}
	
	$.ajax({
		url:"/userIdCheck",
		data:"userId="+first_name.val(),
		success:function(data){
			if(data==1){
				
				register_alert.find("p").html("아이디가 중복입니다.");
				register_alert.css("display","block");
				first_name.focus();
				
			}else if(change_userPw()){
					
				//유효성 검사
					
					if(last_name.val()==""||last_name.val()==null){
						register_alert.find("p").html("닉네임을 입력하세요.");
						register_alert.css("display","block");
						last_name.focus();
						return false;
					}
					if(roadAddrPart1.val()==""||roadAddrPart1.val()==null){
						register_alert.find("p").html("주소를 입력하세요.");
						register_alert.css("display","block");
						roadAddrPart1.focus();
						return false;
					}
					if(addrDetail.val()==""||addrDetail.val()==null){
						register_alert.find("p").html("상세 주소를 입력하세요.");
						register_alert.css("display","block");
						addrDetail.focus();
						return false;
						
					}

					
						var userAdd=roadAddrPart1.val()+" "+addrDetail.val();
						$("#userAdd").attr("value",userAdd);
						
						$("#register").action="/register";
						$("#register").submit();
						
					
					
					
				}
			}
			
						
		
	})
		
	
	
	
	}
	

function change_userPw(){
	var password=$("#password");
	//비밀번호 검증
	if(password_check(password.val())){
		register_alert.find("p").html("비밀번호는 영문자, 숫자를 조합한 최소 6 글자 최대 12 글자이어야 합니다.");
		register_alert.css("display","block");
		password.focus();
		return false;
	}else{
		return true;
	}
}

function password_check(pwd){
	var regPwd=/(?=.*[A-Za-z])(?=.*\d).{6,12}$/;
	if(!regPwd.test(pwd)){//비밀번호가 틀리면 true보냄 맞으면 false
		return true;
	}
	
	
}




