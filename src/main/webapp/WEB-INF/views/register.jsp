<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/mypage/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		var addpart=roadAddrPart1+" "+roadAddrPart2;
		//document.form.roadAddrPart1.value = addpart;
		$("label[for='roadAddrPart1']").focus();
		$("#roadAddrPart1").attr("value",addpart);
		//document.form.addrDetail.value = addrDetail;
		$("#addrDetail").attr("value",addrDetail);
		
		if(addrDetail!=null){
			setTimeout(function() {
				
				$("label[for='addrDetail']").focus();
			}, 100);
		}
}

</script>

  <meta charset="UTF-8">
  <title></title>
  <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'><link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<!-- partial:index.partial.html -->
<body ng-controller="RegisterCtrl" ng-app="myApp">
 <div class="container">
   <div id="signup">
      <div class="signup-screen">
         <div class="space-bot text-center">
            <h1>Sign up</h1>
           <div class="divider"></div>
         </div>
           <form class="form-register" method="post" name="register" id="register" novalidate>
	            <div class="input-field col s6">
              <input id="first-name" name="userId" type="text" class="validate" required>
              <label for="first-name">아이디</label>
            </div>
            <div class="input-field col s6">
               <input id="password" type="password" name="userPw" ng-model="password" ng-minlength='6'  class="validate" required>
               <label for="password">비밀번호</label>
	             
              </div>
             <div class="input-field col s6">
             <input id="last-name" type="text" name="userName" class="validate" required>
              <label for="last-name">닉네임</label>
             </div>
             <div id="form">
	             <input type="button" onClick="goPopup();" value="주소 찾기"/>
		             <div class="input-field col s6">
		               <input id="roadAddrPart1" type="text" name="roadAddrPart1" class="validate" required>
		               <label for="roadAddrPart1">주소</label>
		              </div>
					  <div class="input-field col s6">
		               <input id="addrDetail" type="text" name="addrDetail" class="validate" required>
		               <label for="addrDetail">상세 주소</label>
		              </div>     
		              <input type="hidden" id="userAdd" name="userAdd" value="">         
              </div>
              <div class="register_alert">
               <p class="alert alert-danger">비밀번호는 최소 6글자 이상해야합니다.</p>
              </div>
              <div class="space-top text-center">
              
               <button onclick="register_go()"   class="waves-effect waves-light btn done">
               <i class="material-icons left">done</i> Done
               </button>
               
               <button type="button" class="waves-effect waves-light btn cancel">
               <i class="material-icons left">clear</i>Cancel
               </button>
              </div>
             </form>
             
           </div>
        </div>
    </div>
<!-- partial -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
  <script src='https://code.jquery.com/jquery-2.1.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js'></script><script  src="js/script.js"></script>

</body>
</html>
