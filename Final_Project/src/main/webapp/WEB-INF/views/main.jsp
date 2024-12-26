<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7b8a61ae85e27a17fc90cd2fcea0205&libraries=services"></script>
<!-- alertifyS alert창 활성화 -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/themes/bootstrap.min.css"/>
   
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	.outer {
	    margin: auto;
	    width: 1000px;
	    padding: 20px;
	    background-color: #f8f8f8; /* 부드러운 배경 색상 */
	}
	
	.mainpage-area {
	    background-color: #fff;
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	}

	/* 상단 광고 배너 */
	.banner-container {
	    margin-top: 20px;
	    width: 100%;
	    overflow: hidden; /* 배너 슬라이드가 넘치지 않도록 숨김 */
	    border-radius: 10px;
	    margin-bottom: 30px;
	}
	
	.banner-slider {
	    display: flex;
	    transition: transform 0.5s ease-in-out; /* 슬라이드 전환 효과 */
	}
	
	.banner-slide {
	    flex: 0 0 100%; /* 한 배너 이미지가 화면에 100% 차지하도록 설정 */
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.banner-slide img {
	    width: 100%;
	    height: 250px; /* 배너 높이 설정 */
	    object-fit: cover; /* 이미지 비율에 맞게 자르기 */
	    border-radius: 10px;
	}
	
	/* 상품 카테고리, 추천 상품 등의 나머지 스타일 */
	.category-section {
	    display: flex;
	    justify-content: space-around;
	    margin-bottom: 30px;
	}
	
	.category-button {
	    background-color: #fff;
	    padding: 12px 20px;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    font-size: 16px;
	    color: #333;
	    width: 120px;
	    cursor: pointer;
	    transition: background-color 0.3s, transform 0.2s;
	}
	
	.category-button:hover {
	    background-color: #fee500;
	    transform: scale(1.05);
	}
	
	.category-button:active {
	    transform: scale(1);
	}
	
	/* 추천 상품 */
	.recommended-products h3 {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 20px;
	}
	
	.recommended-products {
	    display: flex;
	    gap: 20px;
	    margin-bottom: 30px;
	}
	
	.recommended-products .product-card {
	    width: 200px;
	    height: 300px;
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
	
	/* 최근 게시물 */
	.recent-posts h3 {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 20px;
	}
	
	.recent-posts .post-item {
	    padding: 15px;
	    background-color: #fff;
	    border-radius: 8px;
	    margin-bottom: 10px;
	    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	}
	
	.recent-posts .post-item .post-title {
	    font-size: 18px;
	    font-weight: bold;
	    color: #333;
	}
	
	.recent-posts .post-item .post-price {
	    font-size: 16px;
	    color: #fee500;
	    margin-top: 5px;
	}


</style>  

</head>
<body>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="outer">
	    <div class="mainpage-area">
	    
	        <!-- 상단 광고 배너 영역 -->
	        <div class="banner-container">
	            <div class="banner-slider">
	                <div class="banner-slide">
	                    <img src="#" alt="banner1">
	                </div>
	                <div class="banner-slide">
	                    <img src="#" alt="banner2">
	                </div>
	                <div class="banner-slide">
	                    <img src="#" alt="banner3">
	                </div>
	            </div>
	        </div>
	        
	        <br><br>
	        <!-- 나머지 콘텐츠 (추천 상품, 최근 게시물 등) -->
	        <div class="category-section">
	            <button class="category-button">전자기기</button>
	            <button class="category-button">패션</button>
	            <button class="category-button">가구</button>
	            <button class="category-button">책</button>
	            <button class="category-button">기타</button>
	        </div>
			
			<br><br>
	        <div class="recommended-products">
	            <h3>추천 상품</h3>
	            <div class="product-card">
	                <img src="img/product1.jpg" alt="product1">
	                <div class="product-info">
	                    <div class="product-title">전자기기</div>
	                    <div class="product-price">₩300,000</div>
	                </div>
	            </div>
	            <div class="product-card">
	                <img src="img/product2.jpg" alt="product2">
	                <div class="product-info">
	                    <div class="product-title">가전제품</div>
	                    <div class="product-price">₩150,000</div>
	                </div>
	            </div>
	        </div>
			
			<br><br>
	        <div class="recent-posts">
	            <h3>최근 게시물</h3>
	            <div class="post-item">
	                <div class="post-title">iPhone 13 중고 팝니다</div>
	                <div class="post-price">₩700,000</div>
	            </div>
	            <div class="post-item">
	                <div class="post-title">미니 냉장고 팝니다</div>
	                <div class="post-price">₩100,000</div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
		$(function(){
			var currentSlide = 0;
			var totalSlides = document.querySelectorAll('.banner-slide').length;
		
			function nextSlide() {
			    currentSlide = (currentSlide + 1) % totalSlides; // 슬라이드가 끝까지 가면 처음으로 돌아가게
			    var bannerSlider = document.querySelector('.banner-slider');
			    bannerSlider.style.transform = `translateX(-${currentSlide * 100}%)`;
			}
		
			// 3초마다 슬라이드 넘기기
			setInterval(nextSlide, 3000);
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>