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
	.outer {
        width: 1000px;
        height: auto;
        margin: auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    .inner{
    	width: 80%;
    	height: 100%;
    	margin: auto;
    }

    #notice-header {
        text-align: center;
        margin-bottom: 20px;
    }

    #notice-title {
        font-size: 2.5em;
        color: #333;
    }

    #notice-content {
        margin-bottom: 30px;
        font-size: 1.2em;
        line-height: 1.6;
        color: #555;
    }

    #notice-date {
        font-size: 1em;
        color: #777;
        text-align: right;
    }

    #notice-date-text {
        font-weight: bold;
    }
    
    #notice-title input {
	    width: 100%;                /* 제목 input을 부모 요소에 맞게 가로로 꽉 차게 설정 */
	    font-size: 24px;           /* 제목 글씨 크기를 줄임 */
	    border: 1px solid #ccc;     /* 기본 테두리 스타일 */
	    padding: 8px;               /* 여백 추가 */
	    border-radius: 5px;         /* 둥근 테두리 */
	    box-sizing: border-box;     /* padding을 포함한 크기 계산 */
	}
	
	#notice-content textarea {
	    width: 100%;                /* 내용을 꽉 차게 설정 */
	    height: 400px;              /* 높이를 200px로 설정 (필요에 맞게 조정) */
	    font-size: 14px;             /* 텍스트 크기를 줄임 */
	    padding: 8px;               /* 여백 추가 */
	    border: 1px solid #ccc;     /* 기본 테두리 스타일 */
	    border-radius: 5px;         /* 둥근 테두리 */
	    resize: vertical;           /* 세로 크기만 조정 가능하도록 설정 */
	    box-sizing: border-box;     /* padding을 포함한 크기 계산 */
	}
	
    #boardCateSelect {
        padding: 10px 15px; /* 내부 여백 */
        border-radius: 25px; /* 둥근 모서리 */
        background-color: #fff; /* 배경색 흰색 */
        font-size: 16px; /* 글씨 크기 */
        font-weight: bold; /* 글씨 두껍게 */
        color: #333; /* 글씨 색상 */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 살짝 그림자 */
        transition: all 0.3s ease; /* 부드러운 전환 효과 */
    }

    #boardCateSelect:focus {
        outline: none; /* 포커스 시 기본 윤곽선 제거 */
        border-color: #ffe500; /* 포커스 시 테두리 색 변경 */
        box-shadow: 0 0 5px #ffe500; /* 포커스 시 그림자 강조 */
    }
	

</style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<button class="btn-kakao" style="float: left;" onclick="backBtn();">이전</button>
		<form action="insertAreaBoard" method="post">
			<button type="submit" class="btn-kakao" style="float: right; margin-right: 20px;">작성완료</button>
			<br><br><br>
		    <div class="inner">
				<!-- 카테고리 선택 -->
				<div id="areaBoard-cate" style="text-align: center; margin: 20px 0;">
					<select name="boardCateNo" id="boardCateSelect">
						<c:forEach var="cateB" items="${cList}">
							<option value="${cateB.boardCateNo}">${cateB.boardCateName}</option>
						</c:forEach>
					</select>
				</div>
				<br>
	
				<!-- 게시판 제목 -->
			    <div id="notice-header">
			        <h1 id="notice-title">
			        	<input type="text" name="areaTitle">
			        </h1>
			    </div>
			    
			    <!-- 게시판 내용 -->
			    <div id="notice-content">
			    	<button class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortRight();"><i class="fas fa-align-right"></i></button>
			    	<button class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortCenter();"><i class="fas fa-align-center"></i></button>
			    	<button class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortLeft();"><i class="fas fa-align-left"></i></button>
			        <p><textarea id="noticeContent" name="areaContent" style="resize: none;"></textarea></p>
			    </div>
			    
			    <!-- 게시판 작성 날짜 -->
			    <div id="notice-date">
			        <p>작성자: <span id="notice-date-text">${loginUser.userId}</span></p>
			        <p>작성위치: <span class="location-out" id="notice-date-text"></span></p>
			        <input type="hidden" name="areaWriter" value="${loginUser.userId}">
			    </div>
			    <br><br>
	    	</div>
	    </form>
	</div>
	
	<script>
	
		$(function(){
			var regionDepthName1 = sessionStorage.getItem("regionDepthName1");
			var regionDepthName2 = sessionStorage.getItem("regionDepthName2");
			var regionDepthName3 = sessionStorage.getItem("regionDepthName3");
			
			var input1 = $("<input type='hidden'>").attr("name", "locationName").val(regionDepthName1);
			var input2 = $("<input type='hidden'>").attr("name", "locationDetail1").val(regionDepthName2);
			var input3 = $("<input type='hidden'>").attr("name", "locationDetail2").val(regionDepthName3);
			
			$("#notice-date").append(input1, input2, input3);
			
			$(".location-out").text(regionDepthName1 + " " + regionDepthName2 + " " + regionDepthName3);
		})
	
		// 뒤로가기
		function backBtn(){
			location.href="${contextPath}/board/areaBoardForm?regionDepthName1=" + regionDepthName1 + "&regionDepthName2=" + regionDepthName1 + "&currentPage=1";
		}
		
		// 왼쪽 정렬
		function sortLeft(){
			$("#noticeContent").css("text-align","left");
		}
		
		// 중앙 정렬
		function sortCenter(){
			$("#noticeContent").css("text-align","center");
		}
		
		// 오른쪽 정렬
		function sortRight(){
			$("#noticeContent").css("text-align","right");
		}
		
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>