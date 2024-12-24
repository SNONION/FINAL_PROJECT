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
    
    .response-area {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    gap: 10px; /* 텍스트와 버튼 사이 간격 */
	    padding: 20px;
	    background-color: #f7f7f7;
	    border-radius: 8px;
	    width: 80%;
	    max-width: 900px;
	    margin: 0 auto;
	}
	
	textarea {
	    width: 90%;
	    height: 150px;
	    padding: 10px;
	    font-size: 14px;
	    border: 1px solid #d1d1d1;
	    border-radius: 8px;
	    box-sizing: border-box;
	    outline: none;
	    resize: none;
	}
	
	#responseBtn {
	    padding: 8px 15px;
	    font-size: 14px;
	    background-color: #ffd200;
	    border: none;
	    border-radius: 20px;
	    color: black;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}
	
	#responseBtn:hover {
	    background-color: #ffcc00;
	}
	
	#responseBtn:active {
	    background-color: #e6b800;
	}
	
	#response-content{
		margin: auto;
		height: auto;
		width: 80%;
	}
	    
</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<button class="btn-kakao" style="float: left;" onclick="backBtn();">이전</button>
		<c:if test="${r.requestWriter == loginUser.userId || loginUser.userId == 'admin'}">
			<button class="btn-kakao" style="float: right; margin-right: 20px;" onclick="deleteRequestBtn();">삭제하기</button>
			<button class="btn-kakao" style="float: right; margin-right: 20px;" onclick="updateRequestBtn();">수정하기</button>
		</c:if>
		<br><br><br>
	    <div class="inner">
	    	<!-- 문의글 제목 -->
		    <div id="notice-header">
		        <h1 id="notice-title">${r.requestTitle}</h1>
		    </div>
		    <br><br><br>
		    <!-- 문의글 내용 -->
		    <div id="notice-content">
		        <p id="notice-content-p">
		        </p>
		    </div>
		    <br><br><br><br>
		    <!-- 문의글 작성 날짜 -->
		    <div id="notice-date">
		        <p>작성일: <span id="notice-date-text">${r.requestDate}</span></p>
		        <p>작성자: <span id="notice-date-text">${r.requestWriter}</span></p>
		    </div>
		    <br><br>
	    </div>
	    <hr>
	    <div id="response-content">
	    	<p id="response-content-p">
	    		
	    	</p>
	    	<button id="deleteResBtn" class="btn-kakao btn-sm" style="float: center; margin-right: 20px; display: none;" onclick="deleteResponseBtn();">답변삭제</button>
	    </div>
	  	<c:if test="${loginUser.userId == 'admin'}">
			<div id="response-area" class="response-area" align="center">
			 	<textarea id="responseContent" name="responseContent" cols="100" rows="4" style="resize: none;" placeholder="답변 작성"></textarea>    
			    <button id="responseBtn">답변</button>     
			</div>
	  	</c:if>
	</div>
	
	<script>
		function deleteResponseBtn(){
			
			alertify.confirm("답변을 삭제하시겠습니까?", function(){
				$.ajax({
					url : "${contextPath}/board/deleteResponse",
					data : {
						requestNo : "${r.requestNo}"
					},
					success : function(result){
						if(result == "NNNNY"){
							selectResponse();

							location.reload();
						}
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			});
			
		};
	
		$("#responseBtn").click(function(){
			var responseContent = $("#responseContent").val();
			
			$.ajax({
				url : "${contextPath}/board/insertResponse",
				data : {
					responseContent : responseContent,
					responseWriter : "${loginUser.userId}",
					requestNo : "${r.requestNo}"
				},
				success : function(msg){
					
					if(msg == 'NNNNY'){
						selectResponse();
					}
					
				},
				error : function(){
					console.log("통신 오류");
				}
			});
			
		});
		
		function selectResponse(){
			$.ajax({
				url : "${contextPath}/board/selectResponse",
				data : {
					requestNo : "${r.requestNo}"
				},
				success : function(result){
					
					if(result.responseNo != null){
						var responseContent = result.responseContent;
						responseContent = responseContent.replace(/\n/g, "<br>");
						$("#response-content-p").html(result.responseContent);
						$("#deleteResBtn").css("display", "block");
						$("#response-area").remove();
					}
				},
				error : function(){
					console.log("통신 오류");
				}
			});
		};
	
		$(function(){
			var requestContent = "${r.requestContent}";
			requestContent = requestContent.replace(/\n/g, "<br>");
			
			$("#notice-content-p").html(requestContent);
			selectResponse();
		});
	
		// 뒤로가기
		function backBtn(){
			location.href="${contextPath}/board/toRequest"
		}
		
		// 게시물 수정
		function updateRequestBtn(){
			location.href="${contextPath}/board/toUpdateRequestForm?requestNo=" + "${r.requestNo}";
		}
		
		// 게시물 삭제
		function deleteRequestBtn(){
			
			alertify.confirm("게시물을 삭제하시겠습니까?", function(){
				$.ajax({
					url : "${contextPath}/board/deleteRequest",
					data : {
						requestNo : "${r.requestNo}"
					},
					success : function(result){
						
						if(result == "NNNNY"){
							location.href="${contextPath}/board/toRequest";
						}
			
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			});
		}
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>