<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bit.nullnull.book.service.bookSearchService" %>
<%@ page import="com.bit.nullnull.book.model.ReadBook"%>

<jsp:useBean id="bookSearchService"
	class="com.bit.nullnull.book.service.bookSearchService" scope="page" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책장</title>

</head>
<body>
<h4>책장ㅇㅅㅇ</h4>

	<table>
		<tr>
			<td>
				<a href="/book/bookcase/already">읽었어요</a>
				<a href="/book/bookcase/now">읽고있어요</a>
				<a href="/book/bookcase/willread">읽고싶어요</a>
			</td>
		</tr>
	
	</table>


</body>
</html>