<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* 전체 푸터 스타일 */
	.footer {
	    background-color: #333; /* 어두운 배경색 */
	    color: #fff; /* 흰색 글씨 */
	    padding: 40px 20px; /* 위아래 40px, 좌우 20px 여백 */
	    font-family: Arial, sans-serif; /* 기본 폰트 */
	}
	
	/* 푸터 내용 섹션 */
	.footer-content {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 30px; /* 섹션 간격 */
	}
	
	/* 각 섹션 스타일 */
	.footer-section {
	    width: 30%;
	}
	
	/* 섹션 제목 스타일 */
	.footer-section h3 {
	    font-size: 18px;
	    margin-bottom: 15px;
	    color: #ffe600; /* 카카오 색상 노란색 */
	}
	
	/* 링크 목록 스타일 */
	.footer-section ul {
	    list-style: none;
	    padding: 0;
	}
	
	.footer-section ul li {
	    margin: 10px 0;
	}
	
	.footer-section ul li a {
	    text-decoration: none;
	    color: #fff;
	    font-size: 14px;
	}
	
	.footer-section ul li a:hover {
	    color: #ffe600; /* 호버 시 노란색 */
	}
	
	/* 푸터 하단 텍스트 */
	.footer-bottom {
	    text-align: center;
	    font-size: 14px;
	    color: #bbb;
	    margin-top: 20px;
	}
	
	.footer-bottom p {
	    margin: 0;
	}
	
	/* 소셜 미디어 아이콘 스타일 */
	.social-icons {
	    display: flex;
	    justify-content: center; /* 아이콘을 가운데 정렬 */
	    gap: 20px; /* 아이콘 간의 간격 */
	    padding: 10px;
	}
	
	.social-icon {
	    display: inline-block;
	    width: 50px; /* 아이콘 크기 */
	    height: 50px;
	    border-radius: 50%; /* 둥근 모서리 */
	    overflow: hidden; /* 아이콘이 원형으로 잘리도록 */
	    transition: transform 0.3s ease, background-color 0.3s ease;
	}
	
	.social-icon img {
	    width: 80%; /* 이미지 크기 */
	    height: 80%;
	    object-fit: contain; /* 이미지 비율 유지 */
	    margin: 10% auto; /* 아이콘 중앙에 배치 */
	}
	
	/* 호버 시 효과 */
	.social-icon:hover {
	    transform: scale(1.1); /* 호버 시 아이콘 확대 */
	}
		
</style>

</head>
<body>

	<div class="footer-area">
		<div class="footer">
			<div class="footer-content">
				<div class="footer-section">
					<h3>회사 정보</h3>
					<ul>
						<li><a href="#">회사 소개</a></li>
						<li><a href="#">서비스 약관</a></li>
						<li><a href="#">개인정보 처리방침</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>

				<div class="footer-section">
					<h3>빠른 링크</h3>
					<ul>
						<li><a href="">홈</a></li>
						<li><a href="#">상품 카테고리</a></li>
						<li><a href="#">프로모션</a></li>
						<li><a href="#">블로그</a></li>
					</ul>
				</div>

				<div class="footer-section">
					<div class="social-icons">
						<a href="#" class="social-icon"> 
							<img src="/finalProject/resources/facebook.png">
						</a> 
						<a href="#" class="social-icon"> 
							<img src="/finalProject/resources/twitter.png">
						</a> 
						<a href="#" class="social-icon"> 
							<img src="/finalProject/resources/instagram.png">
						</a> 
						<a href="#" class="social-icon"> 
							<img src="/finalProject/resources/youtube.png">
						</a> 
						<a class="social-icon" id="adminPage"> 
							<img src="/finalProject/resources/kakao.png">
						</a>
					</div>
				</div>
			</div>
				
			<script>
				$(function(){
					$("#adminPage").on("click", function(){
						if("${loginUser.userId}" == "admin"){
							$("#adminPage").attr("data-toggle", "modal").attr("data-target", "#adpage");
						}
						
						
					});
				});
				
				
			</script>
			
			
				<div class="modal" id="adpage">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="color: black;">관리자 페이지 로그인</h4>
        
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
<form action="${contextPath}/user/toAdmin" method="POST">
      <!-- Modal body -->
      <div class="modal-body" style="color: black;">
        <input type="password" name="userPwd" id="passwordInput" placeholder="비밀번호를 입력하세요.">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="submit" class="btn btn-warning" id="adpg">로그인</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
</form>
    </div>
  </div>
</div>
			<div class="footer-bottom">
				<p>KH 중고마켓은 통신판매중개자로서 거래 당사자가 아니며 판매 회원과 구매 회원 간의 상품거래 정보 및 거래에 관여하지 않고,</p><p>어떠한 의무와 책임도 부담하지 않습니다.</p>
				<br>
				<p>&copy; 2024 KH 중고마켓. All rights reserved.</p>
			</div>
		</div>

	</div>

</body>
</html>