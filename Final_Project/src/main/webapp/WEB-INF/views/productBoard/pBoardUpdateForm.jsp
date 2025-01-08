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
	
	/* 기본 스타일 */
	.kakao-checkbox {
	    display: flex;
	    align-items: center;
	    cursor: pointer;
	    font-size: 16px;
	   	font-weight: bold;
	    color: #333;
	}
	
	/* 체크박스 숨기기 */
	.kakao-checkbox-input {
	    display: none;
	}
	
	/* 카카오 스타일 체크박스 아이콘 */
	.kakao-checkbox-icon {
	    width: 20px;
	    height: 20px;
	    border: 2px solid #ddd;
	    border-radius: 4px;
	    margin-right: 10px;
	    position: relative;
	    transition: background-color 0.2s, border-color 0.2s;
	}
	
	/* 체크된 상태 */
	.kakao-checkbox-input:checked + .kakao-checkbox-icon {
	    background-color: #ffcc00; /* 카카오 색상 */
	    border-color: #ffcc00;
	}
	
	/* 체크된 상태에서 체크 표시 */
	.kakao-checkbox-input:checked + .kakao-checkbox-icon::after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 6px;
	    height: 12px;
	    border: solid #fff;
	    border-width: 0 3px 3px 0;
	    transform: translate(-50%, -50%) rotate(45deg);
	}
	
	/* 마우스 오버 시 스타일 */
	.kakao-checkbox-icon:hover {
	    border-color: #ffb900;
	}
