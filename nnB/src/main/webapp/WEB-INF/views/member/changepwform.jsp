<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경 </title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>	

	$(document).ready(function(){
		
		$('#Pwsearchform').submit(function(){
			
			var pw = $('#member_pw').val();
			var pw2 = $('#member_pw2').val();

			if(pw.legth < 1){
				alert('비밀번호를 입력해주세요.');
				return false;
			}

			 }
		})
	})
</script>
<body>
<h1>비밀번호 변경</h1>
<form id="Pwsearchform"  method="post">
<input type = "hidden" name="member_id" value="${param.id}">
<table>
<tr>
<td>새 비밀번호</td>
<td><input id="member_pw"  type="password"  name="member_pw"></td>
</tr>

</table>
<input type="submit" value="변경"></input>
</form>
</body>
</html>