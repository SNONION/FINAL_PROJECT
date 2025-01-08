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
		width: 100%;
		height: 100%;
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
	
	.myInfo-area {
	  width: 100%;
	  height: 250px;
	  display: flex;
	}
	
	#info1-area, #info2-area {
	  width: 50%;
	  height: 100%;
	}
	
	#main-area, #other-area {
	  width: 100%;
	  height: 50%;
	  display: flex;                /* 플렉스 레이아웃 */
	  flex-direction: column;       /* 세로로 배치 */
	  justify-content: center;      /* 수평 중앙 정렬 */
	  align-items: center;          /* 수직 중앙 정렬 */
	}
	
	#nick {
	  display: flex;                /* 이미지와 텍스트를 가로로 배치 */
	  align-items: center;          /* 수직 중앙 정렬 */
	  margin-bottom: 10px;          /* 닉네임과 소개 사이 간격 */
	}
	
	#nick img {
	  border-radius: 50%;           /* 이미지 원형 처리 */
	  width: 50px;                 /* 이미지 크기 */
	  height: 50px;                /* 이미지 크기 */
	  margin-right: 10px;           /* 이미지와 텍스트 사이 간격 */
	}
	
	#nick img:hover {
	  cursor: pointer;
	  background-color: lightgray;
	}
	
	#nick span {
	  font-size: 24px;             /* 텍스트 크기 */
	  font-weight: bold;            /* 텍스트 두껍게 */
	}
	
	#intro-area {
	  width: 100%;                  /* 소개 영역 너비 */
	  text-align: center;           /* 텍스트 중앙 정렬 */
	}
	
	#intro-area span {
	  font-size: 1em;               /* 소개 텍스트 크기 */
	  color: gray;                  /* 소개 텍스트 색상 */
	}
	
	#table-custom{
		width: 350px;
	}
	
	#trust-point{
		font-size: 24px;
		font-weight: bold;
	}
	
	#main2-area {
	    display: flex;                /* 자식 요소들을 가로로 배치 */
	    justify-content: center;      /* 자식 요소들을 수평 중앙에 배치 */
	    align-items: center;          /* 자식 요소들을 수직 중앙에 배치 */
	    width: 100%;
	    height: 50%;
	}
	
	.progress-container {
		margin-top: 20px;
	    position: relative;           /* 프로세스 바의 자식 요소인 trust-point 위치를 제어하기 위한 기준 설정 */
	    display: flex;
	    flex-direction: column;       /* 프로세스 바와 trust-point를 수직으로 배치 */
	    align-items: left;          /* trust-point를 수평 중앙에 배치 */
	    width: 90%;
	}
	
	/* 프로세스 바 기본 스타일 */
	.progress {
	    width: 250px;               /* 프로세스 바의 너비 */
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
	
	#trust-point {
	    position: absolute;           /* trust-point를 프로세스 바 위에 위치 */
	    top: -25px;                   /* 프로세스 바 위로 올라가도록 설정 */
	    font-size: 24px;              /* 글자 크기 설정 */
	    font-weight: bold;            /* 글자 굵기 설정 */
	    color: #333;                  /* 글자 색상 */
	}
	
	#trust-img{
		margin-left: 30px;
	}
	
	#see-grade:hover{
		cursor: pointer;
	}
	
	.sellProduct-area{
		width: 100%;
		height: 700px;
	}
	
	.sellProduct-title{
		width: 100%;
		height: 10%;
	}
	
	#sp-title{
		font-size: 24px;
	}
	
	.nav-tabs a:hover{
		color: black;
	}	
	
	#mypage-a-tag{
		padding: 10px 15px; /* 메뉴 항목 여백 */
	    border-radius: 0px; /* 둥근 모서리 */
	}
	
	.pagination-sm a{
		color: black;
	}
	
	.imgBox{
		border: 1px solid black;
		width: 200px;
		height: 200px;
		margin: auto;
	}
	
	#afterImg-area{
		cursor: pointer;
		display: flex;
	    align-items: center; /* 수직 가운데 정렬 */
	    justify-content: center; /* 수평 가운데 정렬 (선택 사항) */
	    color: lightgray;
	    font-size: 12px;
	}
	
	#introTextArea:hover{
		background-color: lightgray;
		cursor: pointer;
	}
	
	.textarea-container {
		position: relative;
	}
	
	#introTextArea {
		width: 100%;
		border-radius: 10px;
	}
	
	.change-button {
		position: absolute;
		z-index: 10;
		top: 50%;
		right: 25px; /* 오른쪽 끝에 위치 */
		transform: translateY(-50%); /* 버튼을 수직 중앙에 맞춤 */
		background: transparent; /* 배경을 투명으로 설정 */
		border: none;
		color: gray; /* 텍스트 색상 */
		font-size: 10px; /* 폰트 크기 설정 */
		cursor: pointer; /* 마우스를 올렸을 때 커서 변경 */
	}
	
	.change-button:hover {
		color: black;
	}

	#changeNick:hover{
		cursor: pointer;
	}
	
	.card{
		margin-top: 20px;
	}
	
	.card:hover{
		cursor: pointer;
	}
	
	/* 제목 스타일 */
	.card-title {
	    font-size: 1.25rem;  /* 글자 크기 조금 크게 */
	    font-weight: 600;    /* 좀 더 두꺼운 글씨 */
	    color: #333;         /* 다크 그레이 색상 */
	    margin-bottom: 10px; /* 아래 마진 추가 */
	    text-align: center;  /* 제목 가운데 정렬 */
	    line-height: 1.4;    /* 줄 간격 */
	    transition: color 0.3s ease; /* 마우스를 올렸을 때 색상 변환 */
	    
	    /* 한 줄로만 나오게 하고, 넘칠 경우 '...'으로 표시 */
	    white-space: nowrap;  /* 줄바꿈 방지 */
	    overflow: hidden;     /* 넘치는 내용 숨기기 */
	    text-overflow: ellipsis;  /* 넘치는 텍스트를 '...'으로 표시 */
	}
	
	.card-title:hover {
	    color: #007bff;      /* 마우스를 올렸을 때 파란색으로 변경 */
	}
	
	/* 가격 스타일 */
	.card-text {
	    font-size: 1rem;        /* 적당한 크기의 글씨 */
	    color: #e74c3c;         /* 빨간색 */
	    font-weight: 500;       /* 중간 굵기의 글씨 */
	    margin-top: 5px;        /* 위쪽 여백 */
	    text-align: center;     /* 가격 가운데 정렬 */
	    transition: color 0.3s ease; /* 마우스를 올렸을 때 색상 변환 */
	}
	
	.card-text:hover {
	    color: #c0392b;         /* 마우스를 올렸을 때 좀 더 어두운 빨간색 */
	}
	
	/* 카드 바디 스타일 */
	.card-body {
	    padding: 15px;
	    text-align: center;   /* 가운데 정렬 */
	    background-color: #fff; /* 배경색 흰색 */
	    border-top: 1px solid #f0f0f0; /* 카드 상단에 얇은 선 추가 */
	}
	
	.scroll-container {
	    width: 100%;
	    height: 450px;
	    overflow-x: scroll;  /* 가로 스크롤 항상 표시 */
	    white-space: nowrap;  /* 이미지 및 카드들이 한 줄로 나열되도록 */
	    border: none;
	    
	    /* 스크롤바 스타일링 (Firefox에서 적용) */
	    scrollbar-width: thin; /* Firefox에서 스크롤바 너비를 얇게 */
	    scrollbar-color: #888 #f1f1f1; /* Firefox에서 색상 설정 */
	}
	
	/* 크롬, 사파리, 엣지에서 스크롤바 스타일링 */
	.scroll-container::-webkit-scrollbar {
	    height: 8px; /* 스크롤바 높이 설정 */
	}
	
	.scroll-container::-webkit-scrollbar-thumb {
	    background-color: #888; /* 스크롤바 원형 부분 색상 */
	    border-radius: 50px; /* 원형 스크롤바 */
	}
	
	.scroll-container::-webkit-scrollbar-track {
	    background: transparent; /* 스크롤바 트랙 배경 색 투명 */
	}
	
	.scroll-container::-webkit-scrollbar-button {
	    display: none; /* 기본 화살표 제거 */
	}
	
	#home {
	    display: flex;  /* 이미지 및 카드들이 가로로 나열되도록 */
	    justify-content: flex-start;
	    align-items: center;
	    flex-wrap: nowrap;  /* 한 줄로 나열되도록 설정 */
	}
	
	.card {
	    width: 200px;
	    height: 200px;
	    margin: auto;
	    margin-top: 20px;
	    margin-right: 10px;
	    flex-shrink: 0; /* 카드가 압축되지 않도록 */
	}
	
	.card img {
	    width: 100%;
	    object-fit: cover; /* 이미지를 잘라서 카드에 맞게 크기를 맞춤 */
	}
	
	.card-body {
	    padding: 10px;
	}
	
	.card-title, .card-text {
	    margin: 0;
	    font-size: 14px;
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
</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<div class="mypage-content">
			<br>
			<div class="myInfo-area">
				<div id="info1-area">
					<div id="main-area">
						<div id="nick">
							<input type="file" name="changeUserImg" style="display: none;">
							<img id="" data-toggle="modal" data-target="#profileChangeModal" src="${contextPath}${sellerLogin.userImg}">
							<span>${sellerLogin.nickname}
								<c:if test="${sellerLogin.trustPoint >= 10}">
									&nbsp;<i class="fas fa-star"></i>
								</c:if>
								<c:if test="${sellerLogin.trustPoint < 1}">
									&nbsp;<i class="fas fa-skull"></i>
								</c:if>
							</span>
						</div>
						<div id="intro-area" class="textarea-container">
							<span><textarea id="introTextArea" style="border: none; text-align: center; resize: none; width: 350px;" maxlength="15" rows="1" readonly>${sellerLogin.introContent}</textarea></span>

						</div>
					</div>
					<div id="other-area">
						<table class="table" id="table-custom">
							<thead>
								<tr align="center" style="color: gray; font-size: 14px;">
									<th>구매횟수</th>
									<th>판매횟수</th>
									<th>거래후기</th>
								</tr>
							</thead>
							<tbody>
								<tr align="center">
									<td>${sellerInfo.buyCount}</td>
									<td>${sellerInfo.sellCount}</td>
									<td>${sellerInfo.replyCount}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div id="info2-area">
					<div id="main2-area">
						<span id="trust-img"><img src="${contextPath}${sellerInfo.trustImg}" width="70px" height="70px"></span>
						<div class="progress-container">
							<c:choose>
								<c:when test="${sellerLogin.trustPoint > 7}">
									<div class="progress">
										<div class="progress-bar bg-success"></div>
									</div>
								</c:when>
								<c:when test="${sellerLogin.trustPoint > 4 && loginUser.trustPoint <= 7}">
									<div class="progress">
										<div class="progress-bar"></div>
									</div>
								</c:when>
								<c:when test="${sellerLogin.trustPoint > 3 && loginUser.trustPoint <= 4}">
									<div class="progress">
										<div class="progress-bar bg-info"></div>
									</div>
								</c:when>
								<c:when test="${sellerLogin.trustPoint > 2 && loginUser.trustPoint <= 3}">
									<div class="progress">
										<div class="progress-bar bg-warning"></div>
									</div>
								</c:when>
								<c:when test="${sellerLogin.trustPoint >= 0 && loginUser.trustPoint <= 2}">
									<div class="progress">
										<div class="progress-bar bg-danger"></div>
									</div>
								</c:when>
							</c:choose>
							<span id="trust-point">${sellerLogin.trustPoint}</span>
						</div>
					</div>
					<div id="other2-area">
						<p style="color: gray; font-size: 12px; text-align: justify;">
							&#8226; <b id="see-grade">신뢰 등급별 안내</b> <br> 
							${sellerInfo.gradeContent}
						</p>
					</div>
				</div>
			</div>
			<hr>
			<br>
			<div class="sellProduct-area">
				<div class="sellProduct-title">
					<b id="sp-title">내 상품</b>
				</div>
				<div>
					<ul class="nav nav-tabs nav-justified" id="myProductInfo">
						<li class="nav-item"><a id="mypage-a-tag" class="nav-link active" data-toggle="tab" href="#home">판매 중</a></li>
						<li class="nav-item"><a id="mypage-a-tag" class="nav-link" data-toggle="tab" href="#home">판매완료</a></li>
					</ul>
					<div class="tab-content scroll-container">
						<div class="tab-pane container active" id="home" style="height:370px; display: flex; justify-content: flex-start;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			// 신뢰도를 0.1에 1% 올라가도록 설정하는 메소드
			var trustPoint = "${sellerLogin.trustPoint}";
			$(".progress-bar").css("width", (trustPoint * 10) + "%");
			
			getBoard("${sellerLogin.userId}", "판매 중");
			
			$("#home").on("click", "div", function(){
				var boardNo = $(this).children().val();
				
				if(boardNo != null){
					location.href="${contextPath}/board/boardDetailForm?boardNo=" + boardNo;					
				}
			});
		});
		
		// 상품 게시판을 조회해오는 메소드
		$("#myProductInfo").on("click", "a", function(){
			var boardWriter = "${sellerLogin.userId}";
			var type= $(this).text();
			
			getBoard(boardWriter, type)
		});
		
		function getBoard(boardWriter, type){
			$.ajax({
				url : "${contextPath}/board/getSellerBoard",
				data : {
					boardWriter : boardWriter,
					type : type
				},
				success : function(result){
					
					$("#home div").remove();
					
					if(result == ""){
						$("#home").append($("<div style='height: 400px; display: flex; justify-content: center; align-items: center; font-size: 24px; color: gray; text-align: center;'>")
								  .text("선택된 조건에 해당하는 상품이 없습니다."));
					}
					else{
						for(var board of result){
							var imgPath = "${contextPath}" + board.titleImg;
							
							var div = $("<div class='card' style='width: 200px; height: 200px; margin: auto; margin-top: 80px; margin-right: 10px;'>");
							var img = $("<img>").attr("src", imgPath);
							var bodyDiv = $("<div class='card-body'>");
							var title = $("<h6 class='card-title'>").text(board.boardTitle);
							var priceTag = $("<p class='card-text'>").text(board.price + "원");
							
							var input = $("<input type='hidden'>").attr("name", "boardNo").val(board.boardNo);
							
							bodyDiv.append(title).append(priceTag);
							
							div.append(input).append(img).append(bodyDiv);
							$("#home").append(div);
						}
					}
					
				},
				error : function(){
					console.log("통신 오류");	
				}
			});
		};
		
		
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		
</body>
</html>