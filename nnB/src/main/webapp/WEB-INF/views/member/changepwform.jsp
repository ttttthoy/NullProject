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
            height: 30px;
            margin-top: 10%;
            margin-bottom: 10%;
        }

	</style>
</head>
<body >
    
    <div class="back">
    <br>
    <div class="message">
	<h2>비밀번호 변경</h2> <br>
	<form id="Pwsearchform"  method="post">
	<hr width="90%">
    <br>
    <input id="member_pw"  type="password"  name="member_pw" style="width:70%; margin-left: 60px;">
    <br>
	<input type="submit" value="변경" style="margin-left: 45%; margin-top: 10px; border: 0px; background-color: #ff9393; width:50px; height: 30px; border-radius: 5px;">
	</input>
	</form>
	</div>
    </div>
</body>
</html>