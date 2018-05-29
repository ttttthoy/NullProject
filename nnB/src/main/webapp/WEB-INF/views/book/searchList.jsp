<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>

function bookInfo(){
	
	var f = document.formName;
	f.action = 'bookInfo';
	f.encoding = "multipart/form-data";
	f.submit();
	
}

function bookNote(){
	
	var f=document.formName;
	f.action = "note/noteUploadForm";
	f.submit();
}

</script>

<script>
	
function check(){
	  if($.trim($("#keyword").val())==""){
	 	  alert("키워드를 입력하세요!");
	  	 return false;
	  } 
	  return true;
}
	
</script>

<body>
	<center>
		<form method="post" onSubmit="return check()">
			<input type="text" name="keyword" id="keyword"> 
			<input type="submit" value="검색">
		</form>

	</center>
	
		<table>
			<tr>
				<td colspan="7" width="100%" bgcolor="pink"></td>
			</tr>
		
			<c:forEach items="${bookList}" var="b">
			<input type="hidden" name="isbn" id = "isbn" value="${b.isbn }">
			<input type="hidden" name="title" id = "title" value="${b.title }">
			<input type="hidden" name="imag" id = "imag" value="${b.imag }">
			<input type="hidden" name="author" id="author" value="${b.author }">
			<input type="hidden" name="publisher" id="publisher" value="${b.publisher }">
			<input type="hidden" name="pubdate" id="pubdate" value="${b.pubdate }">
			<input type="hidden" name="description" id="description" value="${b.description }">
			<input type="hidden" name="isbn" value=%{b.isbn} />
				<tr>
					<td rowspan="2"><a href="bookInfo/${b.isbn}"><img src="${b.imag}"></a></td>
					<td rowspan="4" width="800">"${b.title}"</td>
					<td width="200">${b.author}</td>
				</tr>
<%-- 				<tr>
					<td width="200">link : ${b.link }</td>
					<td width="200">출판사 : ${b.publisher }</td>
					<td width="200">출판일 : ${b.pubdate }</td>
					<td width="200">ISBN : ${b.isbn }</td>

				</tr>
				<tr>
					<td colspan="7">${b.description}</td>
				</tr>
 --%>				<tr>
					<td><a href="bookNote/${b.isbn}">독서 노트</a></td>
				</tr>
				<tr>
					<td colspan="7" width="100%" bgcolor="pink"></td>
				</tr>
			</c:forEach>
			
		</table>

</body>
</html>