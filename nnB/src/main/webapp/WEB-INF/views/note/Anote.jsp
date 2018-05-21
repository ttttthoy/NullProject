<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#like').click(function(){
        
        $.ajax({
           url: '<%=request.getContextPath()%>/note/like',
				type : 'post',
				dataType : 'text',
				data : {
					note_id : $('#note_id').val(),
					mem_id : $('#mem_id').val(),
					status : $('#status').val()
				},
				success : function(data) {
				}
			})

			if ($(this).val() == '♡LIKE♡') {
				$(this).val('♥LIKED♥');
			}

			else {
				$(this).val('♡LIKE♡');
			}
		})
	})
</script>

<input type="hidden" id="note_id" value="${note.note_id }">
<input type="hidden" id="mem_id" value="${note.mem_id }">
<input type="hidden" id="status" value="${status }">
<body>
	<table>
		<tr>
			<td><img src="${note.b_imag }"> ${book.title }</td>
		</tr>
		<tr>
			<td>저자 | ${note.b_author }</td>
		</tr>
		<tr>
			<td>출판사 | ${note.b_publisher }</td>
		</tr>
		<tr>
			<td>출판년도 | ${note.b_pubdate }</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td>독서 노트</td>
		</tr>
		<tr>
			<td>${note.note_contents }</td>
		</tr>
		<tr>
			<td><c:if test="${status}">
					<input type='button' id='like' value='♥LIKED♥'>
				</c:if> <c:if test="${!status }">
					<input type='button' id='like' value='♡LIKE♡'>
				</c:if></td>

		</tr>
	</table>

</body>
</html>