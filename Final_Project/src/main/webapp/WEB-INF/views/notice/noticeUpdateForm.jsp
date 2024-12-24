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
        height: 800px;
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

</style>

</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<button class="btn-kakao" style="float: left;" onclick="backBtn();">이전</button>
		<button class="btn-kakao" style="float: right; margin-right: 20px;" onclick="updateNoticeBtn();">수정완료</button>
		<br><br><br>
	    <div class="inner">
	    	<!-- 공지사항 제목 -->
		    <div id="notice-header">
		        <h1 id="notice-title">
		        	<input type="text" name="noticeTitle" value="${n.noticeTitle}">
		        </h1>
		    </div>
		    <!-- 공지사항 내용 -->
		    <div id="notice-content">
		    	<button class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortRight();"><i class="fas fa-align-right"></i></button>
		    	<button class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortCenter();"><i class="fas fa-align-center"></i></button>
		    	<button class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortLeft();"><i class="fas fa-align-left"></i></button>
		        <p><textarea id="noticeContent" name="noticeContent" style="resize: none;">${n.noticeContent}</textarea></p>
		    </div>
		    <!-- 공지사항 작성 날짜 -->
		    <div id="notice-date">
		        <p>작성자: <span id="notice-date-text">${n.noticeWriter}</span></p>
		    </div>
		    <br><br>
	    </div>
	</div>
	
	<script>
		// 뒤로가기
		function backBtn(){
			location.href="${contextPath}/board/toNotice"
		}
		
		// 게시물 수정하기 버튼
		function updateNoticeBtn(){
			var noticeTitle = $("input[name=noticeTitle]").val();
			var noticeContent = $("textarea[name=noticeContent]").val();
			
			$.ajax({
				url : "${contextPath}/board/updateNotice",
				data : {
					noticeNo : "${n.noticeNo}",
					noticeTitle : noticeTitle,
					noticeContent : noticeContent
				},
				success : function(result){
					
					if(result == "NNNNY"){
						location.href="${contextPath}/board/toNotice";
					}
		
				},
				error : function(){
					console.log("통신 오류");
				}
			});
			
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