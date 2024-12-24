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
		margin: 0 auto;
		width: 1000px;
		height: 600px;
		position: relative;
	}
	
	.login-area{
		border-radius: 10px;
		width: 40%;
		height: 60%;
		position: absolute;
		margin: auto;
		top: 0px;
		bottom: 0px;
		left: 0px;
		right: 0px;
	}
	
	.login-box {
	    background-color: #ffffff;
	    border-radius: 10px;
	    padding: 30px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    text-align: center;
	}
	
	h2 {
	    font-size: 24px;
	    margin-bottom: 20px;
	    color: #333;
	}
	
	.input-group {
	    margin-bottom: 15px;
	}
	
	.input-group input {
	    width: 100%;
	    padding: 12px;
	    font-size: 16px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    box-sizing: border-box;
	}
	
	.input-group input:focus {
	    border-color: #ffdd00;
	    outline: none;
	}
	
	.btn-login {
	    width: 100%;
	    padding: 12px;
	    border: none;
	    border-radius: 5px;
	    font-size: 16px;
	    cursor: pointer;
	    background-color: #ffdd00; /* 카카오톡 노란색 */
	    color: #3e3e3e;
	    font-weight: bold;
	}
	
	.btn-login:hover {
	    background-color: #f7c600;
	}
	
	/* 기본 스타일 */
	.saveIdBox-area {
	    display: flex;
	    align-items: center;
	    font-size: 14px;
	    color: #3e3e3e;
	}
	
	/* 체크박스 스타일 */
	.saveIdCheckbox {
	    display: none; /* 기본 체크박스 숨기기 */
	}
	
	/* 체크박스를 대신할 커스텀 박스 스타일 */
	.saveIdBox-area label {
	    position: relative;
	    padding-left: 30px; /* 체크박스를 위한 공간 */
	    cursor: pointer;
	}
	
	/* 체크박스를 대신할 커스텀 아이콘 */
	.saveIdBox-area label::before {
	    content: '';
	    position: absolute;
	    left: 0;
	    top: 2px;
	    width: 20px;
	    height: 20px;
	    background-color: #fff;
	    border: 2px solid #ccc;
	    border-radius: 4px;
	    transition: all 0.3s ease;
	}
	
	/* 체크박스가 체크되었을 때 */
	.saveIdCheckbox:checked + label::before {
	    background-color: #ffdd00; /* 카카오의 노란색 */
	    border-color: #ffdd00; /* 카카오의 노란색 */
	    box-shadow: 0 0 0 4px rgba(255, 221, 0, 0.2); /* 살짝 어두운 그림자 */
	}
	
	/* 체크 표시 */
	.saveIdCheckbox:checked + label::after {
	    content: '✔'; /* 체크표시 */
	    position: absolute;
	    left: 3px;
	    top: 0;
	    font-size: 12px;
	    color: white;
	    font-weight: bold;
	}
	
	/* 체크박스 Hover 효과 */
	.saveIdBox-area label:hover::before {
	    border-color: #ffdd00;
	}
	
	.loginTitle-area{
		font-size: 24px;
		font-weight: bold;
	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="outer">
	    <div class="login-area">
		    <div class="login-box">
		        <form action="loginUser" method="post">
		        	<h2>로그인</h2>
			        <br>
			        <!-- 이메일 입력 필드 -->
			        <div class="input-group">
			            <input type="text" placeholder="아이디" name="userId" id="userId" required>
			        </div>
			        
			        <!-- 비밀번호 입력 필드 -->
			        <div class="input-group">
			            <input type="password" placeholder="비밀번호" name="userPwd" id="userPwd" required>
			        </div>
			        
			        <div class="saveIdBox-area">
					    <input type="checkbox" name="saveId" id="saveId" class="saveIdCheckbox">
					    <label for="saveId">ID 저장</label>
					</div>
			        <br>
			        
			        <!-- 로그인 버튼 -->
			        <button type="submit" class="btn-login">로그인</button>
		        </form>
		    </div>
		</div>
	</div>
	
	
	<script>
		$(function(){
			var saveId = "${cookie.userId.value}";
			
			if(saveId != null){
				$("#userId").val(saveId);
				$("#saveId").attr("checked", true);
			}
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>