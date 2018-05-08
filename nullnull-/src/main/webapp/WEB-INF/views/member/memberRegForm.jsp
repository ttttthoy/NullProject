<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입 폼</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
		$(document).ready(function(){
			
			$('#regForm').submit(function(){
				var userId = $('#member_id').val();
				var pw = $('#password').val();
				var userName = $('#member_name').val();
				
				if(userId.length < 1){
					alert('아이디를 입력해주세요.');
					$('#member_id').focus();
					return false;
				}
				if(pw.length < 1){
					alert('비밀번호를 입력해주세요.');
					$('#password').focus();
					return false;
				}
				if(userName.length < 1 ){
					alert('이름을 입력해주세요.');
					$('#member_name').focus();
					return false;
				}
				if($('#idchk').val() != "Y"){
					alert('아이디 중복 여부를 확인해주세요.');
					$('#member_id').focus();
					return false;
				}
				
			});
			
			$('#member_id').focusout(function(){
				
				var memberId = $(this).val();
				
				if(memberId.length > 5){
					
					$.ajax({
						url : '<%= request.getContextPath()%>/member/idchk',
						type : 'post',
						dataType : 'text',
						data : {
							userid : memberId
						},
						success : function(data){
							if(data == "Y"){
								$('#idChkMsg').text('사용가능한 아이디입니다.');
								$('#idChkMsg').css('color', 'blue');
								$('#idchk').prop("checked", true);
							} else if(data == 'N') {
								$('#idChkMsg').text('이미 사용중인 아이디입니다.');
								$('#idChkMsg').css('color', 'red');
							}
						}					
					});
					
					
				} else {
					$('#idChkMsg').text('아이디는 6자 이상이어야 합니다.');
				}
				
			});
			
			$('#member_id').focusin(function(){
				$('#idchk').prop("checked", false);		
				$('#idChkMsg').text('');
				$('#idChkMsg').css('color', 'black');
			});
		});

	</script>
	<style>
	
	</style>
</head>
<body>

	<h1>회원가입 폼</h1>
	<form action="memberReg" id="regForm" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td>
				<input type="checkbox" id="idchk" value="Y" hidden="hidden">
				<input type="text" name="member_id" id="member_id"> 
				<span id="idChkMsg"></span>
			</td>
		</tr> 
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" id="password">  </td>
		</tr> 
		<tr>
			<td>이름</td>
			<td><input type="text" name="member_name" id="member_name">  </td>
		</tr> 
		<tr>
			<td></td>
			<td>
				<input type="submit" value="가입">
				<input type="reset">
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>