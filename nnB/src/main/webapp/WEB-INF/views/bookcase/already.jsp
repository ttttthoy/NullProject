<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>읽었어요</title>

<script>
	/* function bookInfo(){
	
	 var f = document.formName;
	 f.action = 'bookInfo';
	 f.encoding = "multipart/form-data";
	 f.submit();
	
	 }
	 */
</script>

</head>

<body>


	<h1>찍히나봅시당</h1>
<%--	<input type="hidden" name="isbn" id="isbn" value="${b.isbn }">
		<input type="hidden" name="title" id="title" value="${b.title }">
		<input type="hidden" name="imag" id="imag" value="${b.imag }"> --%>
	
		<input type="hidden" name="isbn" id="isbn" value="${book.isbn }"> 
		<input type="hidden" name="member_num" id="member_num" value="${member.member_num }">
		<input type="hidden" name="imag" id="imag" value="${book.imag }">	
	

	<table>
		<tr>
<%-- 			<td rowspan="2"><a href="bookInfo/${book.isbn}"><img src="${book.imag}"></a></td>
			<td rowspan="4" width="800">"${b.title}"</td>
			<td width="200">${b.author}</td> --%>
		
			<td><img src="${note.b_imag }"> ${book.title }</td>
		
		</tr>
	</table>






</body>
</html>