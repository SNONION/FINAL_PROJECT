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
		            <p class="product-location">거래 지역: ${detailBoard.sellLocation}</p>
		            <p class="product-prefer-payment">선호 결제: ${detailBoard.preferPayment}</p>
		            
		             <div class="additional-info">
			            <p><strong>상품명:</strong> ${productInfo.productName}</p>
			            <c:if test="${productInfo.createLocation != null}">
			            	<p><strong>제조사:</strong> ${productInfo.createLocation}</p>
			            </c:if>
			        </div>
		        </div>
		    </div>
		    <div class="product-slider">
			    <button class="slider-arrow left-arrow">&#10094;</button>
			    <div class="slider-image-container">
			    	<c:forEach var="imgFile" items="${media}">
				        <img id="sliderImage" src="${contextPath}${imgFile.mediaPath}${imgFile.changeName}" alt="상품 이미지" />			        	
			        </c:forEach>
			    </div>
			    <button class="slider-arrow right-arrow">&#10095;</button>
			</div>
		    <div class="product-description">
		        <h2>상품 설명</h2>
		        <p>${detailBoard.boardContent}</p>
		    </div>
		    <div class="seller-info">
		        <h2>판매자 정보</h2>
		        <p>판매자: ${detailBoard.boardWriter}</p>
		        <p>판매자 평가: ${writerInfo.trustPoint}</p>
		    </div>
		    <div class="product-footer">
		    	<c:if test="${not empty loginUser}">
			        <button class="button-contact">판매자와 채팅하기</button>
			        <button class="button-contact" id="pickBtn" onclick="pick();">찜하기
			        	<c:if test="${existPick > 0}">
			        		<i class='fas fa-heart filled-heart'></i>
			        	</c:if>
			        </button>
			        <button class="button-report" onclick="reportBoard();">신고하기</button>
		    	</c:if>
		    </div>
		</div>	
	</div>
	
	<script>
		// 신고하기 버튼 기능 메소드
		function reportBoard(){
			
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
							$("#pickBtn").append($("<i class='fas fa-heart filled-heart'>"))
						}
						
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
							$("#pickBtn i").remove();
						}
						
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
		};
	
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
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>