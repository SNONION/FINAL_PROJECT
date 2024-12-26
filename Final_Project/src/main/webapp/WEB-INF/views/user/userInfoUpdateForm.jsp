<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		height: 90%;
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
	}
	
	.mypage-content {
        font-family: 'Noto Sans', sans-serif;
        max-width: 700px;
        margin: 0 auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .user-info-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .user-info-table td {
        padding: 12px;
        font-size: 14px;
        color: #555;
        vertical-align: middle;
    }

    .user-info-table td label {
        display: block;
        margin-bottom: 5px;
    }

    .user-info-table span {
        display: inline-block;
        padding: 10px;
        background-color: #f5f5f5;
        border-radius: 8px;
        font-size: 14px;
        color: #333;
        width: 100%;
    }

    .submit-button {
        text-align: center;
    }

    .submit-button button {
        background-color: #ffcd00;
        color: #fff;
        border: none;
        padding: 12px 20px;
        border-radius: 50px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .submit-button button:hover {
        background-color: #e6b800;
    }

    .submit-button button:active {
        background-color: #cc9900;
    }
    
    #changeAddr {
	    border: none; 
	    display: inline-block; 
	    margin-left: 10px; 
	    color: gray;
	    background-color: transparent;
	    position: absolute; /* 겹치게 하기 위한 절대 위치 */
	    right: 20px; /* span의 오른쪽 끝에 배치 */
	    top: 50%; /* 수직 중앙에 배치 */
	    transform: translateY(-50%); /* 정확히 중앙 정렬 */
	}
	
	#changeAddr2 {
	    border: none; 
	    display: inline-block; 
	    margin-left: 10px; 
	    color: gray;
	    background-color: transparent;
	    position: absolute; /* 겹치게 하기 위한 절대 위치 */
	    right: 60px; /* span의 오른쪽 끝에 배치 */
	    top: 50%; /* 수직 중앙에 배치 */
	    transform: translateY(-50%); /* 정확히 중앙 정렬 */
	    display: none;
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
					<li><a href="#" id="mypage-menu-btn">KH페이 구매내역</a><br></li>
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
		    <table class="user-info-table">
		    	<tr>
		            <td><label for="userId">아이디</label></td>
		            <td><span id="userId">${loginUser.userId}</span></td>
		        </tr>
		        <tr>
		            <td><label for="email">이메일</label></td>
		            <td style="display: flex; align-items: center; position: relative;">
		            	<span id="email"><input type="email" name="email" value="${loginUser.email}" style="border: none; background-color: transparent;" required></span>
		            	<input type="button" onclick="changeOtherINfo();" id="changeAddr" value="변경" class="sign-up-btn">
		            </td>
		        </tr>
		        <tr>
		            <td><label for="phone">전화번호</label></td>
		            <td style="display: flex; align-items: center; position: relative;">
		            	<span id="phone"><input type="text" name="phone" value="${loginUser.phone}" style="border: none; background-color: transparent;" required></span>
		            	<input type="button" onclick="changeOtherINfo();" id="changeAddr" value="변경" class="sign-up-btn">
		            </td>
		        </tr>
		        <tr>
		            <td><label for="address">주소</label></td>
		            <td style="display: flex; align-items: center; position: relative;">
		            	<span id="address">${loginUser.address}</span>
		            	<input type="button" onclick="changeAddrConfirm();" id="changeAddr2" value="확정" class="sign-up-btn">
	            		<input type="button" onclick="sample4_execDaumPostcode();" id="changeAddr" value="변경" class="sign-up-btn">
		            </td>
		        </tr>
		        <tr>
		            <td><label for="warning_count">경고 횟수</label></td>
		            <td><span id="warning_count">${loginUser.warnningCount}</span></td>
		        </tr>
		        <tr>
		            <td><label for="create_date">회원가입일</label></td>
		            <td><span id="create_date">${loginUser.createDate}</span></td>
		        </tr>
		    </table>
		</div>
	</div>
	
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	               
	               	document.getElementById("address").innerText = roadAddr;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("address").innerText += " " + extraRoadAddr;
	                } else {
	                    document.getElementById("address").innerText += '';
	                }
	                
	                document.getElementById("changeAddr2").style.display = "block";
	            }
	        }).open();
	    }
		
		function changeAddrConfirm(){
			$.ajax({
				url : "${contextPath}/user/updateAddr",
				data : {
					address : $("#address").text()
				},
				success : function(msg){
					
					if(msg == "NNNNY"){
						alertify.alert("알림 메시지", "주소가 변경되었습니다.");
					}
					
					$("#changeAddr2").css("display", "none");
				},
				error : function(){
					console.log("통신 오류")
				}
			});
		}
		
		function changeOtherINfo(){
			$.ajax({
				url : "${contextPath}/user/updateOtherInfo",
				data : {
					email : $("input[name=email]").val(),
					phone : $("input[name=phone]").val()
				},
				success : function(msg){
					
					if(msg == "NNNNY"){
						alertify.alert("알림 메시지", "변경되었습니다.");
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>