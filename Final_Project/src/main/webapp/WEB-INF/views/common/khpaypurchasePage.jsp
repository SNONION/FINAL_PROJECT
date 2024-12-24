<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS, jQuery, Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	.inner{
		width: 80%;
		height: 600px;
		margin: auto;
	}
	
	#purch-btn{
		background-color: #ffdd00;
		border: #ffdd00;
		border-radius: 10px;
	}
	
	#purch-btn:hover{
		background-color: #f7c600; /* hover 시 색상 변화 */
	    cursor: pointer;
	}
	
	#pay-img{
		width: 200px;
		height: auto;
	}
	
	.card{
		margin: auto;
	}
	
</style>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<div class="inner" style="display: flex; flex-wrap: wrap; gap: 10px;">
			<div class="card"
				style="width: 200px; display: flex; align-items: center; justify-content: center;">
				<img class="card-img-top" id="pay-img"
					src="${contextPath}/resources/5000kakao.png" alt="Card image"
					style="width: 50%; height: auto; display: block;">
				<div class="card-body"
					style="flex-grow: 1; padding: 10px; text-align: center;">
					<h4 class="card-title">5000</h4>
					<button type="button" class="btn btn-warning" id="purch-btn">구매하기</button>
				</div>
			</div>
			<div class="card"
				style="width: 200px; display: flex; align-items: center; justify-content: center;">
				<img class="card-img-top" id="pay-img"
					src="${contextPath}/resources/10000kakao.png" alt="Card image"
					style="width: 50%; height: auto; display: block;">
				<div class="card-body"
					style="flex-grow: 1; padding: 10px; text-align: center;">
					<h4 class="card-title">10000</h4>
					<button type="button" class="btn btn-warning" id="purch-btn">구매하기</button>
				</div>
			</div>
			<div class="card"
				style="width: 200px; display: flex; align-items: center; justify-content: center;">
				<img class="card-img-top" id="pay-img"
					src="${contextPath}/resources/20000kakao.png" alt="Card image"
					style="width: 50%; height: auto; display: block;">
				<div class="card-body"
					style="flex-grow: 1; padding: 10px; text-align: center;">
					<h4 class="card-title">20000</h4>
					<button type="button" class="btn btn-warning" id="purch-btn">구매하기</button>
				</div>
			</div>
			<div class="card"
				style="width: 200px; display: flex; align-items: center; justify-content: center;">
				<img class="card-img-top" id="pay-img"
					src="${contextPath}/resources/30000kakao.png" alt="Card image"
					style="width: 50%; height: auto; display: block;">
				<div class="card-body"
					style="flex-grow: 1; padding: 10px; text-align: center;">
					<h4 class="card-title">30000</h4>
					<button type="button" class="btn btn-warning" id="purch-btn">구매하기</button>
				</div>
			</div>
			<div class="card"
				style="width: 200px; display: flex; align-items: center; justify-content: center;">
				<img class="card-img-top" id="pay-img"
					src="${contextPath}/resources/40000kakao.png" alt="Card image"
					style="width: 50%; height: auto; display: block;">
				<div class="card-body"
					style="flex-grow: 1; padding: 10px; text-align: center;">
					<h4 class="card-title">40000</h4>
					<button type="button" class="btn btn-warning" id="purch-btn">구매하기</button>
				</div>
			</div>
			<div class="card"
				style="width: 200px; display: flex; align-items: center; justify-content: center;">
				<img class="card-img-top" id="pay-img"
					src="${contextPath}/resources/50000kakao.png" alt="Card image"
					style="width: 50%; height: auto; display: block;">
				<div class="card-body"
					style="flex-grow: 1; padding: 10px; text-align: center;">
					<h4 class="card-title">50000</h4>
					<button type="button" id="purch-btn" class="btn btn-warning">구매하기</button>
				</div>
			</div>
		</div>
		<br><hr><br>
		<div style="width: 800px; margin: auto; text-align: left;">
			<p>
				<b style='font-size: 25px;'>안전결제를 위한 카카오 화폐 구매 안내</b><br><br><br>
				안녕하세요, KH 중고 마켓입니다.<br>
				우리 사이트에서는 거래의 안전성을 보장하기 위해 카카오 화폐를 제공하고 있습니다. 카카오 화폐는 안전결제 시스템을 통해 중고 거래 시 발생할 수 있는 다양한 위험 요소를 최소화하고, 사용자에게 더욱 안전한 거래 환경을 제공합니다.<br><br><br>
				
				<b style='font-size: 25px;'>카카오 화폐란?</b><br><br>
				카카오 화폐는 거래의 안전성을 높이기 위해 도입된 가상 화폐로, KH 중고 마켓에서 거래를 할 때 안전하게 결제를 할 수 있도록 돕습니다. 
				판매자는 카카오 화폐를 통해 금액을 받으며, 구매자는 상품을 수령한 후 거래 완료를 진행하여 화폐를 교환할 수 있습니다.<br><br><br>
				
				<b style='font-size: 25px;'>카카오 화폐의 장점</b><br><br>
				1. 안전한 결제 시스템:<br> 구매자가 물품을 받은 후, 판매자에게 카카오 화폐가 전달됩니다. 이를 통해 물품을 미리 보내고 돈을 받지 않는 위험을 방지할 수 있습니다.<br>
				2. 신속한 거래:<br> 카카오 화폐는 즉시 사용 가능하며, 실시간으로 거래가 진행되어 빠르고 간편하게 결제가 이루어집니다.<br>
				3. 보안성 강화:<br> 카카오 화폐는 플랫폼 내에서만 사용 가능하며, 외부의 위험으로부터 보호됩니다.<br><br><br>
				<b style='font-size: 25px;'>카카오 화폐 구매 방법</b><br><br>
				1) 로그인 후 [KH 중고 마켓 > 상단메뉴(KAKAO구매)]에 접속합니다.<br>
				2) 카카오 화폐 구매 페이지로 이동합니다.<br>
				3) 원하시는 금액을 선택하고 결제 방법을 선택하여 구매합니다.<br>
				4) 구매한 카카오 화폐는 즉시 계정에 적립되어 안전결제에 사용할 수 있습니다.<br>
				5) 카카오 화폐로 안전하게 거래하기<br>
				6) 거래 전에 판매자에게 카카오 화폐를 통해 결제를 진행하여 물품이 안전하게 배송될 때까지 금액을 보관합니다.<br>
				7) 물품을 받은 후, 구매자는 안전하게 거래 완료 버튼을 눌러 판매자에게 카카오 화폐를 전달하고, 거래가 완료됩니다.<br><br><br>
				카카오 화폐로 더욱 안전한 거래 환경을 경험해 보세요!
				궁금한 사항이 있으면 언제든지 고객센터로 문의 주세요.<br><br>

				이메일: [example@email.com]<br>
				전화: 010-1234-5678<br><br>
				
				감사합니다.<br><br><br><br><br><br>
			</p>
		</div>
	</div>
	
	<script>
		$("#purch-btn").click(function(){
			var payMount = $(this).siblings("h4").text();
			
			alertify.confirm(payMount + "Kakao 를 구매하시겠습니까?", function(){
				$.ajax({
					url : "${contextPath}/user/purchaseKakao",
					data : {
						payMount : payMount
					},
					success : function(result){
						
						location.href=result.redirectPCUrl;
						
						// window.location.search는 현재 URL에서 ? 이후의 쿼리 문자열을 반환하는 메소드
						// new URLSearchParams()는 쿼리 문자열을 파싱하여 파라미터들을 쉽게 추출하는 객체
						// urlParams.get('파라미터')URL에서 파라미터의 값을 얻을어오는 메소드
						var urlParams = new URLSearchParams(window.location.search);
						var pgToken = urlParams.get('pg_token');
						
						approvalProcess(pgToken, result.tid, result.partnerOderId);
					},
					error : function(){
						console.log("거래인증 오류");
					}
				});
			});
			
		});
		
		function approvalProcess(pgToken, tid, partnerOderId){
			$.ajax({
				url : "${contextPath}/user/approvalProcess",
				data : {
					pgToken : pgToken,
					tid : tid,
					partnerOderId : partnerOderId
				},
				success : function(result){
					
					// 결제 승인 과정 확인
					// 참조: https://developers.kakaopay.com/docs/payment/online/single-payment
					console.log(result);
					
					/*
						결제 확인 후
						TB_USER의 포인트 증가시키는 메소드 호출 및 실행 (function 형태로 ajax로 진행)
					*/
				},
				error : function(){
					console.log("거래요청 오류");
				}
			});
		}
	</script>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>