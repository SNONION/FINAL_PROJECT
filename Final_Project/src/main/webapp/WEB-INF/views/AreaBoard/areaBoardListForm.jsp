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
		width: 1000px;
		height: auto;
	}
	
	/* 컨테이너 스타일 */
	#notice-container {
	    max-width: 800px;
	    height: 100%;
	    margin: 0 auto;
	    background-color: #FFFFFF;
	    border-radius: 8px;
	    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	    padding: 20px;
	}
	
	/* 테이블 스타일 */
	.table {
	    width: 100%;
	    border-collapse: collapse;
	    border-radius: 10px;  /* 테이블의 모서리를 둥글게 */
    	overflow: hidden; /* 테이블의 모서리 부분이 잘리지 않도록 */
	}
	
	/* 테이블 헤더 스타일 */
	#notice-table thead {
	    background-color: #ffdd00;
	    color: #333;
	}
	
	#notice-table th {
	    padding: 12px;
	    text-align: left;
	    font-weight: bold;
	    font-size: 16px;
	    border-bottom: 2px solid #ddd;
	}
	
	/* 테이블 바디 스타일 */
	#notice-table tbody tr {
	    background-color: #FFF;
	}
	
	#notice-table td {
	    padding: 12px;
	    font-size: 14px;
	    color: #555;
	    border-bottom: 1px solid #ddd;
	}
	
	/* 홀수 번째 행에 배경색 추가 */
	#notice-table tbody tr:nth-child(odd) {
	    background-color: #f9f9f9;
	}
	
	/* 마지막 행의 테두리 제거 */
	#notice-table tbody tr:last-child td {
	    border-bottom: none;
	}
	
	/* 테이블에 호버 효과 추가 */
	#notice-table tbody tr:hover {
	    background-color: #FFFAE5;
	    cursor: pointer;
	}
	
	.paging-area {
	    display: flex;                  /* Flexbox로 설정 */
	    justify-content: center;        /* 수평 중앙 정렬 */
	    align-items: center;            /* 수직 중앙 정렬 (옵션) */
	    height: 70px;                  /* 부모 요소 높이를 화면 전체로 설정 (수직 중앙 정렬을 위해 필요) */
	}
	
	.paging-area a{
		color: black;
	}
	
	.paging-area a:hover{
		color: black;
	}
	
	#titleBar-area{
		width: 300px;
		white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
	    overflow: hidden; /* 텍스트가 넘칠 경우 잘라내기 */
	    text-overflow: ellipsis; /* 넘친 텍스트에 '...' 표시 */
	}
	
	#notice-top th {
        text-align: center;
    }
		
</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
	    <br><br>
	    <div class="container" id="notice-container" style="position: relative;">
	        <c:if test="${loginUser.userId == 'admin' && loginUser != null}">
	            <button class="btn-kakao" style="float: left; margin-bottom: 10px;" onclick="writeAreaBoard();">글작성</button>
		        <select id="boardCategory" style="position: absolute; margin-right: 20px; right: 0; background-color: #FFFFFF; color: #000000; border: 1px solid #CCCCCC; border-radius: 3px; padding: 3px; font-size: 12px; height: 30px;">
		            <option value="0">전체</option>
		            <c:forEach var="bcate" items="${bcList}">
		                <option value="${bcate.boardCateNo}">${bcate.boardCateName}</option>
		            </c:forEach>
		        </select>
				<div class="form-inline" style="margin-left: 220px;">
					<input id="keyword" class="form-control mr-sm-2" type="text" placeholder="Search">
					<button id="keywordSearch" class="btn btn-success" type="button" style="background-color: #ffdd00; border: none; color: black; font-weight: bold;">검색</button>
				</div>
			</c:if>
			<table class="table" id="notice-table">
				<thead>
					<tr id="notice-top">
						<th width="70px">No.</th>
						<th width="100px">지역</th>
						<th width="200px">Cate</th>
						<th id="titleBar-area">제목</th>
						<th width="100px">작성자</th>
						<th width="150px">작성일</th>
						<th width="100px">조회수</th>
					</tr>
				</thead>
				<tbody id="notice-click">
					
				</tbody>
			</table>
			<div class="paging-area">
				<ul class="pagination">
					<c:if test="${pi.currentPage > 1}">
						<li class="page-item"><a class="page-link" onclick="areaBoardFilter(${pi.currentPage - 1})"><</a></li>
					</c:if>
					<c:forEach var="i" begin="${pi.startPage}" end="${pi.maxPage}">
						<li class="page-item"><a class="page-link" onclick="areaBoardFilter(${i})">${i}</a></li>
					</c:forEach>
					<c:if test="${pi.currentPage != pi.endPage}">
						<li class="page-item"><a class="page-link" onclick="areaBoardFilter(${pi.currentPage + 1})">></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
	<script>
		var boardCateNo;
		
		$(function(){
			boardCateNo = $("#boardCategory").val();
			areaBoardFilter(1);
		});
	
		// select로 카테고리에 맞는 게시물 조회
		$("#boardCategory").change(function(){
			boardCateNo = $("#boardCategory").val();
			areaBoardFilter(1);
		});
		
		function areaBoardFilter(currentPage){
			var keyword = $("#keyword").val();
			var regionDepthName1 = sessionStorage.getItem("regionDepthName1");
			var regionDepthName2 = sessionStorage.getItem("regionDepthName2");
			var regionDepthName3 = sessionStorage.getItem("regionDepthName3");
			console.log(keyword);
			$.ajax({
				url : "${contextPath}/board/boardCateList",
				data : {
					boardCateNo : boardCateNo,
					currentPage : currentPage,
					keyword : keyword,
					regionDepthName1 : regionDepthName1,
					regionDepthName2 : regionDepthName2,
					regionDepthName3 : regionDepthName3
				},
				success : function(result){
					$("#notice-click tr").remove();
					
					for(var cateB of result){
						var tr = $("<tr align='center'>");
						tr.append($("<td>").text(cateB.areaNo));
						tr.append($("<td>").text(cateB.locationName));
						tr.append($("<td>").text(cateB.boardCateName));
						tr.append($("<td id='titleBar-area'>").text(cateB.areaTitle));
						tr.append($("<td>").text(cateB.areaWriter));
						tr.append($("<td>").text(cateB.createDate));
						tr.append($("<td>").text(cateB.count));
						
						$("#notice-click").append(tr);
					}
					
				},
				error : function(){
					console.log("통신 오류");	
				}
			});
		}
		
		$("#keywordSearch").click(function(){
			var keyword = $("#keyword").val();
			
			if(keyword != ""){
				areaBoardFilter(1);
			}
		});
	
		function writeAreaBoard(){
			location.href="${contextPath}/board/areaBoardEnroll";
		}
		
		$("#notice-click").on("click", "tr", function(){
			var areaNo = $(this).children().first().text();
			
			location.href="${contextPath}/board/areaBoardDetailForm?areaNo=" + areaNo;
		})
		
	</script>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	

</body>
</html>