</style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<form action="${contextPath}/board/updateProductBoard" method="post" enctype="multipart/form-data">
			<button type="button" class="btn-kakao" style="float: left;" onclick="#">이전</button>
			<button type="submit" class="btn-kakao" style="float: right; margin-right: 20px;">수정완료</button>
			<br><br><br>
		    <div class="inner">
		    	<br><br><br>
		    	<input type="hidden" name="titleImg" value="${detailBoard.titleImg}">
		    	<input type="hidden" name="boardNo" value="${detailBoard.boardNo}">
			    <input type="file" id="mainFile" name="mainFile" style="display:none;">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th onclick="mainFileOutput();" rowspan="3" colspan="2" style="width: 114px; height: 151px; overflow: hidden; text-align: center;">
							    <div id="mainFileOutput-div" style="width: 100%; height: 100%; object-fit: contain;">
							    	<img style='width: 114px; height: 151px;' src="${contextPath}${detailBoard.titleImg}">
							    </div>
							</th>
							<th>
								<input type="text" name="productName" placeholder="제품명 입력 (필수)" style="border: none;" value="${productInfo.productName}" required>
							</th>
						</tr>
						<tr>
							<th>
								<input type="text" name="createLocation" placeholder="제조사 입력 (선택)" value="${productInfo.createLocation}" style="border: none;">
							</th>
						</tr>
						<tr>
							<th>	
								구매일자 (선택)
								<input type="date" name="PurchaseDate" style="border: none; margin-left: 20px;">
							</th>
						</tr>
					</thead>
				</table>
				<div id="otherImg-area">
			    	<input type="file" id="upFile" name="upFile" multiple>
			    </div>
			    
			    <script>
			    	// 구매날짜의 디폴트값을 오늘 날짜로 설정하는 메소드
					$(function(){
						var date = new Date();
				    	var today = date.toISOString().split('T')[0];
				    	$("input[name=PurchaseDate]").val(today);
					});		    	
			    </script>
				
				<br>
				<br>
					
				<table class="table table-striped">
					<thead>
						<tr>
							<th>판매 가격</th>
							<th colspan="3">
								<input type="number" name="price" style="border: none; width: 150px; font-size: 16px; font-weight: bold" maxlength="10" value="${detailBoard.price}" required>원
							</th>
						</tr>
						<tr>
							<th>선호 결제 방식</th>
							<th colspan="3">
								<select id="buyWay" name="preferPayment">
									<option>안전결제</option>
									<option selected>계좌이체</option>
									<option>카드</option>
									<option>현금</option>
								</select>
							</th>
						</tr>
						<tr>
							<th>판매자정보</th>
							<th id="userInfo" colspan="3">
								<input type="text" id="boardWriter" name="boardWriter" value="${loginUser.userId}" style="border:none; background-color: white; font-weight: bold" readonly>
							</th>
						</tr>
						<tr>
							<th>거래 지역</th>
							<th id="sellerLocation" colspan="3"></th>
						</tr>
						<tr>
							<th>카테고리 설정</th>
							<th colspan="2">
								<select id="cateList" required>
										<option selected>필수사항</option>
									<c:forEach var="c" items="${cList}">
										<c:choose>
											<c:when test="${c.categoryName eq category.categoryName}">
												<option selected>${c.categoryName}</option>
											</c:when>
											<c:otherwise>											
												<option>${c.categoryName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</th>
							<th id="detailCateSet">
								<select id="cateDetailList" name="categoryNo" required>
								</select>
							</th>
						</tr>
						<tr>
							<th width="200px">게시물 분류</th>
							<th colspan="3">
								<select id="kindList" name="kindNo" required>
									<!-- 거래 방식 선택 -->
					        		<c:forEach var="k" items="${kList}">
					        			<c:choose>
					        				<c:when test="${detailBoard.kindNo eq k.kindNo}">
					        					<option selected value="${k.kindNo}">${k.kindName}</option>
					        				</c:when>
					        				<c:otherwise>
					        					<option value="${k.kindNo}">${k.kindName}</option>
					        				</c:otherwise>
					        			</c:choose>
						        	</c:forEach>
				        		</select>	
							</th>
						</tr>
						<tr>
							<th width="200px">재품 상태</th>
							<th colspan="3">
								<select id="productState" name="productStatus" required>
				        			<option value="NEW">새상품</option>
				        			<option value="RE" selected>중고</option>
				        		</select>	
							</th>
						</tr>
						<tr>
							<th width="200px">거래 방식</th>
							<th colspan="3">
								<select id="sellWay" name="sellWay" required>
				        			<option selected>직거래</option>
				        			<option>택배</option>
				        		</select>	
							</th>
						</tr>
					</thead>
				</table>
				<label for="19tag" class="kakao-checkbox">
				    <input type="checkbox" id="19tag" name="tag19Product" class="kakao-checkbox-input">
				    <span class="kakao-checkbox-icon"></span>
				    19세 이상 제품
				</label>
				
				<br><br>
				
		    	<!-- 상품 게시판 제목 -->
			    <div id="notice-header">
			        <h1 id="notice-title">
			        	<input type="text" name="boardTitle" value="${detailBoard.boardTitle}">
			        </h1>
			    </div>
			    
			    <!-- 상품 게시판 내용 -->
			    <div id="notice-content">
			    	<button type="button" class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortRight();"><i class="fas fa-align-right"></i></button>
			    	<button type="button" class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortCenter();"><i class="fas fa-align-center"></i></button>
			    	<button type="button" class="btn-kakao" style="float: right; margin-right: 5px;" onclick="sortLeft();"><i class="fas fa-align-left"></i></button>
			        <p><textarea id="requestContent" name="BoardContent" style="resize: none;" placeholder="내용을 입력하세요.">${detailBoard.boardContent}</textarea></p>
			    </div>
			    <div class="information-area" align="center">
			    	<p align="center" style="font-size: 12px; color: gray;">
			    		<b style="font-size: 20px; color: black;">게시물 작성 후 확인해 주세요!</b> <br><br>
						게시물을 작성하신 후, 아래 사항들을 다시 한 번 확인해 주세요:<br><br>
						1) 제품의 상태(스크래치, 손상 여부 등)<br>
						2) 제품의 사용 기간 및 기타 특징<br>
						3) 가격 및 배송 방법<br>
						4) 사진 및 설명의 정확성<br><br>
						꼼꼼히 검토하신 후 게시물을 올려주세요. 구매자에게 더 신뢰감 있는 정보를 제공할 수 있습니다!<br>
			    	</p>
			    </div>
		    </div>
		</form>
	</div>

	<script>
		
		function mainFileOutput(){
			$("#mainFile").click();
		};
		
		$(function(){
			$("#mainFile").change(function(img){
				var imgFile = img.target.files[0];
				
				$("#mainFileOutput-div img").remove();
				
				if(imgFile != null){
					const reader = new FileReader();
					reader.onload = function(e){
						var img = $("<img style='width: 114px; height: 151px;'>");
						$(img).attr("src" ,e.target.result);
						img.appendTo($("#mainFileOutput-div"));
					};
					reader.readAsDataURL(imgFile);
				}
			});
		});
	
		$(function(){
			selectPayment();
			categoryDetailName();
			productStatus();
			sellWay();
			tag19();
		});
		
		function categoryDetailName(){
			var cate = "${category.categoryName}";
			
			if(cate != "필수사항"){
				$.ajax({
					url : "${contextPath}/board/cateDetail",
					data : {
						categoryName : cate
					},
					success : function(result){
						
						$("#cateDetailList option").remove();
						
						for(var i of result){
							
							var option;
							
							if("${category.categoryDetailName}" == i.categoryDetailName){
								option = $("<option selected>").text(i.categoryDetailName);
							}
							else{
								option = $("<option>").text(i.categoryDetailName);
							}
							
							option.val(i.categoryNo);
							$("#cateDetailList").append(option);
						}
						
					},
					error : function(){
						console.log("통신 오류");
					}
				});
			}
		};
	</script>
	
	<script>	
		function getLocationName(latitude, longitude){
			$.ajax({
				url : "${contextPath}/user/searchLocation",
				async : false,
				data : {
					latitude : latitude,
					longitude : longitude
				},
				success : function(result){
					
					$(".loc").text(result.regionDepthName1 + " " + result.regionDepthName2 + " " + result.regionDepthName3);
					$("#sellerLocation").text(result.regionDepthName1 + " " + result.regionDepthName2);
					
					var locInput = result.regionDepthName1 + " " + result.regionDepthName2;
					
					var input = $("<input type='hidden' name='sellLocation'>").val(locInput);
					input.appendTo($("#sellerLocation"));
				},
				error : function(error){
					console.log(error);
					console.log("통신 오류");
				}
			});
		};
		
		// 왼쪽 정렬
		function sortLeft(){
			$("#requestContent").css("text-align","left");
		}
		
		// 중앙 정렬
		function sortCenter(){
			$("#requestContent").css("text-align","center");
		}
		
		// 오른쪽 정렬
		function sortRight(){
			$("#requestContent").css("text-align","right");
		}
		
		// 선호 결제 방식
		function selectPayment(){
			var payment = "${detailBoard.preferPayment}";
			var count = $("#buyWay option").length;

			for(var i = 0; i < count; i++){
				var selectPayment = $($("#buyWay option").get(i)).val()
				
				if(selectPayment == payment){
					$($("#buyWay option").get(i)).attr("selected", true);
				}	
			}
		}
		
		// 제품 상태
		function productStatus(){
			var status = "${detailBoard.productStatus}";
			var count = $("#productState option").length;
			
			for(var i = 0; i < count; i++){
				var selectStatus = $($("#productState option").get(i)).val();
				
				if(selectStatus == status){
					$($("#productState option").get(i)).attr("selected", true);
				}
			}
		}
		
		// 판매 방식
		function sellWay(){
			var way = "${detailBoard.sellWay}";
			var count = $("#sellWay option").length;
			
			for(var i = 0; i < count; i++){
				var selectSell = $($("#sellWay option").get(i)).val();
				
				if(selectSell == way){
					$($("#sellWay option").get(i)).attr("selected", true);
				}
				
			}
		}
		
		// 19 태그
		function tag19(){
			var tag = "${detailBoard.tag19Product}";
			
			if(tag == 'Y'){
				$("#19tag").attr("checked", true);
			}
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>