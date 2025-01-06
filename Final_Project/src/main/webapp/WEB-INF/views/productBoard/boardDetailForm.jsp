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
	.outer{
		width: 1000px;
		height: auto;
		margin: auto;
	}
	
	body {
	    font-family: 'Arial', sans-serif;
	    background-color: #f7f7f7;
	    margin: 0;
	    padding: 0;
	}
	
	.product-detail-page {
	    width: 800px;
	    margin: 50px auto;
	    background-color: #ffffff;
	    border: 1px solid #e0e0e0;
	    border-radius: 8px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	}
	
	.product-header {
	    padding: 20px;
	    border-bottom: 1px solid #e0e0e0;
	    background-color: #f9f9f9;
	}
	
	.product-title {
	    margin: 0;
	    font-size: 24px;
	    color: #333;
	}
	
	.product-date {
	    margin: 5px 0 0;
	    font-size: 14px;
	    color: #888;
	}
	
	.product-content {
	    display: flex;
	    padding: 20px;
	    border-bottom: 1px solid #e0e0e0;
	}
	
	.product-image{
		margin-top: 20px;
	}
	
	.product-image img {
	    width: 300px;
	    height: 300px;
	    object-fit: cover;
	    border-radius: 8px;
	    border: 1px solid #e0e0e0;
	}
	
	.product-info {
	    margin-left: 20px;
	    flex: 1;
	}
	
	.product-info p {
	    margin: 10px 0;
	    font-size: 16px;
	    color: #555;
	}
	
	.product-price {
	    font-size: 20px;
	    font-weight: bold;
	    color: #222;
	}
	
	.product-description {
	    padding: 20px;
	    border-bottom: 1px solid #e0e0e0;
	}
	
	.product-description h2 {
	    margin: 0 0 10px;
	    font-size: 18px;
	    color: #333;
	}
	
	.product-description p {
	    font-size: 16px;
	    color: #555;
	    line-height: 1.5;
	}
	
	.seller-info {
	    padding: 20px;
	    border-bottom: 1px solid #e0e0e0;
	}
	
	.seller-info h2 {
	    margin: 0 0 10px;
	    font-size: 18px;
	    color: #333;
	}
	
	.seller-info p {
	    margin: 5px 0;
	    font-size: 16px;
	    color: #555;
	}
	
	.product-footer {
	    padding: 20px;
	    text-align: center;
	}
	
	.button-contact,
	.button-report {
	    padding: 12px 30px;            /* 버튼 여백 */
	    margin: 8px;                   /* 버튼 간 간격 */
	    font-size: 16px;               /* 글자 크기 */
	    font-weight: bold;             /* 글자 굵기 */
	    border: none;                  /* 테두리 제거 */
	    border-radius: 50px;           /* 둥근 모서리 */
	    cursor: pointer;               /* 커서 포인터 */
	    transition: background-color 0.3s ease, transform 0.3s ease; /* 부드러운 전환 효과 */
	}
	
	/* 연락하기 버튼 */
	.button-contact {
	    background-color: #ffdd00;    /* 카카오톡과 유사한 노란색 */
	    color: #3e1c2b;                /* 어두운 색 글자 */
	}
	
	/* 연락하기 버튼 호버 상태 */
	.button-contact:hover {
	    background-color: #f2c100;    /* 더 어두운 노란색 */
	    transform: scale(1.05);        /* 살짝 확대되는 효과 */
	}
	
	/* 신고하기 버튼 */
	.button-report {
	    background-color: #ff4f57;    /* 붉은색 */
	    color: white;                  /* 하얀색 글자 */
	}
	
	/* 신고하기 버튼 호버 상태 */
	.button-report:hover {
	    background-color: #e03e42;    /* 더 어두운 붉은색 */
	    transform: scale(1.05);        /* 살짝 확대되는 효과 */
	}
	
	.additional-info {
	    margin-top: 20px;
	    padding: 10px;
	    border: 1px solid #e0e0e0;
	    border-radius: 8px;
	    background-color: #f9f9f9;
	}
	
	.additional-info p {
	    margin: 5px 0;
	    font-size: 14px;
	    color: #555;
	}
	
	.additional-info p strong {
	    font-weight: bold;
	    color: #333;
	}
	
	.product-slider {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    position: relative;
	    margin: 20px auto;
	    width: 100%;
	    max-width: 600px; /* 슬라이더의 최대 너비 */
	    height: 400px;    /* 슬라이더의 높이 */
	    background-color: #f9f9f9;
	    border: 1px solid #e0e0e0;
	    border-radius: 8px;
	    overflow: hidden;  /* 슬라이더 영역을 넘는 이미지는 보이지 않음 */
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}
	
	.slider-image-container {
	    display: flex;
	    transition: transform 0.3s ease; /* 부드럽게 이미지가 슬라이드 되도록 */
	    width: 100%;  /* 전체 컨테이너 너비 */
	    height: 100%; /* 전체 컨테이너 높이 */
	}
	
	.slider-image-container img {
	    width: 100%;
	    height: 100%;
	    object-fit: contain;  /* 이미지 크기 맞추기 */
	    border-radius: 8px;
	    flex-shrink: 0; /* 이미지가 축소되지 않도록 */
	}
	
	.slider-arrow {
	    position: absolute;
	    top: 50%;
	    transform: translateY(-50%);
	    background-color: rgba(0, 0, 0, 0.5);
	    color: #ffffff;
	    border: none;
	    border-radius: 50%;
	    width: 40px;
	    height: 40px;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 18px;
	    z-index: 10;
	}
	
	.slider-arrow:hover {
	    background-color: rgba(0, 0, 0, 0.8);
	}
	
	.left-arrow {
	    left: 10px;
	}
	
	.right-arrow {
	    right: 10px;
	}
	
	#trust-point{
		font-size: 24px;
		font-weight: bold;
	}
	
	/* 프로세스 바 기본 스타일 */
	.progress {
	    width: auto;               /* 프로세스 바의 너비 */
	    height: 20px;               /* 프로세스 바의 높이 */
	    background-color: #f3f3f3;  /* 프로세스 바의 배경색 */
	    border-radius: 10px;        /* 둥근 모서리 */
	    margin: 10px 0;             /* 위아래 여백 */
	}
	
	/* 프로세스 바 진행 부분 */
	.progress-bar {
	    height: 100%;               /* 프로세스 바의 높이는 100% */
	    width: 0%;                  /* 초기 상태, 프로세스 바는 비어 있음 */
	    background-color: #ffdd00;  /* 카카오 느낌의 노란색 */
	    border-radius: 10px;        /* 둥근 모서리 */
	    transition: width 0.5s ease; /* 프로세스 바의 변화 애니메이션 */
	}
	
	#writerProduct:hover{
		cursor: pointer;
		text-decoration: underline;
	}
	
	#sellArea{
		font-size: 13px;
		padding: 5px 10px;
		background-color: #dcdcdc;
		border-radius: 10px;
		font-weight: bold;
		color: gray;
	}
	
	#sellArea:hover{
		cursor: pointer;
	}
	
	/* 추천 상품 */
	.recommended-products h3 {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 20px;
	}
	
	.recommended-products {
	    display: flex;
	    margin-bottom: 30px;
	}
	
	.recommended-products .product-card {
	    width: 170px;
	    height: 250px;
	    background-color: #fff;
	    border-radius: 12px;
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	    cursor: pointer;
	    transition: transform 0.3s ease;
	}
	
	.recommended-products .product-card:hover {
	    transform: scale(1.05);
	}
	
	.recommended-products .product-card img {
	    width: 100%;
	    height: 150px;
	    object-fit: cover;
	}
	
	.recommended-products .product-card .product-info {
	    padding: 10px;
	}
	
	.recommended-products .product-card .product-info .product-title {
	    font-size: 18px;
	    font-weight: bold;
	    color: #333;
	}
	
	.recommended-products .product-card .product-info .product-price {
	    font-size: 16px;
	    color: #fee500;
	}
	
	.reply-area {
	  display: flex;
	  align-items: center;
	  padding: 10px;
	  border-top: 1px solid #e5e5e5;
	  background-color: #f9f9f9; /* 카카오의 밝은 배경색 느낌 */
	}
	
	.reply-area textarea {
	  flex: 1; /* 버튼 제외하고 나머지 공간 차지 */
	  resize: none; /* 크기 조절 비활성화 */
	  height: 100px;
	  border: 1px solid #ddd;
	  border-radius: 20px;
	  padding: 10px 15px;
	  font-size: 14px;
	  outline: none;
	  background-color: #fff;
	  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1); /* 살짝 입체감 */
	  margin-right: 10px; /* 버튼과 간격 */
	}
	
	.reply-area textarea::placeholder {
	  color: #aaa; /* 플레이스홀더 색상 */
	}
	
	.reply-area button {
	  padding: 0 15px;
	  height: 40px;
	  border: none;
	  border-radius: 20px;
	  background-color: #f7e600; /* 카카오톡의 노란색 */
	  color: #333; /* 텍스트 색상 */
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.15); /* 버튼 그림자 */
	  transition: background-color 0.3s ease;
	}
	
	.reply-area button:hover {
	  background-color: #fce000; /* 호버 시 약간 더 진한 노란색 */
	}
	
	.reply-area button:active {
	  background-color: #e5c800; /* 클릭 시 어두운 노란색 */
	}
		
	.reply-output-area {
	  padding: 10px;
	  background-color: #f9f9f9;
	  border: 1px solid #e5e5e5;
	  border-radius: 10px;
	  max-height: 400px; /* 스크롤 필요시 */
	  overflow-y: auto;
	  font-family: 'Arial', sans-serif;
	}
	
	.reply-message {
	  margin-bottom: 15px;
	  padding: 10px;
	  border-radius: 10px;
	  background-color: #fff;
	  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	}
	
	.reply-header {
	  display: flex;
	  justify-content: space-between;
	  margin-bottom: 5px;
	  font-size: 12px;
	  color: #555;
	}
	
	.reply-author {
	  font-weight: bold;
	  color: #333;
	}
	
	.reply-date {
	  font-size: 11px;
	  color: #888;
	}
	
	.reply-content {
	  font-size: 14px;
	  color: #333;
	  word-wrap: break-word;
	}
	
	.reply-profile {
	  width: 30px;
	  height: 30px;
	  border-radius: 50%;
	  margin-right: 5px;
	}
	
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="outer">
		<div class="product-detail-page">
		    <div class="product-header">
		        <h1 class="product-title">${detailBoard.boardTitle}</h1>
		        <p class="product-date">${detailBoard.createDate} | 조회수 ${detailBoard.count}</p>
		    </div>
		    <div class="product-content">
		        <div class="product-image">
		            <img src="${contextPath}${detailBoard.titleImg}" alt="상품 이미지" />
		        </div>
		        <div class="product-info">
		            <p class="product-price" style="font-size: 24px; font-weight: bold;">₩ ${detailBoard.price}</p>
		            <p class="product-status">상태: 
						<c:choose>
							<c:when test="${detailBoard.tradeSellStatus == 'S'}">
								<b style="color: green;">판매 중</b>
							</c:when>	
							<c:when test="${detailBoard.tradeSellStatus == 'R'}">
								<b style="color: blue;">예약 중</b>
							</c:when>
							<c:otherwise>
								<b style="color: red;">판매 완료</b>
							</c:otherwise>
						</c:choose>
					</p>
		            <p class="product-category">카테고리: ${category.categoryName}>${category.categoryDetailName}</p>
		            <p class="product-kind">판매유형: 
		            	<c:if test="${detailBoard.kindNo == '1'}">
		            		제품 요청
		            	</c:if>
		            	<c:if test="${detailBoard.kindNo == '2'}">
		            		판매
		            	</c:if>
		            </p>
		            <p class="product-location" data-toggle="modal" data-target="#sellLocationModal">거래 지역: <span id="sellArea"><i class="fas fa-map-marker-alt" style="color:black;"></i>&nbsp;${detailBoard.sellLocation}</span></p>
		            <p class="product-prefer-payment">선호 결제: ${detailBoard.preferPayment}</p>
		            
		             <div class="additional-info">
			            <p><strong>상품명:</strong> ${productInfo.productName}</p>
			            <c:if test="${productInfo.createLocation != null}">
			            	<p><strong>제조사:</strong> ${productInfo.createLocation}</p>
			            </c:if>
			        </div>
		        </div>
		    </div>
		    <c:if test="${not empty media}">
			    <div class="product-slider">
				    <button class="slider-arrow left-arrow">&#10094;</button>
				    <div class="slider-image-container">
				    	<c:forEach var="imgFile" items="${media}">
					        <img id="sliderImage" src="${contextPath}${imgFile.mediaPath}${imgFile.changeName}" alt="상품 이미지" />			        	
				        </c:forEach>
				    </div>
				    <button class="slider-arrow right-arrow">&#10095;</button>
				</div>		    
		    </c:if>
		    <div class="product-description">
		        <h2>상품 설명</h2>
		        <p>${detailBoard.boardContent}</p>
		    </div>
		    <div class="seller-info">
		        <h2>판매자 정보</h2>
		        <div style="display: flex; justify-content: space-between; align-items: center;">
				    <div style="display: flex; align-items: center; gap: 10px;">
				        <span id="trust-img">
				            <img src="${contextPath}${userInfo.trustImg}" width="70px" height="70px">
				        </span>
				        <span id="trust-point" style="font-size: 18px; font-weight: bold; color: black;">${writerInfo.trustPoint}</span>
				    </div>
				    <div id="writerProduct" style="display: flex; align-items: center; gap: 10px;">
				        <img src="${contextPath}${writerInfo.userImg}" width="70px" height="70px">
				        <p style="color: black; font-size: 24px; font-weight: bold; margin: 0;">${detailBoard.boardWriter}</p>
				    </div>
				</div>

				<div class="progress-container">
					<c:choose>
						<c:when test="${writerInfo.trustPoint > 7}">
							<div class="progress">
								<div class="progress-bar bg-success"></div>
							</div>
						</c:when>
						<c:when test="${writerInfo.trustPoint > 4 && writerInfo.trustPoint <= 7}">
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
						</c:when>
						<c:when test="${writerInfo.trustPoint > 3 && writerInfo.trustPoint <= 4}">
							<div class="progress">
								<div class="progress-bar bg-info"></div>
							</div>
						</c:when>
						<c:when test="${writerInfo.trustPoint > 2 && writerInfo.trustPoint <= 3}">
							<div class="progress">
								<div class="progress-bar bg-warning"></div>
							</div>
						</c:when>
						<c:when test="${writerInfo.trustPoint >= 0 && writerInfo.trustPoint <= 2}">
							<div class="progress">
								<div class="progress-bar bg-danger"></div>
							</div>
						</c:when>
					</c:choose>
				</div>
				<br>
				<div class="recommended-products">
		            <div class="top5-board-list" style="display: flex;">
		            	<div class="product-card">
			            	<div class="product-title">상품을 불러오는 중입니다.</div>
			            </div>
		            </div>
				</div>	
		    </div>
		    <div class="product-footer">
	    		<c:if test="${loginUser.userId != detailBoard.boardWriter}">
		    		<button class="button-contact">구매요청</button>
		        	<button class="button-contact" id="chatWithSeller">판매자와 채팅하기</button>
			        <button class="button-contact" id="pickBtn" onclick="pick();">찜하기
			        	<c:if test="${existPick > 0}">
			        		<i class='fas fa-heart filled-heart'></i>
			        	</c:if>
			        </button>
			        <button class="button-report" onclick="reportBoard();">신고하기</button>
	    		</c:if>
		    </div>
			<div class="reply-area">
				<textarea id="replyContent" placeholder="메시지를 입력하세요"></textarea>
				<button onclick="replyInsert();">작성</button>
			</div>
			<div class="reply-output-area">
				
			</div>
		</div>
	</div>
	
	<script>
		function replyInsert(){
			var boardNo = "${detailBoard.boardNo}";
			var replyContent = $("#replyContent").val();
			
			$.ajax({
				url : "${contextPath}/board/insertReply",
				data : {
					refBno : boardNo,
					replyContent : replyContent
				},
				success : function(result){
					
					if(msg = "NNNNY"){
						getReply();
						$("#replyContent").val("");
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		};
		
		function getReply(){
			var boardNo = "${detailBoard.boardNo}";
			
			$.ajax({
				url : "${contextPath}/board/getReply",
				data : {
					boardNo : boardNo
				},
				success : function(result){
					
					$(".reply-output-area div").remove();
					
					for(var reply of result){
						// 외부 div 생성 (댓글 전체를 감싸는 컨테이너)
				        var replyDiv = $("<div>").addClass("reply-message");

				        // 헤더 생성 (작성자와 작성 날짜)
				        var headerDiv = $("<div>").addClass("reply-header");
				        var authorSpan = $("<span>").addClass("reply-author").text(reply.replyWriter);
				        var dateSpan = $("<span>").addClass("reply-date").text(reply.replyDate);
				        headerDiv.append(authorSpan).append(dateSpan);
				        

				        // 내용 생성 (댓글 내용)
				        var contentDiv = $("<div>").addClass("reply-content").text(reply.replyContent);

				        // replyDiv에 헤더와 내용을 추가
				        replyDiv.append(headerDiv).append(contentDiv);

				        // reply-output-area에 replyDiv 추가
				        $(".reply-output-area").append(replyDiv);
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		}
	
		$(".recommended-products").on("click", ".product-card", function(){
			var productInfo = $(this).children("div");
			var boardNo = $(productInfo).children().first().val();
			
			location.href="${contextPath}/board/boardDetailForm?boardNo=" + boardNo;
		});
	
		$(function(){
			getReply()
			getAnotherList();
		});
		
		function getAnotherList(){
			var boardNo = "${detailBoard.boardNo}";
			var boardWriter = "${detailBoard.boardWriter}";
			
			$.ajax({
				url : "${contextPath}/board/getAnotherList",
				data : {
					boardNo : boardNo,
					boardWriter : boardWriter
				},
				success : function(result){
					
					$(".recommended-products div").remove();
					
					if(result != ""){
						for(var top of result){
							var productCard = $("<div class='product-card' style='margin-right: 30px;'>");
							var img = $("<img>").attr("src", "${contextPath}" + top.titleImg);
							var productInfo = $("<div class='product-info'>");
							var input = $("<input type='hidden'>").attr("name", "boardNo").val(top.boardNo);
							var title = $("<div class='product-title'>").text(top.boardTitle);
							var price = $("<div style='color: red;'>").text(top.price + "원");
							
							productInfo.append(input).append(title).append(price);
							productCard.append(img).append(productInfo);
							
							$(".recommended-products").append(productCard);
						}
					}
					else{
						$(".recommended-products").append($("<div style='color:gray; fon-size: 12px;'>").text("검색된 다른 상품이 없습니다."));
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		}
	</script>
	
	<!-- 카카오톡 스타일 현재 위치 모달창 -->
	<div class="modal" id="sellLocationModal">
	    <div class="modal-dialog">
	        <div class="modal-content" style="border: none; border-radius: 10px;">
	
	            <!-- Modal Header -->
	            <div class="modal-header" style="background-color: #f7c600; color: black; border-radius: 10px; border: none;">
	                <h4 class="modal-title">판매 선호 위치 확인</h4>
	            </div>
	
	            <!-- Modal Body -->
	            <div class="modal-body" style="padding: 20px; font-size: 16px; color: #333; border: none;">
	                <div id="sellMap" style="width: 100%;height:350px;"></div>   
					<br>
					<div class="form-group">
					    <label for="outputLocation">선호 위치 : </label>
						<input type="text" name="changeLocation" id="outputLocation" value="${detailBoard.sellLocation}" style="width: 80%; cursor:pointer; border: none;" readonly>
					</div>
	            </div>
	
	            <!-- Modal Footer -->
	            <div class="modal-footer" style="border-top: none; padding: 0;">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 100%; border-radius: 25px; background-color: #e6e6e6; color: #333;">닫기</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
		window.onload = function(){
			var mapContainer = document.getElementById('sellMap'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch("${detailBoard.sellLocation}", function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:200px;">${detailBoard.sellLocation}</div>'
			        });
			        infowindow.open(map, marker);
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
		};
	
		// 판매자와 채팅 시스템 메소드
		$("#chatWithSeller").click(function(){
			
			$.ajax({
				url : "${contextPath}/user/getChatRecord",
				data : {
					chatUser : "${writerInfo.nickname}"
				},
				success : function(result){
					
					$(".chat-history div").remove();
					
					for(var i of result){
						
						var contentSpan = $("<span class='message-content'>").text(i.messageContent);	
						var timeSpan = $("<span class='message-time'>").text(i.createData);
						if("${loginUser.nickname}" == i.nickname){
							var outDiv = $("<div class='chat-message admin-message'>");
						}
						else{
							var outDiv = $("<div class='chat-message user-message'>");
						}
						
						outDiv.append(contentSpan).append(timeSpan);
						$(".chat-history").append(outDiv);
						
						var content = $(".chat-history");
						content.scrollTop(content[0].scrollHeight);
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
			
			$(".kakao-chat-content").css("display", "block");
			$(".first-page-content").css("display", "none");
			openChat();
		});
	
		// 거래 선호 위치 상세보기 메소드
		$("#sellArea").click(function(){
			
		});
	
		// 신고하기 버튼 기능 메소드
		function reportBoard(){
			var boardNo = "${detailBoard.boardNo}";
			
			alertify.confirm('이 게시물을 신고하시겠습니까?', function(){
				$.ajax({
					url : "${contextPath}/board/reportBoard",
					data : {
						boardNo : boardNo
					},
					success : function(msg){
						
						if(msg = 'NNNNY'){
							 alertify.alert("알림!!", "게시물이 신고되었습니다.");
							 $(".button-report").append($("<i class='fas fa-times'>"));
						}
						
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			});
		};
		
		// 찜하기 버튼 기능 메소드
		function pick(){
			if("${existPick}" == 0){
				$.ajax({
					url : "${contextPath}/board/myPickBoard",
					data : {
						boardNo : "${detailBoard.boardNo}"
					},
					success : function(msg){
						
						if(msg == 'NNNNY'){
							console.log("픽");
							$("#pickBtn").append($("<i class='fas fa-heart filled-heart'>"));
						}
						location.reload();
						
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
			else{
				$.ajax({
					url : "${contextPath}/board/myPickBoardDelete",
					data : {
						boardNo : "${detailBoard.boardNo}"
					},
					success : function(msg){
						
						if(msg == 'NNNNY'){
							console.log("픽 제거");
							$("#pickBtn i").remove();
						}
						location.reload();
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
		};
	
		// 다른 이미지들 보여주는 슬라이드바 넘김 버튼
		$(function(){
			var count = 0;
			var imgCount = $(".slider-image-container img").length;
			
			$(".left-arrow").click(function(){
				if(count != 0){
					count--;
					$($(".slider-image-container img").get(count)).css("display", "block");
				}
			});
			
			$(".right-arrow").click(function(){
				if(count + 1 != imgCount){
					$($(".slider-image-container img").get(count)).css("display", "none");
					count++;
				}
			});
			
			// 신뢰도 점수바 보여주는 메소드
			var trustPoint = "${writerInfo.trustPoint}";
			
			$(".progress-bar").css("width", (trustPoint * 10) + "%");
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>