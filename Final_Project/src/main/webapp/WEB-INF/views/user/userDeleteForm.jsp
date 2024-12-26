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

<Style>
	/* 전체적인 외부 컨테이너 스타일 */
	.outer {
	    margin: auto;
	    width: 1000px;
	    height: auto;
	    background-color: #fff;
	    border-radius: 10px;  /* 둥근 모서리 */
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  /* 부드러운 그림자 */
	    padding: 30px;
	}
	
	/* 내부 콘텐츠 영역 */
	.inner {
	    margin: auto;
	    margin-top: 70px;
	    width: 80%;
	    height: 90%;
	}
	
	/* 제목 스타일 */
	#deleteTitle {
	    text-align: center;
	    font-size: 28px;
	    font-weight: bold;
	    color: #333;  /* 기본 텍스트 색상 */
	    margin-bottom: 20px;
	}
	
	/* 회원 탈퇴 안내 내용 텍스트 스타일 */
	p {
	    color: #666;  /* 텍스트 색상 */
	    font-size: 16px;
	    line-height: 1.6;  /* 줄 간격 */
	    text-align: left;
	}
	
	/* 강조된 텍스트 (섹션 제목) */
	b {
	    color: #333;
	    font-weight: bold;
	}
	
	/* 비밀번호 입력란 스타일 */
	.userDeleteSignIn {
	    text-align: center;
	    margin-top: 30px;
	}
	
	#deleteSignIn {
	    width: 80%;
	    padding: 12px;
	    font-size: 16px;
	    border: 1px solid #ccc;
	    border-radius: 8px;
	    margin-bottom: 10px;
	    outline: none;
	    transition: border-color 0.3s;
	}
	
	#deleteSignIn:focus {
	    border-color: #f0c16f; /* 카카오 스타일의 옅은 노란색 */
	}
	
	/* 비밀번호 입력 안내 텍스트 */
	p[style="color: gray; font-size: 12px;"] {
	    color: #999;
	    font-size: 12px;
	}
	
	/* 탈퇴 버튼 스타일 */
	button {
	    background-color: #fee500; /* 카카오의 대표 색상인 노란색 */
	    color: #3c1e1e;  /* 텍스트 색상 */
	    font-size: 16px;
	    padding: 12px 20px;
	    border: none;
	    border-radius: 8px;
	    cursor: pointer;
	    transition: background-color 0.3s, transform 0.2s;
	}
	
	button:hover {
	    background-color: #fcd500; /* 버튼 색상 밝게 */
	    transform: scale(1.05); /* 마우스 오버 시 살짝 커짐 */
	}
	
	button:active {
	    transform: scale(1); /* 클릭 시 원래 크기로 돌아옴 */
	}

	
</Style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="outer">
		<div class="inner">
			<div id="deleteTitle">회원 탈퇴 안내</div>
			<p align="center">
				<br><br>
				<b style="font-size: 20px;">안녕하세요, ${loginUser.nickname}님.</b><br><br>

				회원 탈퇴를 원하시는 경우, 아래 사항을 꼭 확인하시고 진행해 주세요:<br><br>
				
				<b>1. 탈퇴 후 서비스 이용 불가</b><br>
				탈퇴 처리 후에는 해당 계정으로 로그인이 불가능하며, 모든 개인 정보가 삭제됩니다. 탈퇴된 계정은 복구할 수 없습니다.<br><br>
				
				<b>2. 적립된 포인트 및 혜택 소멸</b><br>
				회원 탈퇴 시, 적립된 포인트나 미사용된 혜택이 모두 소멸됩니다. 탈퇴 전 사용 가능한 포인트나 혜택을 꼭 확인해 주세요.<br><br>
				
				<b>3. 탈퇴 요청 방법</b><br>
				회원 탈퇴는 고객센터를 통해 요청하거나, 사이트 내 '회원 탈퇴' 버튼을 이용해 직접 신청하실 수 있습니다. 탈퇴 절차가 완료되면 안내 메시지가 발송됩니다.<br><br>
				
				<b>4. 서비스 이용 기록 삭제</b><br>
				회원 탈퇴 후, 서비스 이용 기록(주문 내역, 게시글 등)은 삭제되며 복구할 수 없습니다. 필요한 기록은 미리 저장해 주세요.<br><br>
				
				<b>5. 탈퇴 후 재가입</b><br>
				회원 탈퇴 후 재가입은 가능합니다. 단, 이전에 이용하셨던 계정 정보나 혜택은 복구되지 않습니다.<br><br>
				
				탈퇴 절차에 대한 추가적인 궁금증이 있으시면 고객센터로 문의해 주세요.<br><br>
				
				감사합니다.<br>
			</p>
			<br>
			<div class="userDeleteSignIn" align="center">
				<input type="password" id="deleteSignIn" name="deleteSignIn" placeholder="비밀번호 입력" required>
				<p style="color: gray; font-size: 12px; margin-left: 75px;">회원 삭제를 원하시는 경우 비밀번호를 작성 후 버튼을 눌러주세요.</p>
				<br>
				<button type="button" onclick="checkPwd();" class="btn btn-danger">회원 탈퇴</button>
				<br><br>
			</div>
		</div>
	</div>
	
	<script>
		function checkPwd(){
			$.ajax({
				url : "${contextPath}/user/checkPwd",
				data : {
					userPwd : $("#deleteSignIn").val()
				},
				success : function(msg){
					
					if(msg == 'NNNNY'){
						location.reload();
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>