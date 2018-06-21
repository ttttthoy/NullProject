<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입완료</title>
	<style>
    * {
  margin: 0px auto;
  padding: 0px;
  font-family: 'Open Sans', sans-serif;
}
.back {
  position: absolute;
  width: 100%;
  height: 100%;
  background: #F0F0F0;      
}
.message{
  position: absolute;
  width: 350px;
  left:50%;
  top:40%;
  margin-left: -160px;
  margin-top: -160px;
}

.message {
  position: relative;
  width: 400px;
  float: left;
  background:#FFFFFF;
  border-radius: 10px;
  transition: all 0.5s;
}
h2{
text-align: center; 
margin-top: 10%;
}
p{
text-align: center;
font-family: 'Nanum Myeongjo', serif; 
font-weight: 100;
font-size: 15px;
margin-bottom: 5%;
        }
        img{
            margin-left: 45%;
            height: 40px;
            margin-top: 10%;
            margin-bottom: 10%;
        }

	</style>
</head>
<body >
    
    <div class="back">
    <br>
    <div class="message">
	<h2>${msg}</h2> <br>
    <p>반가워요. 당신의 이야기를 마음껏 펼쳐주세요!</p>
	<hr width="90%">
	<a href="../"><img src="${pageContext.request.contextPath}/resources/jspimg/home-button.png"></a>
	</div>
    </div>
</body>
</html>