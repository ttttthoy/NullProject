<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>읽었어요</title>

</head>

<body>
<h3>읽었어요 도서리스트</h3>
	
	<table>
			<%-- <img src="${bookread.imag }"></td> --%>
				<c:if test="${bookread.state_num == 0}">
				<c:forEach var="bookread" items="${readbook}" varStatus="status">
					<tr>
							<td>${bookread.imag }</td>
							<td>${bookread.member_num }</td>
					</tr>
				</c:forEach>
				</c:if>
				
	</table>

</body>
</html>