<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	
	

</script>

</head>
<body>

	<table>
		<tr>
			<td rowspan="2"><a href="bookInfo/${b.isbn}"><img
					src="${b.imag}"></a></td>
			<td rowspan="4" width="800">"${b.title}"</td>
			<td width="200">${b.author}</td>
		</tr>

	</table>




</body>
</html>