<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gamja+Flower|Nanum+Myeongjo" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchpw.css" rel="stylesheet">
</head>
<body >
	<script>
$(document).ready(function(){
			$('#Pwsearchform').submit(function(){
				var userId = $('#member_id').val();
				
				if(userId.length < 1){
					alert('아이디를 입력해주세요.');
					$('#member_id').focus();
					return false;
				}
			});
			$('#member_id').focusout(function(){
				var memberId = $(this).val();
				if(memberId.length > 5){
					$.ajax({
						url : '<%=request.getContextPath()%>/member/forgetpw',
						type : 'post',
						dataType : 'text',
						data : {
							userid : memberId
						},
						success : function(data) {
							if (data == "N") {
								$('#idChkMsg').text('일치하는 아이디입니다..');
								$('#idChkMsg').css('color', 'blue');
								$('#idchk').prop("checked", true);
							} else if (data == 'Y') {
								$('#idChkMsg').text('확인후 다시 입력하여주세요.');
								$('#idChkMsg').css('color', 'red');
							}
						}
					});

				} else {
					$('#idChkMsg').text('아이디는 6자 이상이어야 합니다.');
				}

			});

			$('#member_id').focusin(function() {
				$('#idchk').prop("checked", false);
				$('#idChkMsg').text('');
				$('#idChkMsg').css('color', '#ff8040');
				
			});
		});
	</script>
	<div class="inform">
	<h1>비밀번호 찾기</h1>
	<form id="Pwsearchform" method="post">
		<br>
		
			<div class="maintitle">			
				<p class="idinput">아이디(이메일)</p>
				<div >
				<input type="checkbox" id="idchk" value="Y" hidden="hidden">
					<input type="text" name="member_id" id="member_id"></div> <span
					id="idChkMsg"></span>
					
					</div>

		<hr style="margin-bottom: 12px;
	margin-top: 30%; ">
		<p class="sub" >@을 포함한 아이디를 입력해주세요.</p>
	
	<!-- 	 <input type="submit" value="find"></input>
		<button type="button" onclick="javascript:self.close();"
			class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
	 -->
	
		<div class="icon" >
		<input TYPE="IMAGE"
				src="${pageContext.request.contextPath}/resources/jspimg/checked-symbol.png"
				name="Submit" value="Submit" align="absmiddle"
				style="height: 30px; margin: 20px;"> 
				<input TYPE="IMAGE"
				src="${pageContext.request.contextPath}/resources/jspimg/close-button.png"
				name="Submit" value="Submit" align="absmiddle"
				style="height: 30px; margin: 20px;" onclick="javascript:self.close();">
		</div>
			</div>
</body>
</html>