<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>마이 페이지</h1>

	<img src="/book/resources/profileImg/${session.member_photo }"
		alt="프로필사진" width="100px" height="100px">

	<form method="post">
		<table>
			<tr>
				<td>이름</td>
				<td>${session.member_name}</td>
			</tr>
			<tr>
				<td>읽은 책 권수</td>
				<td></td>
			</tr>
			<tr>
				<td>독서노트 수</td>
				<td></td>
			</tr>
			<tr>
			 	<td></td>
				<td><a href="memberInfo/edit">회원정보수정</a></td>
			</tr>
		</table>
	</form>
</body>
</html>