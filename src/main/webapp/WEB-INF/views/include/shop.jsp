<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/pay.css">
</head>
<body>
<div class="shop">
	<div>
		<div class="shop_header">
			<div class="header_container">
				<div class="item_header">
					<input type="hidden" class="item_number" value="">
					<div class="quantity item_header_padding"><a class="qunatity_num">0</a><span>수량</span></div>
					<div class="item_img item_header_padding"><img src="" alt="" /></div>
					<div class="item_name item_header_padding"><h2 class="inner_text"></h2></div>
					<button class="close_button" onclick="add_close()"><i class="fas fa-times"></i></button>
					<div class="clear1"></div>
				</div>
			</div>
			
		</div>
		<div class="shop_body">
			<div class="shop_body_container">
				<div class="body_container">
					<div class="step_one">
						<table>
							<thead>
								<tr>
									
									<td class="head" colspan="3">1단계: 메뉴를 선택하세요</td>
									<td>가격</td>							
									<td>KCAL</td>							
								</tr>
							</thead>
							<tbody class="one">
								<tr>
									<td class="count-colum">
										<div class="input-group">
											<span>
												<button onclick="minus('one')"><i class="fas fa-minus"></i></button>
											</span>
											<input type="number" value="0"/>
											<span>
												<button onclick="plus('one')"><i class="fas fa-plus"></i></button>
											</span>
										</div>
									</td>
									<td class="img-colum"><img class="td_img"src="" alt="" /></td>
									<td><h4 class="inner_text">단품</h4></td>
									<td class="price-colum"><a class="price"></a>(원)</td>
									<td class="kcal-colum"></td>							
								</tr>
								
						
								
								<tbody class="two">
									<tr class="set_table">
										<td class="count-colum">
											<div class="input-group">
												<span>
													<button onclick="minus('two')"><i class="fas fa-minus"></i></button>
												</span>
												<input type="number" value="0"/>
												<span>
													<button onclick="plus('two')"><i class="fas fa-plus"></i></button>
												</span>
											</div>
										</td>
										<td class="img-colum"><img class="td_img"src="" alt="" /></td>
										<td><h4 class="inner_text">세트</h4></td>
										<td class="price-colum"><a class="price2"></a>(원)</td>
										<td class="kcal-colum"></td>							
									</tr>
								</tbody>
								
							</tbody>
						</table>
					</div>
					<div class="step_two">
						<h3>2단계: 메뉴 항목을 선택하세요</h3>
						<div class="select-one">
							<p class="select-zero">아직 아무 메뉴도 선택하지 않으셨습니다.</p>
						</div>
					</div>
				
				</div>
			</div>
		</div>
		<div class="shop_footer">
			<div class="footer_container">
				<div class="footer_body">
					<div class="body_left">
						<a onclick="add_close()">
							<i class="fas fa-share"></i> 메뉴로 돌아가기
						</a>
					</div>
					<div class="body_right">
						<button><i class="fas fa-shopping-bag"></i> 카트에 추가</button>
					</div>
					<div class="clear1"></div>
					
					
				
				</div>
			</div>
		
		</div>
	
	
	</div>
	


</div>	
<div class="pay">
	<div class="pay_modal">
		<div class="pay_modal_content">
			<p>결제가 완료 되었습니다.</p>
			<button onclick="pay_exit()">확인</button>
		
		</div>
		
	
	</div>
	
</div>	

</body>
</html>