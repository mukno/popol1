
$(function(){
	//submit 버튼이 실행되면
	
	$("join").submit(function(e){
		
		e.preventDefault();

	//사용자가 입력한 값 가져오기
	//userid,userpw,confirmpwd,gender,email.mobile
	
	var userid=$("#userid").val();
	var userpw=$("#userpw").val();
	
	
	//아이디 영대소문자,숫자 특수문자가 포함된 6~12
	var regId=/(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*]).{6,12}/;
	if(!regId.test(userid)){
		alert("아이디는 영대소문자 숫자 특수문자 로 만들어야합니다.");
		$("#userid").focus();
		return false;
	}
	
	//비밀번호 검증
	if(password_check(userpw)){
		$("#userpw").focus();
		return false;
	}
	
	//userpw != confirmpwd
	//경고창 띄우고 돌아감
	if(userpw!=confirmpwd){
		$("#userpw").focus();
		
		return false;
	}
	//confirmpwd도 패턴규칙이 맞는지 확인
	if(password_check(confirmpwd)){
		$('#confirmpwd').focus();
		return false;
	}
	
	
	//성별
	var n=$("input[name='gender']:checked").lenght;
	if(n==0){
		alert("성별을 확인해주세요");
		$("#gender_m").prop("checked",true);
		return false;
	}
	
	//이메일
	var regEmail=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if(!regEmail.test(email)){
		alert("이메일은 ㅁㄴㅇㄹ");
		$('#email').focus();
		return false;
	}
	
	//핸드폰 번호
	var regMobile=/\d{3}\d{4}\d{4}/;
	if(!regMobile.test(mobile)){
		alert("핸드폰");
		$('#mobile').focus();
		return false;
	}
	
	

})
	function password_check(pwd){
		var regPwd=/(\w).{8,15}$/;
		if(!regPwd.test(pwd)){
			alert("비밀번호는 숫자와 영문자로 만들어야합니다.");
			return true;
		}
		
		
	}
})