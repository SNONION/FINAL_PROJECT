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
	/* 전체적인 스타일 */
	body {
	    font-family: 'Roboto', sans-serif;
	    background-color: #f7f7f7;
	    color: #333;
	    margin: 0;
	    padding: 0;
	}
	
	/* 폼 전체 레이아웃 */
	.sign-up-form-group {
	    margin-bottom: 20px;
	}
	
	#sginin-form-area {
	    max-width: 600px;
	    margin: 0 auto;
	    padding: 30px;
	    background-color: white;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
	
	/* 레이블 스타일 */
	.sign-up-form-group label, #firstPhoneLabel {
	    display: block;
	    margin-bottom: 8px;
	    font-size: 14px;	
	    color: #555;
	}
	
	/* 입력 필드 스타일 */
	.sign-up-input,
	.sign-up-select {
	    width: 100%;
	    padding: 12px;
	    font-size: 16px;
	    border-radius: 8px;
	    border: 1px solid #ddd;
	    background-color: #f5f5f5;
	    box-sizing: border-box;
	    margin-bottom: 10px;
	}
	
	.sign-up-input:focus,
	.sign-up-select:focus {
	    border-color: #fee500;  /* 카카오 톤 */
	    outline: none;
	}
	
	/* 버튼 스타일 */
	.sign-up-btn {
	    background-color: #fee500;  /* 카카오 톤 */
	    color: #fff;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 8px;
	    cursor: pointer;
	    font-size: 16px;
	}
	
	.sign-up-btn:hover {
	    background-color: #fdd600;
	}
	
	.sign-up-submit-btn {
	    width: 100%;
	    padding: 12px;
	    font-size: 18px;
	    background-color: #fee500; /* 카카오 톤 */
	    color: #fff;
	    border: none;
	    border-radius: 8px;
	    cursor: pointer;
	}
	
	.sign-up-submit-btn:hover {
	    background-color: #fdd600;
	}
	
	/* 중복 확인 버튼을 입력 필드 옆에 배치 */
	.sign-up-form-group button {
	    display: inline-block;
	    width: auto;
	    padding: 10px 15px;
	    margin-left: 10px;
	    background-color: #e0e0e0;
	    color: #333;
	}
	
	.sign-up-form-group button:hover {
	    background-color: #ccc;
	}
	
	/* 설명 텍스트 스타일 */
	.sign-up-description {
	    font-size: 12px;
	    color: #777;
	    margin-top: 5px;
	}
	
	/* 체크박스 스타일 */
	.sign-up-checkbox {
	    margin-right: 10px;
	}
	
	/* 반응형 디자인 */
	@media (max-width: 600px) {
	    form {
	        padding: 20px;
	        max-width: 90%;
	    }
	
	    .sign-up-input,
	    .sign-up-select,
	    .sign-up-btn,
	    .sign-up-submit-btn {
	        font-size: 14px;
	    }
	
	    .sign-up-submit-btn {
	        font-size: 16px;
	    }

</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
		<div class="sginIn-area">
			<div id="sginin-form-area">
				<div class="sign-up-form-group">
				    <label for="userId">아이디</label>
				    <div class="input-with-btn">
				        <input type="text" name="userId" id="sginInId" class="sign-up-input" required>
				    </div>
				    <p class="sign-up-description" id="id-description">4-15글자 이내로 작성해주세요. (특수기호 사용 불가능)</p>
				</div>
				
				<!-- 비밀번호 -->
				<div class="sign-up-form-group">
				    <label for="userPwd">비밀번호</label>
				    <input type="password" name="userPwd" id="sginInPwd" class="sign-up-input" required>
				    <p class="sign-up-description" id="pwd-description">4-15글자 이내 첫글자는 대문자로 작성해주세요. (특수기호 사용 가능)</p>
				</div>
				
				<!-- 비밀번호 확인 -->
				<div class="sign-up-form-group">
				    <label for="checkPwd">비밀번호 확인</label>
				    <input type="password" name="checkPwd" id="checkPwd" class="sign-up-input" required>
				    <p class="sign-up-description" id="cpwd-description">위에 작성하신 비밀번호와 동일하게 작성해주세요.</p>
				</div>
				
				<!-- 이름 -->
				<div class="sign-up-form-group">
				    <label for="userName">이름</label>
				    <input type="text" name="userName" id="userName" class="sign-up-input" required>
				</div>
				
				<!-- 주민등록번호 -->
				<div class="sign-up-form-group">
				    <label for="age">주민번호 (뒤 1자리까지)</label>
				    <input type="text" name="age" id="age" class="sign-up-input" maxlength="6" style="width: 300px;" required>
				    <span style="font-size: 30px; text-align: center; margin-bottom: 17px;" id="ageTag"> - </span>
				    <input type="text" name="gender" id="gender" class="sign-up-input" maxlength="1" style="width: 50px;" required>
				    <span style="font-size: 30px; text-align: center; margin-bottom: 17px;" id="ageTag">*******</span>
				</div>
				
				<!-- 닉네임 -->
				<div class="sign-up-form-group">
				    <label for="nickname">닉네임</label>
				    <div class="input-with-btn">
				        <input type="text" name="nickname" id="nickname" class="sign-up-input" required>
				        <p class="sign-up-description" id="nickname-description">2-30글자 이내 한글,영어,숫자,특수기호 모두 가능합니다. (한글의 경우 최대 20글자)</p>
				    </div>
				</div>
				
				<!-- 이메일 -->
				<div class="sign-up-form-group">
				    <label for="email">이메일</label>
				   <div class="sign-up-form-group" style="display: flex; align-items: center; gap: 5px;">
					    <input type="text" name="firstEmail" id="firstEmail" maxlength="15" class="sign-up-input" style="flex-grow: 1;" required>
					    <span style="font-size: 30px; text-align: center; margin-bottom: 17px;" id="emailTag">@</span>
					    <select name="lastEmail" id="lastEmail" class="sign-up-select" style="width: 300px; padding: 12px;">
					        <option selected>gmail.com</option>
					        <option>naver.com</option>
					        <option>daum.com</option>
					        <option>daum.com</option>
					        <option>직접입력</option>
					    </select>
					</div>
				</div>
				
				<!-- 핸드폰 번호 -->
			    <label for="firstPhone" id="firstPhoneLabel">핸드폰 번호</label>
				<div class="sign-up-form-group" style="display: flex; align-items: center; gap: 5px;">
				    <select name="firstPhone" id="firstPhone" class="sign-up-select" style="width: 80px; padding: 12px;">
				        <option selected>010</option>
				        <option>011</option>
				        <option>001</option>
				    </select>
				    <span style="font-size: 30px; text-align: center; margin-bottom: 17px;" id="emailTag"> - </span>
				    <input type="text" name="lastPhone" id="lastPhone" maxlength="8" class="sign-up-input" style="flex-grow: 1;" required>
				</div>
				<p class="sign-up-description">'-' 없이 입력해주세요</p>
				
				<!-- 주소 -->
				<div class="sign-up-form-group">
				    <label for="address">주소</label>
				    <input type="text" name="postNumber" id="sample4_postcode" placeholder="우편번호" class="sign-up-input" style="width: auto; display: inline-block;">
				    <input type="button" onclick="sample4_execDaumPostcode();" value="우편번호 찾기" class="sign-up-btn" style="display: inline-block; margin-left: 10px; color: black;">
				    <br>
				    <input type="text" name="roadAddress" id="sample4_roadAddress" placeholder="도로명주소" class="sign-up-input">
				    <input type="text" name="locationAddr" id="sample4_jibunAddress" placeholder="지번주소" class="sign-up-input">
				    <span id="guide" style="color:#999;display:none"></span>
				    <input type="text" name="detailAddr" id="sample4_detailAddress" placeholder="상세주소" class="sign-up-input">
				    <input type="text" name="addressDetail" id="sample4_extraAddress" placeholder="참고항목" class="sign-up-input">
				</div>

				<br>
				
				<!-- 제출 버튼 -->
				<div class="sign-up-form-group" align="center">
					<p class="sign-up-description" id="union-description"></p>
				    <button onclick="sginInBtn();" class="sign-up-submit-btn">회원가입</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		var checkID = false;
		var checkP = false;
		var checkDP = false;
		var checkNick = false;
	
		$(function(){
			$("#sginInId").keyup(function(){
				var idRegExp = /^[a-zA-Z0-9]{4,15}$/;	
			
				if(idRegExp.test($("#sginInId").val())){
					if($("#sginInId").val().length >= 4){
						
						$.ajax({
							url : "checkId",
							data : {
								userId : $("#sginInId").val()
							},
							success : function(msg){
								
								if(msg == 'NNNNY'){
									$("#id-description").text("사용 가능한 아이디입니다.");
									$("#id-description").css("color", "blue");
									checkID = true;
								}
								else{
									$("#id-description").text("이미 사용중인 아이디입니다.");
									$("#id-description").css("color", "red");
									checkID = false;
								}
							},
							error : function(){
								console.log("통신 오류");
							}
						})
					}
					else{
						$("#id-description").text("4-15글자 이내로 작성해주세요. (특수기호 사용 불가능)");
						$("#id-description").css("color", "black");
						checkID = false;
					}
				}
				else{
					$("#id-description").text("4-15글자 이내로 작성해주세요. (특수기호 사용 불가능)");
					$("#id-description").css("color", "red");
					checkID = false;
				}
				
			})
			
			$("#sginInPwd").keyup(function(){
				var pwdRegExp = /^[!@#$%^&*a-zA-Z0-9]{4,15}$/;
				
				if(pwdRegExp.test($("#sginInPwd").val())){
					$("#pwd-description").text("사용가능한 비밀번호입니다.");
					$("#pwd-description").css("color", "blue");
					checkP = true;
				}
				else{
					$("#pwd-description").text("4-15글자 이내 첫글자는 대문자로 작성해주세요. (특수기호 사용 가능)");
					$("#pwd-description").css("color", "red");
					checkP = false;
				}
				
			})
			
			$("#checkPwd").keyup(function(){
				
				if($("#checkPwd").val() == $("#sginInPwd").val()){
					$("#cpwd-description").text("비밀번호가 일치합니다.");
					$("#cpwd-description").css("color", "blue");
					checkDP = true;
				}
				else{
					$("#cpwd-description").text("비밀번호가 일치하지 않습니다.");
					$("#cpwd-description").css("color", "red");
					checkDP = false;
				}
			})
			
			$("#nickname").keyup(function(){
				var nicknameRegExp = /^[!@#$%^&*A-Za-z가-힣0-9]{1,30}$/;
				
				if(nicknameRegExp.test($("#nickname").val())){
					
					if($("#nickname").val().length > 1){
						$.ajax({
							url : "nicknameCheck",
							data : {
								nickname : $("#nickname").val()
							},
							success : function(msg){
								
								if(msg == 'NNNNY'){
									$("#nickname-description").text("사용 가능한 닉네임입니다.");
									$("#nickname-description").css("color", "blue");
									checkNick = true;
								}
								else{
									$("#nickname-description").text("이미 사용중인 닉네임입니다.");
									$("#nickname-description").css("color", "red");
									checkNick = false;
								}
							},
							error : function(){
								console.log("통신 오류");
							}
						})
					}
					else{
						$("#nickname-description").text("2-30글자 이내로 작성해주세요. (한글의 경우 최대 20글자)");
						$("#nickname-description").css("color", "red");
						checkNick = false;
					}
				}

			})
			
		})
	
		function sginInBtn(){
			
			var userId = $("#sginInId").val();
			var userPwd = $("#sginInPwd").val();
			var userName = $("#userName").val();
			var age = $("#age").val();
			var gender = "";
			if($("#gender").val() == 1 || $("#gender").val() == 3){
				gender = "M";
			}
			else{
				gender = "F";
			}
			var nickname = $("#nickname").val();
			var email = $("#firstPhone").val() + "@" + $("#lastEamil").val();
			var phone = $("#firstPhone").val() + $("#lastPhone").val();
			var detailAddress = $("#sample4_jibunAddress").val() + " " + $("#sample4_detailAddress").val() 
							+ " " + $("#sample4_extraAddress").val();
			
			if(checkID && checkP && checkDP && checkNick){
				$("#union-description").text(" ");
				
				var form = $("<form>").attr("action", "insertUser").attr("method", "post");
				form.append($("#sginInId"));
				form.append($("#sginInPwd"));
				form.append($("#userName"));
				form.append($("#age"));
				form.append($("<input type='text'>").attr("name","gender").val(gender));
				form.append($("#nickname"));
				form.append($("<input type='text'>").attr("name","email").val(email));
				form.append($("<input type='text'>").attr("name","phone").val(phone));
				form.append($("<input type='text'>").attr("name","address").val(detailAddress));
				form.append($("<input type='text'>").attr("name","privateInfoAgreee").val("${agree.privateInfoAgreee}"));
				form.append($("<input type='text'>").attr("name","serviceUseAgree").val("${agree.serviceUseAgree}"));
				form.append($("<input type='text'>").attr("name","marketingAgree").val("${agree.marketingAgree}"));
				
				form.appendTo($(".outer"));
				form.submit();
				
			}
			else{
				$("#union-description").text("형식을 맞춰 작성해주세요.");
				$("#union-description").css("color", "red");
			}
			
		}
	
		$("#lastEmail").change(function(){
			var lastEmail = $(this).val();
			
			if(lastEmail == '직접입력'){
				$("#emailTag").css("display", "none");
				$("#firstEmail").attr("maxlength", 60);
			}
			else{
				$("#emailTag").css("display", "block");
				$("#firstEmail").attr("maxlength", 15);
			}
		})
	
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
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>