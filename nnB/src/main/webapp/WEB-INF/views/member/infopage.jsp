<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gamja+Flower|Nanum+Myeongjo" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <script src="<c:url value="/resources/js/jquery-1.11.3.min.js" />"></script>
<title>안내페이지</title>
</head>
<style>
  * {
    margin: 0;
    padding: 0;
    font-size: 100%;   
}
a {
    text-decoration: none;
}
* {
list-style: none;
}
body {
	font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-family: 'Nanum Myeongjo', serif;
}
    .total{
       width: 70%; 
       margin: 0 auto;
       margin-top: 25px;
    }
    .change{
        font-size: 30px;
        font-weight: bold;
    }    
   .retry{
        font-size: 16px;
        font-family: 'Do Hyeon', sans-serif;
        color: #ff8040;
    }
</style>
<body>
    <div class="total">
		<p class="change">변경이 완료되었습니다.</p> 
		<hr style="margin-bottom: 12px; margin-top: 19px; ">
		<p class="retry">다시 접속 부탁드립니다. </p>
	
		</div>
</body>
</html>