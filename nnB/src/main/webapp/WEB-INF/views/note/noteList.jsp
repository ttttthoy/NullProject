<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bit.nullnull.book.service.bookSearchService" %>
<%@ page import="com.bit.nullnull.book.model.Book" %>

<jsp:useBean id="bookSearchService" class="com.bit.nullnull.book.service.bookSearchService" scope="page"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서 노트 리스트</title>
</head>
<body>
<h3> 독서노트 리스트 </h3>

<table>

	<tr>
		<td>No.</td>
		<td>책</td>
		<td>저자</td>
		<td>회원 번호</td>
		<td>공개여부</td>
		<td>츄즈원</td>
	</tr>

	<c:forEach var="note" items="${notes}" varStatus="status">
	<tr>
		<td>${note.note_id }</td>
		<td>${note.b_title }</td>
		<td>${note.b_author }</td>
		<td>${note.mem_id }</td>
		<td>
		<c:if test="${note.pub_priv == '1' }">
		비공개
		</c:if>
		<c:if test="${note.pub_priv == '0' }">
		공개
		</c:if>
		</td>
		<td>
			<a href="${note.note_id}/${note.mem_id}/Anote">보기</a>
			<a href="${note.note_id }/noteUpdate">수정</a>
			<a href="${note.note_id}/noteDelete">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>