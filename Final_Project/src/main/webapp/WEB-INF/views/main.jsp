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
	    height: 450px; /* 배너 높이 설정 */
	    object-fit: cover; /* 이미지 비율에 맞게 자르기 */
	    border-radius: 10px;
	}
	
	.category-section {
	    display: flex;
	    gap: 40px; /* 버튼 사이 간격 */
	    justify-content: center; /* 중앙 정렬 */
	    align-items: center; /* 수직 중앙 정렬 */
	    flex-wrap: wrap; /* 화면 크기에 따라 버튼이 자동으로 줄 바꿈 */
	}
	
	.category-input {
	    display: flex;
	    gap: 60px; /* 버튼 사이 간격 */
	    justify-content: center; /* 중앙 정렬 */
	    align-items: center; /* 수직 중앙 정렬 */
	    flex-wrap: wrap; /* 화면 크기에 따라 버튼이 자동으로 줄 바꿈 */
	}
	
	.category-button {
	    width: 100px;                  /* 버튼 너비 */
	    height: 100px;                 /* 버튼 높이 */
	    border-radius: 50%;            /* 원형 버튼 */
	    background-size: cover;       /* 이미지가 버튼을 덮도록 설정 */
	    background-position: center;  /* 이미지가 버튼 중앙에 오도록 설정 */
	    border: none;                 /* 버튼의 기본 테두리 제거 */
	    cursor: pointer;              /* 마우스 커서 스타일 */
	    font-size: 15px;               /* 글자 크기 */
	    color: black;                 /* 글자 색 */
	    display: flex;                 /* 버튼 내 텍스트 중앙 정렬 */
	    justify-content: center;       /* 수평 중앙 정렬 */
	    align-items: center;           /* 수직 중앙 정렬 */
	    transition: transform 0.3s ease; /* 버튼 크기 변경 효과 */
	    font-weight: bold;
	}
	
	.category-button:hover {
	    transform: scale(1.1);         /* 호버 시 버튼 크기 커지기 */
	    color: rgb(108, 75, 42);
	    outline: none;
	    border: none;
	}

	
	.category-button:hover {
	    background-color: #fee500;
	    transform: scale(1.05);
	    outline: none;
	    border: none;
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
	
	.recent-board-list div:hover{
		cursor: pointer;
	}
	
	.recommended-products{
		position: relative;
	}
	
	#nextBoardBtn{
	    width: 40px;               /* 버튼 너비 */
	    height: 40px;              /* 버튼 높이 */
	    border-radius: 50%;        /* 원형 버튼 */
	    background-color: white;   /* 하얀색 배경 */
	    color: black;            /* 글자 색 */
	    border: none; /* 테두리 색 */
	    font-size: 30px;           /* 글자 크기 */
	    cursor: pointer;          /* 마우스 커서 스타일 */
	    text-align: center;        /* 수평 중앙 정렬 */
	    line-height: 40px;         /* 수직 중앙 정렬 (버튼 높이와 같게 설정) */
	    transition: background-color 0.3s ease, transform 0.3s ease; /* 호버 효과 */
	    outline: none;             /* 클릭 시 테두리 생기는 것 제거 */
	    position: absolute;           /* 고정 위치 */
	    top: 120px;              /* 화면 하단에서 20px 떨어짐 */
	    right: 40px;               /* 화면 우측에서 20px 떨어짐 */
	}
	
	#previousBoardBtn {
		width: 40px;               /* 버튼 너비 */
	    height: 40px;              /* 버튼 높이 */
	    border-radius: 50%;        /* 원형 버튼 */
	    background-color: white;   /* 하얀색 배경 */
	    color: black;            /* 글자 색 */
	    border: none; /* 테두리 색 */
	    font-size: 30px;           /* 글자 크기 */
	    cursor: pointer;          /* 마우스 커서 스타일 */
	    text-align: center;        /* 수평 중앙 정렬 */
	    line-height: 40px;         /* 수직 중앙 정렬 (버튼 높이와 같게 설정) */
	    transition: background-color 0.3s ease, transform 0.3s ease; /* 호버 효과 */
	    outline: none;             /* 클릭 시 테두리 생기는 것 제거 */
	    position: absolute;           /* 고정 위치 */
	    top: 120px;              /* 화면 하단에서 20px 떨어짐 */
	    left: 40px;               /* 화면 우측에서 20px 떨어짐 */
	}
	
	#nextBoardBtn:hover, #previousBoardBtn:hover {
	    color: rgb(255, 221, 51);               /* 호버 시 글자색 변경 */
	    font-size: 36px;           /* 글자 크기 */
	}
	
	#nextCateBtn, #previousCateBtn {
	    width: 40px;               /* 버튼 너비 */
	    height: 40px;              /* 버튼 높이 */
	    border-radius: 50%;        /* 원형 버튼 */
	    background-color: white;   /* 하얀색 배경 */
	    color: black;            /* 글자 색 */
	    border: none; /* 테두리 색 */
	    font-size: 30px;           /* 글자 크기 */
	    cursor: pointer;          /* 마우스 커서 스타일 */
	    text-align: center;        /* 수평 중앙 정렬 */
	    line-height: 40px;         /* 수직 중앙 정렬 (버튼 높이와 같게 설정) */
	    transition: background-color 0.3s ease, transform 0.3s ease; /* 호버 효과 */
	    outline: none;             /* 클릭 시 테두리 생기는 것 제거 */
	}
	
	#nextCateBtn:hover, #previousCateBtn:hover {
	    color: rgb(255, 221, 51);               /* 호버 시 글자색 변경 */
	    font-size: 36px;           /* 글자 크기 */
	}
	
	.banner-container {
	    width: 100%;
	    overflow: hidden;
	    position: relative;
	}
	
	.banner-slider {
	    display: flex;
	    transition: transform 1s ease-in-out;
	}
	
	.banner-slide {
	    min-width: 100%;
	    height: auto;
	}
	
	img {
	    width: 100%;
	    height: auto;
	}	
	
	/* 이미지 스타일 */
	.category-img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 50px; /* 이미지 크기 */
	    height: 50px;
	    opacity: 0; /* 기본적으로 이미지 숨김 */
	    transition: opacity 0.3s ease; /* 부드러운 전환 효과 */
	    z-index: 1;
	}
	
	/* 텍스트 스타일 */
	.category-button .text {
	    position: relative;
	    z-index: 10; /* 글자를 이미지보다 앞으로 */
	    font-weight: bold;
	    color: white;
	    pointer-events: none; /* 텍스트 선택 불가 */
	}
	
	/* hover 시 이미지 표시 */
	.category-button:hover .category-img {
	    opacity: 0.7; /* 이미지 표시 */
	}
	
	/* hover 시 텍스트와 이미지 겹치기 */
	.category-button {
	    color: black;
	    font-weight: bold;
	}
	
	.recent-board-list .post-item {
	    transition: transform 0.3s ease; /* 크기 변화의 애니메이션 시간 */
	}
	
	.recent-board-list .post-item:hover {
	    transform: scale(1.05); /* 5% 정도 크기를 키움 */
	}

