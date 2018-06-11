<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->

</head>

<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" action="/book/member/memberInfo" id="myPageForm" method="post" enctype="multipart/form-data">
					<span class="login100-form-title p-b-70">
						My Page
					</span>
					<span class="login100-form-avatar">
						<img id="profileImg" name="profileImg" 
		src="/book/resources/profileImg/${session.member_photo}" alt="프로필사진">
					</span>
                   
					<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate = "Enter username">
						닉네임
                        <div class="input100"> ${session.member_name }</div>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						비밀번호
                        <input class="input100" type="password" name="member_pw" id="member_pw" value="${session.member_pw}">
						<span class="focus-input100" ></span>
					</div>

<input type="hidden" name="member_id" id="member_id" value="${session.member_id }"> 
				<input type="hidden" name="member_num" id="member_num" value="${session.member_num }">
				<input type="hidden" name="member_photo" id="member_photo" value="${session.member_photo }">
				
					<div class="container-login100-form-btn">
						<div class="login100-form-btn"><input class="login100-form-btn" type="submit" value="수정"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	


	<h1>마이 페이지</h1>

	<img src="/book/resources/profileImg/${session.member_photo }"
		alt="프로필사진" width="100px" height="100px">

	<form method="post">
		<table>
			<tr>
				<td>이름</td>
				<td>${session.member_name}</td>
			</tr>
			<tr>
				<td>읽은 책 권수</td>
				<td></td>
			</tr>
			<tr>
				<td>독서노트 수</td>
				<td></td>
			</tr>
			<tr>
			 	<td></td>
				<td><a href="memberInfo/edit">회원정보수정</a></td>
			</tr>
		</table>
	</form>
</body>

<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/popper.js"/>"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/daterangepicker/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/countdowntime/countdowntime.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/js/main.js"/>"></script>

</html>