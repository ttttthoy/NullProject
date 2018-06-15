<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
	<style>
		
		* {
			padding : 0;
		}
		
		a {
		  text-decoration: none;
		  color: inherit;
		  display : block;
		}
		
		body {
		  background: #F0F0F0;
		  font-family: 'Nanum Myeongjo', serif;
		  font-weight: 300;
		  line-height: 1.5;
		}
		
		main {
		  margin-top: 100px;
		  color: black;
		  text-align: center;
		  letter-spacing:15px;
		}
		.wrap {
		  height: 100%;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  margin-top:100px;
		}
		
		.log{
		  margin-top: 100px;
		  width: 250px;
		  height: 45px;
		  font-family: 'Nanum Myeongjo', serif;
		  font-size: 11px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #fff;
		  background-color: #FE8095;
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
		.log:hover  {
		  background-color: #A0D1AE;
		  box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
		  color: #fff;
		  transform: translateY(-7px);
		}
		.sign{
		  margin-top: 100px;
		  margin-left:20px;
		  width: 250px;
		  height: 45px;
		  font-family: 'Nanum Myeongjo', serif;
		  font-size: 11px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #fff;
		  background-color: #FE8095;
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
		.sign:hover  {
		  background-color: #A0D1AE;
		  box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
		  color: #fff;
		  transform: translateY(-7px);
		}
		
		img{
			width:40%;
		}
				
	</style>
</head>
<body>
	<center>
	<main>
      <a href="#"><img id="home_but" src="${pageContext.request.contextPath}/resources/jspimg/logo.png"> </a>
      <h3>책이 필요한 순간, </h3>
    </main>
    </center>
    <div class="wrap">
        <button class="log"><a href="member/login">Log In</a></button>
        <button class="sign"><a href="member/memberReg">Sign Up</a></button>
    </div>

</body>
</html>
