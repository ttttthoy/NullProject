<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>

	$(document).ready(function(){
				
		$(function(){
			$("#photofile").on('change', function(){
				readURL(this);
			});
		});
		
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#profileImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	
	
</script>

<body>

	<h1>마이 페이지</h1>

	<img id="profileImg" name="profileImg" 
		src="/book/resources/profileImg/${session.member_photo}" alt="프로필사진"
		width="100px" height="100px">

	<form action="/book/member/memberInfo" id="myPageForm" method="post" enctype="multipart/form-data">

		<input type="file" name="photofile" id="photofile"> <br>
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="member_name" id="member_name"
					value="${session.member_name}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="member_pw" id="member_pw"
					value="${session.member_pw }"></td>
			</tr>
<!-- 			<tr>
				<td>비밀번호 확인</td>
				<td>
				<input type="password" name="pwchk" id="pwchk">
				<span id="pwdchkMsg"></span>
				</td>
			</tr> -->
			<tr>
				<td>읽은 책 권수</td>
				<td></td>
			</tr>
			<tr>
				<td>독서노트 수</td>
				<td></td>
			</tr>
			<tr>
				<td>
				<input type="hidden" name="member_id" id="member_id" value="${session.member_id }"> 
				<input type="hidden" name="member_num" id="member_num" value="${session.member_num }">
				<input type="hidden" name="member_photo" id="member_photo" value="${session.member_photo }">
				</td>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>

</body>
</html>