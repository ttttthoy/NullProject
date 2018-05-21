<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>회원 리스트</title>
	<style>
		table {
			width: 80%;		
		}
		td {
			padding : 0px 10px;
		}
	</style>
</head>
<body>

	<h3>회원리스트</h3>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
		</tr>
		
		<c:forEach var="Member" items="${Member}">
		<tr>
			<td>${Member.idx}</td>
			<td>${Member.member_id}</td>
			<td>${Member.member_name}</td>
			<td>
				<a href="#">보기</a>  
			 	<a href="#">수정</a>  
				<a href="#">삭제</a>
			</td>
		</tr>
		</c:forEach>	
		
	</table>

</body>
</html>