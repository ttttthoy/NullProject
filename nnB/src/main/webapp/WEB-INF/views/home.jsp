<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	독서노트 
</h1>

<P>  The time on the server is ${serverTime}. </P>



<ul>
	<li> <a href="member/memberReg">회원가입</a> </li>
	<li> <a href="member/login">로그인</a> </li>
	<li> <a href="member/myInfo">마이페이지</a></li>
</ul>
<br>
<ul>	
	<li><a href="note/">독서노트</a></li>
	<li><a href="bookSearch">책검색</a></li>
	<li><a href="bookInfo">책 정보</a></li>
</ul>

</body>

</html>