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
    
    .boardReply-area {
	  display: flex;
	  align-items: center;
	  padding: 10px;
	  border-top: 1px solid #e5e5e5;
	  background-color: #f9f9f9; /* 카카오의 밝은 배경색 느낌 */
	  overflow-y: hidden;
	}
	
	.boardReply-area textarea {
	  flex: 1; /* 버튼 제외하고 나머지 공간 차지 */
	  resize: none; /* 크기 조절 비활성화 */
	  height: 100px;
	  border: 1px solid #ddd;
	  border-radius: 20px;
	  padding: 10px 15px;
	  font-size: 14px;
	  outline: none;
	  background-color: #fff;
	  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1); /* 살짝 입체감 */
	  margin-right: 10px; /* 버튼과 간격 */
	}
	
	.boardReply-area textarea::placeholder {
	  color: #aaa; /* 플레이스홀더 색상 */
	}
	
	.boardReply-area button {
	  padding: 0 15px;
	  height: 40px;
	  border: none;
	  border-radius: 20px;
	  background-color: #f7e600; /* 카카오톡의 노란색 */
	  color: #333; /* 텍스트 색상 */
	  font-weight: bold;
	  font-size: 14px;
	  cursor: pointer;
	  box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.15); /* 버튼 그림자 */
	  transition: background-color 0.3s ease;
	}
	
	.boardReply-area button:hover {
	  background-color: #fce000; /* 호버 시 약간 더 진한 노란색 */
	}
	
	.boardReply-area button:active {
	  background-color: #e5c800; /* 클릭 시 어두운 노란색 */
	}
		
	.reply-output-area {
	  padding: 10px;
	  background-color: #f9f9f9;
	  border: 1px solid #e5e5e5;
	  border-radius: 10px;
	  overflow-y: hidden;
	  font-family: 'Arial', sans-serif;
	}
	
	.reply-message {
	  margin-bottom: 15px;
	  padding: 10px;
	  border-radius: 10px;
	  background-color: #fff;
	  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	}
	
	.reply-header {
	  display: flex;
	  justify-content: space-between;
	  margin-bottom: 5px;
	  font-size: 12px;
	  color: #555;
	}
	
	.reply-author {
	  font-weight: bold;
	  color: #333;
	}
	
	.reply-date {
	  font-size: 11px;
	  color: #888;
	}
	
	.reply-content {
	  font-size: 14px;
	  color: #333;
	  word-wrap: break-word;
	}
	
	.reply-profile {
	  width: 30px;
	  height: 30px;
	  border-radius: 50%;
	  margin-right: 5px;
	}
	
</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<button class="btn-kakao" style="float: left;" onclick="backBtn();">이전</button>
		<c:if test="${board.areaWriter == loginUser.userId || loginUser.userId == 'admin'}">
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
		        <p>작성위치: <span id="notice-date-text">${board.locationName}&nbsp;${board.locationDetail1}&nbsp;${board.locationDetail2}</span></p>
		        <p>조회수: <span id="notice-date-text">${board.count}</span></p>
		    </div>
		    <br><br>
	    </div>
		<div class="boardReply-area">
			<textarea id="boardReplyContent" placeholder="메시지를 입력하세요"></textarea>
			<button onclick="boardReplyInsert();">작성</button>
		</div>
		<div class="reply-output-area">
		
		</div>
	</div>
	
	<script>
		function boardReplyInsert(){
			var boardNo = "${board.areaNo}";
			var boardReplyContent = $("#boardReplyContent").val();
			
			$.ajax({
				url : "${contextPath}/board/insertBoardReply",
				data : {
					refBno : boardNo,
					boardReplyContent : boardReplyContent
				},
				success : function(msg){
					console.log(msg);
					if(msg == "NNNNY"){
						selectAreaBoardReply();
						$("#boardReplyContent").val("");
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		}
		
		// 지역 게시판 댓글을 조회해오는 메소드
		function selectAreaBoardReply(){
			var boardNo = "${board.areaNo}";
			
			$.ajax({
				url : "${contextPath}/board/selectAreaBoardReply",
				data : {
					refBno : boardNo
				},
				success : function(result){
					
					$(".reply-output-area div").remove();
					
					for(var reply of result){
						
				        var replyDiv = $("<div>").addClass("reply-message");
				        var headerDiv = $("<div id='imHeader'>").addClass("reply-header");
				        var authorSpan = $("<span id='idSpan'>").addClass("reply-author").text(reply.boardReplyWriter);
				        var dateSpan = $("<span>").addClass("reply-date").text(reply.createDate);
				        
				        headerDiv.append(authorSpan).append(dateSpan);
				        
				        var contentDiv = $("<div class='content-area'>").addClass("reply-content").text(reply.boardReplyContent);
				        
				        replyDiv.append(headerDiv, contentDiv);
				        
				        $(".reply-output-area").append(replyDiv);
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			})
		}
	
		$(function(){
			selectAreaBoardReply();
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
			var areaNo = "${board.areaNo}";
			
			location.href="${contextPath}/board/updateAreaBoard?areaNo=" + areaNo;
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