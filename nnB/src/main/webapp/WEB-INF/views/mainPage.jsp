<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>


<P>  The time on the server is ${serverTime}. </P>

		<form id="btn">
	    <input type="button" value="HOME" onClick="location.href='login'">
	    </form>
	
	<h1>${member.member_name} 님 <small>반갑습니다.</small></h1>
	
    <a href="login"><input type="submit" value="로그아웃 "></a>
    <a href="memberInfo">마이페이지</a>
   
   
   <h1>독서노트 </h1>

<ul>
	<li><a href="../note/">독서노트</a></li>
	<li><a href="../bookSearch">책검색</a></li>
	<li><a href="../bookInfo">책 정보</a></li>
</ul>

</body>

</html>
