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
	        margin: auto;
	        width: 1000px;
	        padding: 20px;
	        font-family: 'Noto Sans KR', sans-serif;
	        background-color: #fff;
	    }
	
	    .section-title {
	        font-size: 20px;
	        color: #3D3D3D;
	        font-weight: bold;
	        margin-bottom: 10px;
	    }
	
	    .scrollable {
	        border: 1px solid #e0e0e0;
	        margin-bottom: 20px;
	        padding: 10px;
	        overflow-y: auto; /* 세로 스크롤 활성화 */
        	max-height: 200px; /* 최대 높이 설정 */
	        background-color: #F7F7F7;
	        border-radius: 10px;
	    }
	
	    .agree-btn-area {
	        display: flex;
	        align-items: center;
	        margin-top: 10px;
	    }
	
	    .agree-btn-area label {
	        font-size: 16px;
	        margin-right: 10px;
	        color: #3D3D3D;
	    }
	
	    .agree-checkbox {
	        margin-right: 15px;
	    }
	
	    .agree-btn-area input[type="checkbox"] {
	        width: 20px;
	        height: 20px;
	        border-radius: 5px;
	        accent-color: #FFCC00;
	    }
	
	    .agree-label {
	    	margin-top: 10px;
	        cursor: pointer;
	    }
	
	    .scrollable p {
	        color: #3D3D3D;
	        line-height: 1.6;
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
		
	</style>

</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp"%> 
	
	<div class="outer">
	    <br>
	    <h3 class="section-title">개인 정보 동의 (필수)</h3>
	    <div class="scrollable">
			<p>
				개인정보 수집 및 이용 동의 안내 저희 서비스는 개인정보 보호를 중요하게 생각하며, 다음과 같은 사항을 위해
				귀하의 개인정보를 수집 및 이용하고자 합니다. 개인정보 제공은 선택 사항이지만, 동의를 거부할 경우 서비스 이용에 제한이
				있을 수 있습니다. 수집하는 개인정보 항목 필수 항목: 이름, 연락처, 이메일 주소, 생년월일 등 선택 항목: 주소,
				성별, 결제 정보 등 개인정보 수집 및 이용 목적 서비스 제공 및 본인 인증 회원 관리 (서비스 이용 및 회원 지원)
				이벤트, 프로모션 및 마케팅 활동에 필요한 정보 제공 법적 의무 이행 및 계약 이행을 위한 정보 활용 개인정보 보유 및
				이용 기간 개인정보는 수집 및 이용 목적이 달성되면 즉시 파기합니다. 단, 관련 법령에 의한 보관 의무가 있을 경우 해당
				기간 동안 보유합니다. 제3자 제공 및 공유 귀하의 개인정보는 원칙적으로 제3자에게 제공되지 않으며, 관련 법령에 의해
				요구되는 경우에만 제공될 수 있습니다. 개인정보 보호 방침 귀하는 언제든지 자신의 개인정보를 열람, 수정, 삭제할 수
				있으며, 개인정보 처리방침에 대해 자세히 안내받을 수 있습니다.
			</p>
			<p>
				개인정보 수집 목적 서비스 제공 및 본인 인증 회원 가입 및 서비스 제공을 위한 본인 인증 고객 문의 및 요청 사항에
				대한 답변 제공 로그인 및 계정 관리 서비스 개선 및 맞춤형 서비스 제공 고객의 서비스 이용 패턴 분석을 통한 서비스 개선
				맞춤형 정보 제공 및 개인화된 서비스 제공 마케팅 및 광고 활용 신규 서비스, 이벤트, 프로모션 정보 제공을 위한 마케팅
				활동 광고성 정보 제공(단, 사용자 동의가 있는 경우) 계약 이행 및 법적 의무 준수 법적 의무 이행을 위한 개인정보 처리
				(예: 세금 관련 사항, 계약서 관리 등) 서비스 이용 관련 통계 및 보고서를 위한 개인정보 활용 고객 지원 및 고객
				서비스 고객 서비스 제공 및 불만 처리 서비스 관련 제안 및 안내 사항 제공
			</p>
		</div>
	
	    <div class="agree-btn-area">
	        <label for="agree1_accept" class="agree-label">동의</label>
	        <input type="checkbox" name="privateInfoAgreee" id="agree1_accept" class="agree-checkbox">
	        <label for="agree1_no_accept" class="agree-label">비동의</label>
	        <input type="checkbox" name="privateInfoAgreee" id="agree1_no_accept" class="agree-checkbox">
	    </div>
	    <br>
	    <h3 class="section-title">서비스 이용 동의 (필수)</h3>
	    <div class="scrollable">
			<p>서비스 이용 동의서 본 서비스 이용 동의서(이하 "동의서")는 [KH 중고마켓] (이하 "회사")가 제공하는
				서비스(이하 "서비스")의 이용에 관한 약관을 명확히 규정하며, 귀하가 서비스를 이용하기 전에 반드시 확인하고 동의해야
				하는 내용입니다. 본 동의서에 동의하신 후 서비스를 이용하실 수 있습니다.</p>
			<p>1. 서비스의 제공 회사는 사용자가 본 동의서에 동의한 후, [서비스 내용]을 제공하며, 사용자는 이를 자유롭게
				이용할 수 있습니다.</p>
			<p>2. 이용자 의무 이용자는 서비스를 이용함에 있어 다음의 의무를 준수해야 합니다: 서비스 이용 목적에 맞게
				서비스를 사용해야 하며, 불법적인 용도로 사용할 수 없습니다. 타인의 권리를 침해하거나 불법적인 행위를 하지 않습니다.
				서비스 이용 중 발생한 모든 문제에 대해 책임을집니다.</p>
			<p>3. 개인정보 처리 방침 회사는 사용자의 개인정보를 수집, 이용 및 보호하기 위해 개인정보 처리 방침을 별도로
				두고 있으며, 이를 준수합니다. 개인정보 처리 방침은 [링크 또는 별도 문서]에서 확인할 수 있습니다.</p>
			<p>4. 서비스 제공의 제한 및 종료 회사는 서비스 이용자의 다음과 같은 경우에 서비스를 제한하거나 종료할 수
				있습니다: 서비스 이용 규정을 위반한 경우 불법적이거나 부정한 방법으로 서비스를 이용한 경우 기타 서비스 제공이 어려운
				상황 발생 시</p>
			<p>5. 지적 재산권 서비스에 대한 모든 지적 재산권은 회사에 귀속되며, 사용자는 서비스 이용에 있어 지적 재산권을
				침해하지 않도록 해야 합니다.</p>
			<p>6. 서비스의 변경 및 종료 회사는 서비스 제공을 지속적으로 개선하며, 필요에 따라 서비스의 내용 및 운영
				방침을 변경할 수 있습니다. 서비스의 변경 사항은 사전 공지 후 적용됩니다.</p>
			<p>7. 면책 조항 회사는 서비스 이용 중 발생할 수 있는 일부 문제에 대해 책임을 지지 않으며, 사용자는 본
				동의서에 동의함으로써 이를 이해하고 동의합니다.</p>
			<p>8. 약관의 변경
				회사는 본 동의서를 변경할 수 있으며, 변경된 내용은 [공지사항 또는 이메일]을 통해 안내됩니다. 변경된 사항에 대해
				사용자가 동의하지 않는 경우, 서비스 이용을 중지할 수 있습니다.</p>
	    </div>
	
	    <div class="agree-btn-area">
	        <label for="agree2_accept" class="agree-label">동의</label>
	        <input type="checkbox" name="serviceUseAgree" id="agree2_accept" class="agree-checkbox">
	        <label for="agree2_no_accept" class="agree-label">비동의</label>
	        <input type="checkbox" name="serviceUseAgree" id="agree2_no_accept" class="agree-checkbox">
	    </div>
	    <br>
	    <h3 class="section-title">마케팅 동의 (선택)</h3>
	    <div class="scrollable">
			<p>본 동의서는 [회사명] (이하 "회사")가 제공하는 마케팅 활동에 대해 귀하의 개인정보를 활용하는 것에 대한
				동의 내용을 담고 있습니다. 아래의 내용은 마케팅 활동을 위한 개인정보 수집 및 활용에 대한 동의 사항이며, 귀하께서는
				이에 대해 충분히 이해한 후 동의 여부를 선택해 주셔야 합니다.</p>
			<p>마케팅 목적의 개인정보 수집 및 이용 회사는 귀하의 개인정보를 다음의 목적을 위해 수집하고 이용할 수 있습니다:
				회사의 신규 서비스, 이벤트, 프로모션 정보 제공 맞춤형 광고 및 혜택 제공 서비스 개선을 위한 고객 의견 및 피드백 수집
				제휴사 및 파트너사의 서비스 관련 광고 및 정보 제공</p>
			<p>수집하는 개인정보 항목 회사는 마케팅 활동을 위해 다음과 같은 개인정보를 수집할 수 있습니다: 성명, 이메일
				주소, 연락처, 생년월일 등 서비스 이용 기록, 방문 기록, 구매 이력 등</p>
			<p>개인정보 보유 및 이용 기간 마케팅 목적을 위한 개인정보는 해당 활동이 종료되거나, 귀하가 동의를 철회할 때까지
				보유 및 이용됩니다. 다만, 관련 법령에 의거하여 보유 기간이 필요한 경우 해당 기간 동안 보유될 수 있습니다.</p>
			<p>개인정보의 제3자 제공 회사는 귀하의 개인정보를 제3자에게 제공하지 않습니다. 단, 법적 요구가 있을 경우
				제3자에게 제공될 수 있습니다.</p>
			<p>마케팅 활용 동의 여부 귀하는 언제든지 마케팅 목적의 개인정보 수집 및 이용에 대해 동의를 철회할 수 있습니다.
				동의를 철회하더라도 서비스 이용에는 영향이 없습니다. 철회 방법은 [고객센터/설정 메뉴]에서 가능합니다.</p>
			<p>동의 거부 및 영향 마케팅 활동을 위한 개인정보 제공에 동의하지 않더라도 서비스 이용에는 전혀 불이익이
				없습니다. 다만, 동의하지 않으시면 마케팅 관련 혜택이나 정보를 받지 않게 됩니다.</p>
		</div>
	
	    <div class="agree-btn-area">
	        <label for="agree3_accept" class="agree-label">동의</label>
	        <input type="checkbox" name="marketingAgree" id="agree3_accept" class="agree-checkbox">
	        <label for="agree3_no_accept" class="agree-label">비동의</label>
	        <input type="checkbox" name="marketingAgree" id="agree3_no_accept" class="agree-checkbox">
	    </div>
	    <br><br>
	    <div class="agree-btn-area" id="all-accept" style="display: flex; background-color: rgb(233, 233, 233);
	    		 justify-content: center; align-items: center; height: 70px; border-radius: 20px;">
	    	<label for="agree_Allaccept" class="agree-label">전체 동의</label>
	        <input type="checkbox" name="agree_Allaccept" id="agree_Allaccept" class="agree-checkbox">
	        <label for="agreeAll_no_accept" class="agree-label">전체 비동의</label>
	        <input type="checkbox" name="agreeAll_no_accept" id="agreeAll_no_accept" class="agree-checkbox">
	    </div>
	    <br>
	    <div class="sign-up-form-group" align="center">
		    <button onclick="checkAgreeInfo();" class="sign-up-submit-btn" id="agreeInfo-submit-btn">다음</button>
		</div>
	</div>
	
	<script>
		function checkAgreeInfo(){
			var agree1Accept = $("#agree1_accept").prop("checked");
			var agree2Accept = $("#agree2_accept").prop("checked");
			var agree3Accept = $("#agree3_accept").prop("checked");
			var agree3NoAccept = $("#agree3_no_accept").prop("checked");
			
			if(agree3Accept || agree3NoAccept){
				if(agree1Accept && agree2Accept){
					var form = $("<form>").attr("action","userEnrollForm").attr("method","get");
					form.append($("#agree1_accept"));
					form.append($("#agree2_accept"));
					form.append($("#agree3_accept"));
					
					form.appendTo($(".outer"));
					
					form.submit();
				}
			}
		}
		
		$("#agree1_accept").click(function(){
			var agree1Accept = $(this).prop("checked");
			
			if(agree1Accept){
				$("#agree1_no_accept").prop("checked", false);
			}
		})
		
		$("#agree1_no_accept").click(function(){
			var agree1NoAccept = $(this).prop("checked");
			
			if(agree1NoAccept){
				$("#agree1_accept").prop("checked", false);
			}
		})
		
		$("#agree2_accept").click(function(){
			var agree2Accept = $(this).prop("checked");
			
			if(agree2Accept){
				$("#agree2_no_accept").prop("checked", false);
			}
		})
		
		$("#agree2_no_accept").click(function(){
			var agree2NoAccept = $(this).prop("checked");
			
			if(agree2NoAccept){
				$("#agree2_accept").prop("checked", false);
			}
		})
		
		$("#agree3_accept").click(function(){
			var agree3Accept = $(this).prop("checked");
			
			if(agree3Accept){
				$("#agree3_no_accept").prop("checked", false);
			}
		})
		
		$("#agree3_no_accept").click(function(){
			var agree3NoAccept = $(this).prop("checked");
			
			if(agree3NoAccept){
				$("#agree3_accept").prop("checked", false);
			}
		})
		
	
		$("#agree_Allaccept").click(function(){
			var checkAgree = $(this).prop("checked");
			
			if(checkAgree){
				$("#agreeAll_no_accept").prop("checked", false);
				$("#agree1_accept").prop("checked", true);
				$("#agree2_accept").prop("checked", true);
				$("#agree3_accept").prop("checked", true);
				$("#agree1_no_accept").prop("checked", false);
				$("#agree2_no_accept").prop("checked", false);
				$("#agree3_no_accept").prop("checked", false);
				
			}
			else{
				$("#agree1_accept").prop("checked", false);
				$("#agree2_accept").prop("checked", false);
				$("#agree3_accept").prop("checked", false);
			}
		});
		
		$("#agreeAll_no_accept").click(function(){
			var checkNoAgree = $(this).prop("checked");
			
			if(checkNoAgree){
				$("#agree_Allaccept").prop("checked", false);
				$("#agree1_no_accept").prop("checked", true);
				$("#agree2_no_accept").prop("checked", true);
				$("#agree3_no_accept").prop("checked", true);
				$("#agree1_accept").prop("checked", false);
				$("#agree2_accept").prop("checked", false);
				$("#agree3_accept").prop("checked", false);
			}
			else{
				$("#agree1_no_accept").prop("checked", false);
				$("#agree2_no_accept").prop("checked", false);
				$("#agree3_no_accept").prop("checked", false);
			}
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>