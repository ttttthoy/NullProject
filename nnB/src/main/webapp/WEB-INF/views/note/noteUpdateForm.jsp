<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>


</head>
<body>
<form method="post">

		<input type="hidden" name="note_id" value="${note.note_id }">
		<input type="hidden" name="isbn" value="${note.isbn }">
		<input type="hidden" name="member_num" value="${note.member_num }">
		<input type="hidden" name="joayo" value="${note.joayo }">
		<input type="hidden" name="b_title" value="${note.b_title}">
		<input type="hidden" name="b_imag" value="${note.b_imag}">
		<input type="hidden" name="b_author" value="${note.b_author}">
		<input type="hidden" name="b_publisher" value="${note.b_publisher}">
		<input type="hidden" name="b_pubdate" value="${note.b_pubdate}">
		<input type="hidden" name="b_description" value="${note.b_description }">
		
		
	<table>
			<tr>
				<td><input type="radio" name="pub_priv" ondblclick="this.checked=false" value="1">비공개</td>
			</tr>
			<tr>
				<td><img src = "${note.b_imag }"> ${note.b_title }</td>
			</tr>
			<tr>
				<td>저자 | ${note.b_author }</td>
			</tr>
			<tr>
				<td>출판사 |  ${note.b_publisher }</td>
			</tr>
			<tr>
				<td>출판년도 | ${note.b_pubdate }</td>
			</tr>
			<tr>
				<td>줄거리 | ${note.b_description }</td>
			</tr>
			<tr>
				<td>독서 노트 </td>
			</tr>
			<tr>
				<td>
				<input type="text" name="note_title" id="note_title" value="${note.note_title }"></td>
			</tr>
			<tr>
				<td>
				<textarea id="summernote" name="note_contents">${note.note_contents }</textarea>
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