</style>  

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="outer">
	    <div class="mainpage-area">
	    
	        <!-- 상단 광고 배너 영역 -->
	        <div class="banner-container">
	            <div class="banner-slider">
	                <div class="banner-slide bannerImg">
	                    <img src="${contextPath}/resources/pageDecoImgFiles/AD1.png" alt="banner1">
	                </div>
	                <div class="banner-slide bannerImg">
	                    <img src="${contextPath}/resources/pageDecoImgFiles/AD2.png" alt="banner2">
	                </div>
	                <div class="banner-slide bannerImg">
	                    <img src="${contextPath}/resources/pageDecoImgFiles/AD3.png" alt="banner2">
	                </div>
	                <div class="banner-slide bannerImg">
	                    <img src="${contextPath}/resources/pageDecoImgFiles/AD4.png" alt="banner2">
	                </div>
	                <div class="banner-slide bannerImg">
	                    <img src="${contextPath}/resources/pageDecoImgFiles/AD5.png" alt="banner2">
	                </div>
	            </div>
	        </div>
	        
	        <br><br>
	        <!-- 나머지 콘텐츠 (추천 상품, 최근 게시물 등) -->
			<h3 style="font-size: 24px; font-weight: bold; margin-bottom: 20px;">카테고리</h3>
			<div class="category-section">
				<button type='button' id='previousCateBtn'><i class='fas fa-chevron-left'></i></button>
				<div class="category-input" style="display: flex;">
				    <div>카테고리를 불러오는 중입니다.</div>
				</div>
				<button type='button' id='nextCateBtn'><i class='fas fa-chevron-right'></i></button>
			</div>
			
			<br><br><br><br>
	        <div class="recommended-products">
	            <h3>추천상품</h3>
	            <button type='button' id='previousBoardBtn'><i class='fas fa-chevron-left'></i></button>
	            <div class="top5-board-list" style="display: flex;">
	            	<div class="product-card">
		            	<div class="product-title">상품을 불러오는 중입니다.</div>
		            </div>
	            </div>
	            <button type='button' id='nextBoardBtn'><i class='fas fa-chevron-right'></i></button>
	        </div>
			
			<br><br>
	        <div class="recent-posts">
	            <h3>최근상품</h3>
	            <div class="recent-board-list">	            
		            <div class="post-item">
		                <div class="post-title" align="center">상품을 불러오는 중입니다.</div>
		                <div class="post-price"></div>
		            </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
		$(function(){
			$(".recommended-products").on("click", ".product-card", function(){
				var productInfo = $(this).children("div");
				var boardNo = $(productInfo).children().first().val();
				
				location.href="${contextPath}/board/boardDetailForm?boardNo=" + boardNo;
			});
			
			$(".recent-board-list").on("click", ".post-item", function(){
				var boardNo = $(this).children().val();
				
				location.href="${contextPath}/board/boardDetailForm?boardNo=" + boardNo;
			});
		});
	</script>
	
	<script>
		// 부모 메뉴 클릭 시
		$(".category-input").on("click", "button", function(event) {
	
		    var categoryName = $(this).text();
		    
		    location.href = "${contextPath}/board/productBoardForm?categoryName=" + categoryName;
		});
	
		$(function(){
			
			// 최근에 등록된 상품 5개를 가지고 옴
			$.ajax({
				url : "${contextPath}/board/recentBoardfive",
				success : function(result1){
					
					$(".recent-board-list div").remove();
					
					if(result1 != ""){
						for(var five of result1){
							var postDiv = $("<div class='post-item' style='display: flex;'>");
							var input = $("<input type='hidden'>").attr("name", "boardNo").val(five.boardNo);
							var titleDiv = $("<div class='post-title' style='margin-right: 20px;'>").text(five.boardTitle);
							
							if(five.boardDeclaration == "Y"){
								titleDiv.append("&nbsp;<i style='color:red;' class='fas fa-exclamation-circle'></i>")
							}
							
							var priceDiv = $("<div style='color: red;'>").text(five.price + "원");
							
							postDiv.append(input).append(titleDiv).append(priceDiv);
							
							$(".recent-board-list").append(postDiv);
						}
					}
					else{
						$(".recent-board-list").append($("<div style='width: 300px; height: 200px; text-align: center;'>").text("작성된 게시글이 없습니다."));
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
			
			var ccount = 1;
			var count = 1;
			topBoard(count);
			cateList(ccount);
			
			$(".recommended-products").on("click", "#nextBoardBtn", function(){
				if(count != "${page.maxPage}"){
					++count;					
				}
				topBoard(count);
			})
			
			$(".recommended-products").on("click", "#previousBoardBtn", function(){
				if(count != 1){
					--count;					
				}
				topBoard(count);
			});
			
			$(".category-section").on("click", "#nextCateBtn", function(){
				if(ccount != "${catePage.maxPage}"){
					++ccount;
				}
				cateList(ccount);
			})
			
			$(".category-section").on("click", "#previousCateBtn", function(){
				if(ccount != 1){
					--ccount;					
				}
				cateList(ccount);
			});
		});
		
		function topBoard(count){
			
			// 인기 있는 상품을 가지고 옴
			$.ajax({
				url : "${contextPath}/board/topFiveProduct",
				data : {
					currentPage : count
				},
				success : function(result2){
					
					$(".top5-board-list div").remove();
					
					if(result2 != ""){
						for(var top of result2){
							var productCard = $("<div class='product-card' style='margin-right: 30px;'>");
							var img = $("<img>").attr("src", "${contextPath}" + top.titleImg);
							var productInfo = $("<div class='product-info'>");
							var input = $("<input type='hidden'>").attr("name", "boardNo").val(top.boardNo);
							var title = $("<div class='product-title'>").text(top.boardTitle);
							
							if(top.boardDeclaration == "Y"){
								title.append("&nbsp;<i style='color:red;' class='fas fa-exclamation-circle'></i>")
							}
							
							var price = $("<div style='color: red;'>").text(top.price + "원");
							
							productInfo.append(input).append(title).append(price);
							productCard.append(img).append(productInfo);
							
							$(".top5-board-list").append(productCard);
						}
					}
					else{
						$(".top5-board-list").append($("<div>").text("작성된 게시글이 없습니다."));
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
			
		}
		
		function cateList(ccount){
			
			$.ajax({
				url : "${contextPath}/board/getCate",
				data : {
					currentPage : ccount
				},
				success : function(result3){
					
					$(".category-input div").remove();
					$(".category-input button").remove();
					
					for(var cate of result3){
						var button = $("<button class='category-button'>").text(cate.categoryName);
						var img = $("<img class='category-img'>").attr("src", "${contextPath}" + cate.categoryImg);
						button.append(img);
						
						$(".category-input").append(button);
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		}
		
	</script>
	
	<script>
		$(function() {
			var count = 0;
		    var slides = $('.banner-slide');
		    var totalSlides = slides.length;
	
		    setInterval(function() {
		        
		    	// 마지막 인덱스 전까지는 제거
		    	if(totalSlides - 1 != count){
		    		$(slides.get(count)).css("display", "none");
		    		count++;
		    	}
		    	else {
		    		$(slides.get(count - 1)).css("display", "block");
		    		count--;
		    	}
		    	
		    }, 4000); 
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>