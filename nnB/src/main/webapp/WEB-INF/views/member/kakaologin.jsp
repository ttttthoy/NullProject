<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>

/* div.box {
	border: 0px;
} */
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


</head>
<body>
	<h1>LOGIN</h1>

<%-- 	<form action="oauth/kakao" method="post">
		<table>
			<tr>
			</tr>
		</table>

		이메일 <input type="text" name="userid"> <br> 
		비밀번호  <input type="password" name="password"> <br> 
		<input type="hidden" name="referer" value="${referer}"> 
		<input type="submit" value="로그인">
			
	</form>

	<div class="box"> --%>
	
		<a id="kakao-login-btn"></a> 
		<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('6e9f5152f36c7e383cbef5e44c5f4e74');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				size : 'large',
				success : function(authObj) {
					// 로그인 성공시, API를 호출합니다.
					Kakao.API.request({
						url : '/v1/user/me',
						success : function(res) {
							alert(JSON.stringify(res));
							var jsonval = JSON.parse(JSON.stringify(res));
							alert(jsonval);
							alert(jsonval.kaccount_email);
							alert(jsonval.properties.thumbnail_image);
							alert(jsonval.properties.nickname);

							// 내부 서버로 데이터를 넘겨 세션을 만들어준다. 내부서버에는 해당 데이터들을 받아 처리할 controller 필요.
							$.ajax({
								type : "POST",
								data : "kakaoEmail=" + jsonval.kaccount_email
										+ "&kaccount_email_verified="
										+ jsonval.kaccount_email_verified
										+ "&id=" + jsonval.id
										+ "&profile_image="
										+ jsonval.properties.profile_image
										+ "&nickname="
										+ jsonval.properties.nickname
										+ "&thumbnail_image="
										+ jsonval.properties.thumbnail_image,
								url : "oauth/kakao",
								success : function() {
									alert("카카오 로그인에 성공하였습니다.");
									window.location = "mypage/main?type=kakao";
								}
							});
						},
						fail : function(error) {
							alert(JSON.stringify(error));
						}
					});

				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			//]]>
		</script>

	</div>

</body>
</html>
