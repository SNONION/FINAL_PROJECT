<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
 <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* 전체 페이지 스타일 */
        .container {
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 250px;
            background-color: #ffe812; /* 카카오 옐로우 */
            color: #3d3d3d; /* 카카오 그레이 */
            transition: width 0.3s;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }

        .sidebar.collapsed {
            width: 70px;
        }

        .sidebar-header {
            padding: 20px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 15px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .menu-item:hover {
            background-color: rgba(0, 0, 0, 0.1);
        }

        .menu-item i {
            font-size: 20px;
            margin-right: 15px;
        }

        .menu-item span {
            transition: opacity 0.3s;
        }

        .collapsed .menu-item span {
            opacity: 0;
        }

        /* 콘텐츠 영역 */
        .content {
            flex-grow: 1;
            padding: 20px;
            background-color: #f7f7f7;
        }

        /* 토글 버튼 */
        .toggle-button {
            position: absolute;
            top: 15px;
            right: -25px;
            background-color: #ffe812;
            border: none;
            border-radius: 50%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .toggle-button i {
            font-size: 20px;
            color: #3d3d3d;
        }

        /* 신고된 유저 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #ffe812;
            color: #3d3d3d;
        }

        .btn-action {
            cursor: pointer;
            background-color: #ffe812;
            border: none;
            padding: 5px 10px;
            color: #3d3d3d;
            border-radius: 5px;
        }
        .btn-action:hover {
            background-color: #f4c51f;
        }

        /* 신고된 댓글 스타일 */
        .reported-comments-table {
            margin-top: 30px;
            width: 100%;
            border-collapse: collapse;
        }

        .reported-comments-table th,
        .reported-comments-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .reported-comments-table th {
            background-color: #ffe812;
            color: #3d3d3d;
        }

        .view-post-btn {
            cursor: pointer;
            background-color: #ffe812;
            border: none;
            padding: 5px 10px;
            color: #3d3d3d;
            border-radius: 5px;
        }

        .view-post-btn:hover {
            background-color: #f4c51f;
        }

        /* 신고된 게시물 스타일 */
        .reported-posts-table {
            margin-top: 30px;
            width: 100%;
            border-collapse: collapse;
        }

        .reported-posts-table th,
        .reported-posts-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .reported-posts-table th {
            background-color: #ffe812;
            color: #3d3d3d;
        }

        .view-post-btn {
            cursor: pointer;
            background-color: #ffe812;
            border: none;
            padding: 5px 10px;
            color: #3d3d3d;
            border-radius: 5px;
        }

        .view-post-btn:hover {
            background-color: #f4c51f;
        }
    </style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">KH마켓 관리자 페이지</div>
            <div class="menu-item" onclick="goHome();">
                <i class="fas fa-home"></i><span>홈</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-user"></i><span>신고유저 확인</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-file"></i><span>게시물 신고 확인</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-envelope"></i><span>게시판 댓글 신고확인</span>
            </div>
            <div class="menu-item">
                <i class="fas fa-cog"></i><span>설정</span>
            </div>
        </div>

        <!-- 콘텐츠 영역 -->
        <div class="content">
            <h1>신고된 유저 목록</h1>
            <table id="reported-users-table">
                <thead>
                    <tr>
                        <th>유저 ID</th>
                        <th>신고 날짜</th>
                        <th>신고자</th>
                        <th>신고 사유</th>
                        <th>조치</th>
                    </tr>
                </thead>
                <tbody id="reported-users-list">
                      <c:forEach var="w" items="${wList}">
                      	<tr>
    						<td>${w.userId}</td>
    						<td>${w.warningDate}</td>
    						<td>${w.declarationId}</td>
    						<td>${w.declarationContent}</td>
    						<td><input type="submit" value="조치"> </td>
       				   </tr>
    				  </c:forEach>
                </tbody>
            </table>

            <!-- 신고된 게시물 목록 -->
            <h2>신고된 게시물 목록</h2>
            <table class="reported-posts-table" id="reported-posts-table">
                <thead>
                    <tr>
                        <th>게시물 번호</th>
                        <th>게시물 제목</th>
                        <th>작성자</th>
                        <th>게시물이동</th>
                    </tr>
                </thead>
                <tbody id="reported-posts-list">
                    <c:forEach var="wpb" items="${wpbList}">
                      	<tr>
    						<td>${wpb.boardNo}</td>
    						<td>${wpb.boardTitle}</td>
    						<td>${wpb.boardWriter}</td>
    						<td><a onclick="location.href='${contextPath}/board/boardDetailForm?boardNo=${wpb.boardNo}'"><input type="button" value="이동"></a></td>
       				   </tr>
    				  </c:forEach>
                </tbody>
            </table>
            <!-- 신고된 댓글 목록 -->
            <h2>신고된 댓글 목록</h2>
            <table class="reported-comments-table" id="reported-comments-table">
                <thead>
                    <tr>
                        <th>댓글 작성자</th>
                        <th>참조 게시판</th>
                        <th>댓글 내용</th>
                        <th>게시물이동</th>
                    </tr>
                </thead>
                <tbody id="reported-comments-list">
                   <c:forEach var="r" items="${rList}">
                      	<tr>
    						<td>${r.replyWriter}</td>
    						<td>${r.refBno}</td>
    						<td>${r.replyContent}</td>
    						<td><a onclick="location.href='${contextPath}/board/boardDetailForm?boardNo=${r.refBno}'"><input type="button" value="이동"></a></td>
       				   </tr>
    				  </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    	function goHome(){
    		location.href="${contextPath}";
    	}
    
        $(document).ready(function () {
            // 사이드바 토글
            const sidebar = $('#sidebar');
            const toggleButton = $('<button class="toggle-button"><i class="fas fa-bars"></i></button>');
            sidebar.append(toggleButton);

            toggleButton.click(function () {
                sidebar.toggleClass('collapsed');
            });

            // 신고된 댓글에 대해 게시물 보기
            window.viewPost = function(commentId) {
                // 실제 서버에서 게시물 정보를 가져와 처리할 내용을 여기에 추가
                alert("댓글 ID: " + commentId + "에 해당하는 게시물을 봅니다.");
            };

            // 신고된 유저에 대한 조치 처리
            window.handleUserAction = function(userId) {
                // 실제 서버에서 처리할 내용을 여기에 추가 (예: 삭제, 차단)
                alert(userId + "에 대한 처리를 진행합니다.");
            };

            // 신고된 게시물에 대한 조치 처리
            window.handlePostAction = function(postId) {
                // 실제 서버에서 처리할 내용을 여기에 추가 (예: 삭제, 차단)
                alert(postId + "에 대한 처리를 진행합니다.");
            };
        });
    </script>
</body>
</html>