<%@page import="com.spring.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		document.form.zipNo.value = zipNo;
		var addpart=roadAddrPart1+" "+roadAddrPart2;
		document.form.roadAddrPart1.value = addpart;
		document.form.addrDetail.value = addrDetail;

}

</script>
<title>김태욱 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/home.css">
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<link rel="stylesheet" type="text/css" href="../css/mypage_side.css">
<script src="https://kit.fontawesome.com/f29e9424f2.js"></script>
</head>
<body>	
<%@include file="../include/sign.jsp" %>
<div class="wrapper">
		<div class="container">
<%@include file="../include/header.jsp" %>
			<div class="wrapper_mypage">
				<%@include file="../include/mypage_side_menu.jsp" %>
				<div class="main_mypage">
					<h3>주소록</h3>
					<div class="content_mypage">
						<div class="address">
							<div class="address_header">
								<p>새로운 주소 추가</p>
							</div>
							<div class="address_content">
								<p>주소 정보</p>
								<form name="form" id="form" method="post">
									
									<div id="list"></div>
									<div id="callBackDiv">
										<table>
											<tr><td>우편번호</td><td><input type="text"  style="width:300px;" id="zipNo"  name="zipNo" />  <input type="button" onClick="goPopup();" value="주소 찾기"/><br><h3 class="zipNo_check"></h3></td></tr>
											<tr><td>주소</td><td><input type="text"  style="width:378px;" id="roadAddrPart1"  name="roadAddrPart1" /><br><h3 class="roadAddrPart_check"></h3></td></tr>
											<tr><td></td><td><input type="text"  style="width:378px;" id="addrDetail"  name="addrDetail" /></td></tr>
										</table>
									</div>
								
								</form>
									<div class="add_address">
										<button class="address_button" onclick="add_address()" >주소록에 추가</button>
									</div>
								
								
							</div>
						
						
						</div>
					
					
					
					</div>
					
				
				
				</div>
				<div class="clear1"></div>
				
			
			
			</div>
		</div>
	</div>
		
<%@include file="../include/footer.jsp" %>	
	
<script type="text/javascript" src="../js/mypage_side.js"></script>
	
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript" src="../js/home.js"></script>
	


</body>
</html>