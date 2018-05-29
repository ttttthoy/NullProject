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
					member_num : $('#member_num').val(),
					status : $('#l_status').val()
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
		
	$('#follow').click(function(){
	        
	        $.ajax({
	           url: '<%=request.getContextPath()%>/member/follow',
					type : 'post',
					dataType : 'text',
					data : {
						follower : $('#session_num').val(),
						following : $('#member_num').val(),
						f_status : $('#f_status').val()
					},
					success : function(data) {
					}
				})

				if ($(this).val() == '팔로우') {
					$(this).val('팔로잉');
				}

				else {
					$(this).val('팔로우');
				}
			})
			
	})
</script>


<body>

	<img src="/book/resources/profileImg/${session.member_photo }" alt="프로필사진" width="50px" height="50px"> ${session.member_name }님


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
			<td>줄거리 | ${note.b_description }</td>
		</tr>
		<tr>
			<td>독서 노트</td>
		</tr>
		<tr>
			<td>${note.note_contents }</td>
		</tr>
		<tr>	
			<td>
			<img src="/book/resources/profileImg/${noteMem.member_photo }"  alt="프로필사진" width="50px" height="50px"> 
			${noteMem.member_name } 님
			<input type="hidden" id="note_id" value="${note.note_id }">
			<input type="hidden" id="member_num" value="${note.member_num }">
			<input type="hidden" id="status" value="${status }">
			<input type="hidden" id="session_num" value="${session.member_num }">
			<input type="hidden" id="f_status" value="${f_status }">
			
			<c:if test="${session.member_num != note.member_num}">
				<c:if test="${f_status}">
					<input type='button' id='follow' value='팔로잉'>
				</c:if> 
				<c:if test="${!f_status }">
					<input type='button' id='follow' value='팔로우'>
				</c:if>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>
			<c:if test="${l_status}">
				<input type='button' id='like' value='♥LIKED♥'>
			</c:if> <c:if test="${!l_status }">
				<input type='button' id='like' value='♡LIKE♡'>
			</c:if>
			</td>
		</tr>
	</table>

</body>
</html>