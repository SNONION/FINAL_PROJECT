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
		display: flex;
		width: 1000px;
		height: auto;
		margin: auto;
	}
	
	.mypage-menuBar{
		width: 20%;
		height: 100%;
	}
	
	.mypage-content{
		width: 80%;
		display: flex;
	    justify-content: center;  /* 수평 중앙 정렬 */
	    align-items: center;      /* 수직 중앙 정렬 */
	    height: 100%;             /* 부모 요소의 높이를 100%로 설정 */
	}
	
	.page-title{
		width: 80%;
		height: 10%;
		display: flex;
		margin: auto;
	    align-items: center;      /* 세로 중앙 정렬 */
	}
	
	.title{
		font-size: 24px;
		font-weight: bold;
	}
	
	.margin-area{
		width: 100%;
		height: 20px;
	}
	
	.menuBar-area{
		margin: auto;
		width: 80%;
		height: 80%;
	}
	
	#sub-title-area{
		font-size: 18px;
		font-weight: bold;
	}
	
	#menu_ul{
		text-decoration: none;
		list-style-type: none;
		padding: 5px 10px;
	}
	
	#mypage-menu-btn{
		font-size: 12px;
		color: gray;
		text-decoration: none;
	}
	
	#mypage-menu-btn:hover {
	  cursor: pointer;
	  color: black;
	}
	
	#menu_ul li {
	  margin-bottom: 5px;
	}
	
	.no-items {
	    font-size: 24px;          /* 글씨 크기 24px */
	    color: gray;              /* 글씨 색상 회색 */
	    align-items: center;      /* 수직 중앙 정렬 */
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

	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<div class="mypage-menuBar">
			<div class="page-title">
				<div class="title"><a href="${contextPath}/user/mypage" style="color: black; text-decoration: none;">마이페이지</a></div>
			</div>
			<div class="margin-area"></div>
			<div class="menuBar-area">
				<span id="sub-title-area">거래정보</span>
				<ul id="menu_ul">
					<li><a href="${contextPath}/board/buyProductList" id="mypage-menu-btn">구매내역</a><br></li>
					<li><a href="#" id="mypage-menu-btn">택배내역</a><br></li>
					<li><a href="${contextPath}/board/myPickPage" id="mypage-menu-btn">찜한상품</a><br></li>
					<li><a href="#" id="mypage-menu-btn">KAKAO 구매내역</a><br></li>
				</ul>
				<hr>
				<span id="sub-title-area">내 정보</span>
				<ul id="menu_ul">
					<li><a href="#" id="mypage-menu-btn">배송지관리</a><br></li>
					<li><a href="#" id="mypage-menu-btn">거래후기</a><br></li>
					<li><a href="${contextPath}/user/userInfoUpdateForm" id="mypage-menu-btn">내 정보 관리</a><br></li>
					<li><a href="${contextPath}/user/userDeleteForm" id="mypage-menu-btn">회원탈퇴</a><br></li>
				</ul>
			</div>
		</div>
		<div class="mypage-content">
			<c:choose>
				<c:when test="${empty pbList}">
					<div class="no-items" style="height: 500px;  display: flex; align-items: center;">찜한 상품이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<div class="recommended-products">		
						<c:forEach var="list" items="${pbList}">
							<div class='product-card' style='margin-right: 30px;'>
								<img src="${contextPath}${list.titleImg}">
								<div class='product-info'>
									<input type="hidden" name="boardNo" value="${list.boardNo}">
									<div class='product-title'>${list.boardTitle}</div>
									<div style='color: red;'>${list.price}원</div>
								</div>
							</div>
						</c:forEach>
					</div>
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
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>