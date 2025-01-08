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
	.filter-outer {
	    width: 1000px;
	    height: auto;
	    margin: auto;
	    margin-top: 180px;
	    padding: 20px 20px;
	    border-radius: 10px;
	    box-shadow: 5px 10px 20px rgba(0, 0, 0, 0.1);
	}
	
	.inner {
	    height: 200px;
	    width: 100%;
	    display: flex;
	}
	
	.default-filter,
	.first-filter,
	.second-filter,
	.third-filter {
	    width: 200px; /* 기본 크기 유지 */
	    height: 100%;
	    padding: 10px;
	    border-radius: 12px; /* 둥근 모서리 */
	    background-color: #ffffff; /* 흰색 배경 */
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	    margin: 5px; /* 여백 */
	    border: 1px solid #ddd; /* 얇은 회색 테두리 */
	    overflow-y: auto; /* 세로 스크롤 추가 */
	    overflow-x: hidden; /* 가로 스크롤 비활성화 */
	}
	
	.first-filter,
	.second-filter,
	.third-filter {
	    width: 30%; /* 필터의 너비 */
	}
	
	/* 기본 리스트 스타일 */
	.list-group li {
	    color: gray;
	    padding: 8px;
	}
	
	.list-group li:hover {
	    color: black;
	    cursor: pointer;
	}
	
	/* 스크롤바 디자인 */
	.inner div::-webkit-scrollbar {
	    width: 8px; /* 스크롤바의 너비 */
	}
	
	.inner div::-webkit-scrollbar-thumb {
	    background-color: lightgray; /* 스크롤바 색상 */
	    border-radius: 4px; /* 둥근 모서리 */
	}
	
	.inner div::-webkit-scrollbar-track {
	    background-color: #f1f1f1; /* 트랙의 배경색 */
	}
	
	.inner div::-webkit-scrollbar-button {
	    display: none; /* 위아래 화살표 제거 */
	}
	
	/* 스크롤바 호버 효과 */
	.inner div::-webkit-scrollbar-thumb:hover {
	    background-color: gray; /* 호버 색상 */
	}
	
	/* union-filter 디자인 */
	.union-filter {
	    display: flex;
	    justify-content: flex-start; /* 왼쪽에 배치 */
	    align-items: center; /* 세로 중앙 정렬 */
	    width: 100%;
	    height: 70px;
	    position: relative; /* 절대 위치 지정하기 위한 기준 */
	    flex-wrap: wrap;
	    gap: 8px;
	    margin-top: 20px;
	    border-radius: 20px;
	    background-color: #f0f0f0; /* 배경색 */
	    padding: 10px;
	}
	
	/* 초기화 버튼 스타일 */
	.reset-button {
		border: none;
	    background-color: #f0f0f0;
	    border-radius: 20px;
	    font-size: 24px;
	    cursor: pointer;
	    color: gray;
	    transition: background-color 0.3s, transform 0.3s;
	    position: absolute; /* 버튼 위치 절대 설정 */
	    top: 5px; /* 상단으로 배치 */
	    right: 10px; /* 오른쪽 끝으로 배치 */
	}

	/* 초기화 버튼 호버 효과 */
	.reset-button:hover {
	    background-color: #ddd;
	    transform: scale(1.05); /* 버튼 크기 확대 효과 */
	}
		
	/* 필터 요소 스타일 */
	.union-filter div {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    background-color: white; /* 연한 회색 */
	    color: #333; /* 어두운 텍스트 */
	    font-size: 10px; /* 폰트 크기 */
	    border-radius: 18px; /* 둥근 모서리 */
	    line-height: 1; /* 텍스트 높이와 일치 */
	    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
	    height: 20px; /* 버튼 크기 + 2px */
	    padding: 0 8px; /* 텍스트 주위의 여백 */
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	    position: relative;
	}
	
	/* 삭제 버튼 스타일 */
	.union-filter button {
		margin-left: 10px;
	    border: none;
	    color: #555; /* 버튼 아이콘 색상 */
	    width: 16px; /* 버튼 크기 */
	    height: 16px; /* 버튼 크기 */
	    border-radius: 50%; /* 원형 버튼 */
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 8px; /* 아이콘 크기 */
	    cursor: pointer;
	    transition: background-color 0.2s, transform 0.2s;
	}
	
	/* 삭제 버튼 호버 효과 */
	.union-filter button:hover {
	    background-color: #ffdd00; /* 호버 색상 */
	    color: #fff; /* 흰색 아이콘 */
	    transform: scale(1.1); /* 크기 확대 효과 */
	}
	
	/* 테이블 헤더 */
	.price-table th {
	  text-align: left;
	  font-size: 14px;
	  color: #4f4f4f; /* 카카오 스타일의 어두운 회색 */
	  padding: 12px;
	}
	
	.price-table {
	  width: 100%;
	  border-collapse: collapse;
	  margin-bottom: 20px;
	}
	
	/* 가격 범위 셀 스타일 */
	.price-range-cell {
	  width: 33%; /* 각 셀의 너비 */
	  padding: 12px;
	}
	
	/* 라벨 스타일 */
	.price-label {
	  display: block;
	  font-size: 12px;
	  color: #4f4f4f; /* 어두운 그레이 */
	  margin-bottom: 5px;
	}
	
	/* 숫자 입력 필드 스타일 */
	.price-input {
	  width: 100%;
	  padding: 10px;
	  font-size: 14px;
	  border-radius: 12px;
	  border: 1px solid #ddd;
	  outline: none;
	  background-color: #fff;
	  box-sizing: border-box; /* padding 포함 크기 설정 */
	  transition: all 0.3s;
	}
	
	.price-input:focus {
	  border-color: #ffdd00; /* 카카오의 노란색 */
	  box-shadow: 0 0 5px rgba(255, 221, 0, 0.6);
	}
	
	.price-input::-webkit-outer-spin-button,
	.price-input::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
	}
	
	/* 반응형으로 스타일 조정 */
	@media screen and (max-width: 768px) {
	  .price-table th, .price-range-cell {
	    font-size: 12px;
	    padding: 8px;
	  }
	
	  .price-input {
	    padding: 8px;
	    font-size: 12px;
	  }
	}
	
	.kakao-button {
	    background-color: #ffdd00; /* 카카오의 대표적인 노란색 */
	    color: #4f4f4f; /* 카카오의 어두운 텍스트 색 */
	    font-size: 14px; /* 적당한 폰트 크기 */
	    padding: 10px 20px; /* 버튼에 여백 추가 */
	    border: none; /* 기본 버튼 테두리 제거 */
	    border-radius: 20px; /* 둥근 모서리 */
	    cursor: pointer; /* 마우스 커서 변경 */
	    transition: background-color 0.3s, transform 0.3s; /* 부드러운 효과 */
	    display: inline-block; /* 버튼 크기 조절 */
	    text-align: center; /* 텍스트 가운데 정렬 */
	}
	
	.kakao-button:hover {
	    background-color: #ffd700; /* 호버 시 색상 변화 */
	    transform: scale(1.05); /* 호버 시 버튼 크기 확대 효과 */
	}
	
	.kakao-button:focus {
	    outline: none; /* 포커스 시 테두리 제거 */
	    box-shadow: 0 0 5px rgba(255, 221, 0, 0.6); /* 카카오의 노란색으로 강조 */
	}
	
	.list-area{
		width: 1000px;
		height: 800px;
		margin: auto;
	}
	
	/* 추천 상품 */
	.recommended-products h3 {
	    font-size: 24px;
	    font-weight: bold;
	    margin-bottom: 20px;
	}
	
	.recommended-products {
	    display: flex;
	    grid-template-columns: repeat(4, 1fr);
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
	
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="filter-outer">
		<div class="inner">
			<div class="default-filter">
				<ul class="list-group" id="defaultFilter">
					<li class="list-group-item">지역</li>
					<li class="list-group-item">카테고리</li>
					<li class="list-group-item">상품상태</li>
					<li class="list-group-item">판매유형</li>
					<li class="list-group-item">거래방식</li>
				</ul>
			</div>
			<div class="first-filter">
				<ul class="list-group" id="firstFilter">
				</ul>
			</div>
			<div class="second-filter">
				<ul class="list-group" id="secondFilter">
				</ul>
			</div>
			<div class="third-filter">
				<ul class="list-group" id="thirdFilter">
				</ul>
			</div>
		</div>
		<br>
		<div class="other-filter">
			<table>
				<thead class="price-table">
					<tr>
						<th>가격 범위</th>
						<th class="price-range-cell">
							<label for="minPrice" class="price-label">최소 가격</label>
							<input type="number" id="minPrice" name="minPrice" min="0" value="1000" step="10" class="price-input">
						</th>
						<th class="price-range-cell">
							<label for="maxPrice" class="price-label">최대 가격</label>
							<input type="number" id="maxPrice" name="maxPrice" max="10000" value="10000" step="10" class="price-input">
						</th>
						<th>
							<button class="kakao-button" onclick="upPrice();">설정</button>
						</th>
					</tr>
				</thead>
			</table>
		</div>
		<form action="${contextPath}/board/searchBoardFilter">			
			<div class="union-filter">
				<c:if test="${category.categoryName != null}">
					<div>${category.categoryName}
						<input type="hidden" name="categoryName" value="${category.categoryName}">
						<button id='filterDeleteBtn'><i class='fas fa-times'></i></button>
					</div>
					<div>전체
						<input type="hidden" name="categoryDetailName" value="전체">
						<button id='filterDeleteBtn'><i class='fas fa-times'></i></button>
					</div>
				</c:if>
				<i class="fas fa-times reset-button"></i>
			</div>
			<br>
			<div align="center">
				<button type="submit" class="kakao-button">검색</button>
			</div>
		</form>
	</div>
	
	<script>
		// 가격을 통합 필터에 넣는 메소드
		function upPrice(){
			var minPrice = $("#minPrice").val();
			var maxPrice = $("#maxPrice").val();
			
			if(minPrice == ""){
				minPrice = 0;
			}
			
			if(maxPrice > minPrice){
				var filterDiv = $("<div>").text(minPrice + " ~ " + maxPrice + "원");
				var deleteBtn = $("<button id='filterDeleteBtn'>").html("<i class='fas fa-times'></i>");
				var inputMin = $("<input type='hidden'>").attr("name", "minPrice").val(minPrice);
				var inputMax = $("<input type='hidden'>").attr("name", "maxPrice").val(maxPrice);
				
				filterDiv.append(inputMin).append(inputMax).append(deleteBtn);
				
				$(".union-filter").append(filterDiv);
			}
			else if (maxPrice == minPrice){
				var filterDiv = $("<div>").text(maxPrice + "원");
				var deleteBtn = $("<button id='filterDeleteBtn'>").html("<i class='fas fa-times'></i>");
				var inputMin = $("<input type='hidden'>").attr("name", "minPrice").val(minPrice);
				var inputMax = $("<input type='hidden'>").attr("name", "maxPrice").val(maxPrice);
				
				filterDiv.append(inputMin).append(inputMax).append(deleteBtn);
				
				$(".union-filter").append(filterDiv);
			}
			else{
				$("#minPrice").focus();
			}
		}
	
		$(function(){
			// 상세 필터에 사용하기 위해 전역변수를 사용
			var defaultFilter;
			
			// default filter 조건 클릭시
			$("#defaultFilter li").click(function(){
				defaultFilter = $(this).text();
				
				$("#firstFilter li").remove();
				$("#secondFilter li").remove();
				$("#thirdFilter li").remove();
				
				switch(defaultFilter){
					case "지역" :
						locationFilter();
						break;
					case "카테고리" :
						categoryFilter();
						break;
					case "상품상태" :
						$("#firstFilter li").remove();
						$("#firstFilter").append($("<li class='list-group-item'>").text("중고"));
						$("#firstFilter").append($("<li class='list-group-item'>").text("새상품"));
						break;
					case "판매유형" :
						sellTypeFilter();
						break;
					case "거래방식" :
						$("#firstFilter li").remove();
						$("#firstFilter").append($("<li class='list-group-item'>").text("택배"));
						$("#firstFilter").append($("<li class='list-group-item'>").text("직거래"));
						break;
				}
			});
			
			// 지역(도) 필터
			function locationFilter(){
				$.ajax({
					url : "${contextPath}/board/locationFilter",
					success : function(result){
						$("#firstFilter li").remove();
						for(var loc of result){
							var li = $("<li class='list-group-item'>");
							li.text(loc.locationName);
							$("#firstFilter").append(li);
						}
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
			
			// 카테고리 필터
			function categoryFilter(){
				$.ajax({
					url : "${contextPath}/board/categoryFilter",
					success : function(result){
						$("#firstFilter li").remove();
						for(var cate of result){
							var li = $("<li class='list-group-item'>");
							li.text(cate.categoryName);
							$("#firstFilter").append(li);
						}
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
			
			// 판매유형 필터
			function sellTypeFilter(){
				$.ajax({
					url : "${contextPath}/board/sellTypeFilter",
					success : function(result){
						$("#firstFilter li").remove();
						for(var kind of result){
							var li = $("<li class='list-group-item'>");
							li.text(kind.kindName);
							$("#firstFilter").append(li);
						}
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
			
			var filterOpt;
			
			// 지역(시, 구), 카테고리 상세 필터
			$("#firstFilter").on("click", "li", function(){
				filterOpt = $(this).text();
				
				switch(defaultFilter){
				
				case "지역" : 
					upFilter("locationName", filterOpt);
					$.ajax({
						url : "${contextPath}/board/locationDeep1Filter",
						data : {
							locationName : filterOpt
						},
						success : function(result){
							$("#secondFilter li").remove();
							for(var locDe1 of result){
								var li = $("<li class='list-group-item'>");
								li.text(locDe1.locationDetail1);
								$("#secondFilter").append(li);
							}
						},
						error : function(){
							console.log("통신 오류");
						}
					});
					break;
				case "카테고리" : 
					upFilter("categoryName", filterOpt);
					$.ajax({
						url : "${contextPath}/board/categoryDetailFilter",
						data : {
							categoryName : filterOpt
						},
						success : function(result){
							$("#secondFilter li").remove();
							for(var cateDe of result){
								var li = $("<li class='list-group-item'>");
								li.text(cateDe.categoryDetailName);
								$("#secondFilter").append(li);
							}
						},
						error : function(){
							console.log("통신 오류");
						}
					});
					break;
				case "상품상태" :
					upFilter("productStatus", filterOpt);
					break;
				case "판매유형" :
					upFilter("kindNo", filterOpt);
					break;
				case "거래방식" :
					upFilter("sellWay", filterOpt);
					break;
				}
			});
			
			// 지역(동) 필터
			$("#secondFilter").on("click", "li", function(){
				var locD1 = $(this).text();
				
				
				if(defaultFilter == "지역"){
					upFilter("locationDetail1", locD1);
					$.ajax({
						url : "${contextPath}/board/locationDeep2Filter",
						data : {
							locationName : filterOpt,
							locationDetail1 : locD1
						},
						success : function(result){
							$("#thirdFilter li").remove();
							for(var locDe2 of result){
								var li = $("<li class='list-group-item'>");
								li.text(locDe2.locationDetail2);
								$("#thirdFilter").append(li);
							}
						},
						error : function(){
							console.log("통신 오류");
						}
					});
				}
				else{
					upFilter("categoryDetailName", locD1);
				}
			});

			$("#thirdFilter").on("click", "li", function(){
				upFilter("locationDetail2", $(this).text());
			});
			
			// 통합 필터에 내용을 올리는 메소드
			function upFilter(name, filterOption){
				var filterDiv = $("<div>").text(filterOption);
				var deleteBtn = $("<button id='filterDeleteBtn'>").html("<i class='fas fa-times'></i>");
				if(filterOption == "제품 요청"){
					filterOption = 1;
				}
				else if(filterOption == "판매"){
					filterOption = 2;	
				}
				else if(filterOption == "중고"){
					filterOption = "RE";
				}
				else if(filterOption == "새상품"){
					filterOption = "NEW";
				}
				var input = $("<input type='hidden'>").attr("name", name).val(filterOption);
				filterDiv.append(input).append(deleteBtn);
				$(".union-filter").append(filterDiv);
			}
			
			// 통합 필터에 올라간 조건 제거
			$(".union-filter").on("click", "button", function(){
				$(this).closest("div").remove();
			});
			
			$(".union-filter i").click(function(){
				$(".union-filter div").remove();
			});
		
		});
	</script>
	<br>
	<div class="list-area">
		<div class="recommended-products">		
			<c:choose>
				<c:when test="${empty priceSearchBoard && empty productSearch}">
					<c:forEach var="list" items="${searchBoard}">
						<div class='product-card' style='margin-right: 30px;'>
							<img src="${contextPath}${list.titleImg}">
							<div class='product-info'>
								<input type="hidden" name="boardNo" value="${list.boardNo}">
								<div class='product-title'>${list.boardTitle}
									<c:if test="${list.boardDeclaration == 'Y'}">
										&nbsp;<i style='color:red;' class="fas fa-exclamation-circle"></i>
									</c:if>
								</div>
								<div style='color: red;'>${list.price}원</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${not empty productSearch}">
					<c:forEach var="list" items="${productSearch}">
						<div class='product-card' style='margin-right: 30px;'>
							<img src="${contextPath}${list.titleImg}">
							<div class='product-info'>
								<input type="hidden" name="boardNo" value="${list.boardNo}">
								<div class='product-title'>${list.boardTitle}
									<c:if test="${list.boardDeclaration == 'Y'}">
										&nbsp;<i style='color:red;' class="fas fa-exclamation-circle"></i>
									</c:if>
								</div>
								<div style='color: red;'>${list.price}원</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="pList" items="${priceSearchBoard}">
						<div class='product-card' style='margin-right: 30px;'>
							<img src="${contextPath}${pList.titleImg}">
							<div class='product-info'>
								<input type="hidden" name="boardNo" value="${pList.boardNo}">
								<div class='product-title'>${pList.boardTitle}
									<c:if test="${pList.boardDeclaration == 'Y'}">
										&nbsp;<i style='color:red;' class="fas fa-exclamation-circle"></i>
									</c:if>
								</div>
								<div style='color: red;'>${pList.price}원</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".recommended-products").on("click", ".product-card", function(){
				var productInfo = $(this).children("div");
				var boardNo = $(productInfo).children().first().val();
				
				location.href="${contextPath}/board/boardDetailForm?boardNo=" + boardNo;
			});
		});
	</script>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>
</html>