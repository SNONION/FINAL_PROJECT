<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<c:if test="${n.noticeWriter == loginUser.userId || loginUser.userId == 'admin'}">
			<button class="btn-kakao" style="float: right; margin-right: 20px;" onclick="deleteAreaBtn();">삭제하기</button>
			<button class="btn-kakao" style="float: right; margin-right: 20px;" onclick="updateAreaBtn();">수정하기</button>
		</c:if>
		<br><br><br>
	    <div class="inner">
	    	<!-- 공지사항 제목 -->
		    <div id="notice-header">
		        <h1 id="notice-title">${board.areaTitle}</h1>
		    </div>
		    <br><br><br>
		    <!-- 공지사항 내용 -->
		    <div id="notice-content">
		        <p id="notice-content-p">
		        </p>
		    </div>
		    <br><br><br><br>
		    <!-- 공지사항 작성 날짜 -->
		    <div id="notice-date">
		        <p>작성일: <span id="notice-date-text">${board.createDate}</span></p>
		        <p>작성자: <span id="notice-date-text">${board.areaWriter}</span></p>
		        <p>조회수: <span id="notice-date-text">${board.count}</span></p>
		    </div>
		    <br><br>
	    </div>
	</div>
	
	<script>
		$(function(){
			var noticeContent = "${board.areaContent}";
			noticeContent = noticeContent.replace(/\n/g, "<br>");
			
			$("#notice-content-p").html(noticeContent);
			
		});
	
		// 뒤로가기
		function backBtn(){
			location.href="${contextPath}/board/areaBoardForm?regionDepthName1=" + regionDepthName1 + "&regionDepthName2=" + regionDepthName1 + "&currentPage=1";
		}
		
		// 게시물 수정
		function updateAreaBtn(){
			
		}
		
		// 게시물 삭제
		function deleteAreaBtn(){
			var areaNo = "${board.areaNo}";
			
			location.href="${contextPath}/board/deleteAreaBoard?areaNo=" + areaNo;
			
		}
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>