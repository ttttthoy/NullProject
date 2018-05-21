<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서노트 작성</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<style>

</style>
</head>
<body>

	<h1>독서노트 작성란</h1>
	<br>
	<form method="post">
		<input type="hidden" name="isbn" value="${book.isbn}">
		<input type="hidden" name="mem_id" value="${session.member_num }">
		<input type="hidden" name="like" value="0">
		<input type="hidden" name="b_title" value="${book.title}">
		<input type="hidden" name="b_imag" value="${book.imag}">
		<input type="hidden" name="b_author" value="${book.author}">
		<input type="hidden" name="b_publisher" value="${book.publisher}">
		<input type="hidden" name="b_pubdate" value="${book.pubdate}">
		
		<table>
			<tr>
				<td><input type="radio" name="pub_priv" ondblclick="this.checked=false" value="1">비공개</td>
			</tr>
			<tr>
				<td><img src = "${book.imag }"> ${book.title }</td>
			</tr>
			<tr>
				<td>저자 | ${book.author }</td>
			</tr>
			<tr>
				<td>출판사 |  ${book.publisher }</td>
			</tr>
			<tr>
				<td>출판년도 | ${book.pubdate }</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td>독서 노트 </td>
			</tr>
			<tr>
				<td>
				<textarea id="summernote" name="note_contents"></textarea>
				</td>
			</tr>	
			<tr>
				<td><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
	
	<script>
		$(document).ready(function(){
			$('#summernote').summernote({
				lang: 'ko-KR'
			});
		});
	</script>
</body>
</html>