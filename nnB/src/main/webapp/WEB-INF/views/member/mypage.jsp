<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My Page</title>
	<style>
	
	</style>
</head>
<body>		
		<form id="btn">
	    <input type="button" value="뒤로" onClink="window.back()">
	    <input type="button" value="앞으로" onClick="window.forward()">
	    <input type="button" value="HOME" onClick="location.href='login'">
	    </form>
	
	<h1>${member.member_name} 님 <small>반갑습니다.</small></h1>
	
    <a href="login"><input type="submit" value="로그아웃 "></a>
	
</body>
</html>