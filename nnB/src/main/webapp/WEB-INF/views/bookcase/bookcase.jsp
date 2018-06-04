<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	var menuClick = function(url) {

		if (url == '/') {

			location.reload(true);
			return;
		
		}

		$.ajax({

			type : 'POST',
			url : url,
			async : false,
			data : "",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
				$('#Container').html(data);

				if (isMenuHide)
					menuOff();

			},

			error : function(request, status, error) {

				alert(error);
			}

		});

	};
</script>

</head>
<body>

	<div id="wrapper">

		<div id="left">
			<a href="javascript:menuClick('/a.jsp');">a link</a><br/>
			<a href="javascript:menuClick('/b.jsp');">b link</a>
		</div>
		
		<div id="Content">
		
			<!-- 화면전환 부분 --> 
		
		</div>
	</div>

</body>
</html>