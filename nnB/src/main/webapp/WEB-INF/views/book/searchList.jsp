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
<link href="${pageContext.request.contextPath}/resources/css/searchlist.css" rel="stylesheet">
 <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
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
<nav class="navbar navbar-light bg-light static-top" style="position: fixed;">
		<div class="container">
			<a class="navbar-brand"
				href="http://localhost:8080/book/member/login"><img src="${pageContext.request.contextPath}/resources/jspimg/logo.png" style="width: 70px;"></a>
			<div class="topMenuLi">
				<img class="member"
					src="/book/resources/profileImg/${loginInfo.member_photo}">
				<ul class="submenu">
				<li class="name"><a class="submenuLink longLink" style="font-family: 'Nanum Myeongjo', serif; font-size: 15px;">${loginInfo.member_name}님.</a></li>
					<hr width =100% color="black" align="center"  size=4/>
					<li><a class="submenuLink longLink" href="">책&nbsp;&nbsp;장</a></li>
					<li><a class="submenuLink longLink" href="http://localhost:8080/book/member/memberInfo">MY
							PAGE</a></li>
					<li><a class="submenuLink longLink" href="/login">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
<div class="totalbody">
	<center>
	<div class="col-md-8 col-lg-8 col-xl-7 mx-auto" >
					<form action="/book/bookSearch" method="post" id="searchF"
						onSubmit="return check()">
						<div class="form-row" style="margin-bottom: 50px; margin-top: 70px; margin-left: 60px;">
							<div class="col-10 col-md-7 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg"
									name="keyword" id="keyword" placeholder="당신의 이야기를 찾아보세요.">
							</div>
		
							<div class="col-8 col-md-3">
								
								<input  TYPE="IMAGE" src="${pageContext.request.contextPath}/resources/jspimg/search.png" name="Submit" value="Submit"  align="absmiddle"
								style="height:50px">
							</div>
						</div>
					</form>
				</div>
						</center>
		<table style="width:960px; margin:0 auto;">
		<div class="booklist">
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
					<td rowspan="1"><a href="bookInfo/${b.isbn}"><img src="${b.imag}" style="margin-left: 30px; margin-bottom: 30px; width: 50px;"></a></td>
					<td rowspan="2" width="300">"${b.title}"</td>
					<td width="100">${b.author}</td>
					<td><a href="bookNote/${b.isbn}"><img src="${pageContext.request.contextPath}/resources/jspimg/booknoteicon.png" style="width: 30px;"></a></td>
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
 --%>		
				</div>
				<tr>
					<td colspan="7" width="100%" bgcolor="pink"></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>