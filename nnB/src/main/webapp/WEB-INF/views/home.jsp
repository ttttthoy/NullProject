<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<style>
		a {
		  text-decoration: none;
		  color: inherit;
		}
		
		body {
		  background: #38c5b9;
		  font-family: 'Montserrat';
		  font-weight: 300;
		  line-height: 1.5;
		}
		
		main {
		  margin-top: 100px;
		  color: white;
		  text-align: center;
		}
		.wrap {
		  height: 100%;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		}
		
		.log{
		  margin-top: 100px;
		  width: 250px;
		  height: 45px;
		  font-family: 'Roboto', sans-serif;
		  font-size: 11px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #000;
		  background-color: #fff;
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
		.log:hover  {
		  background-color: #2EE59D;
		  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		  color: #fff;
		  transform: translateY(-7px);
		}
		.sign{
		  margin-top: 100px;
		  width: 250px;
		  height: 45px;
		  font-family: 'Roboto', sans-serif;
		  font-size: 11px;
		  text-transform: uppercase;
		  letter-spacing: 2.5px;
		  font-weight: 500;
		  color: #000;
		  background-color: #fff;
		  border: none;
		  border-radius: 45px;
		  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		  transition: all 0.3s ease 0s;
		  cursor: pointer;
		  outline: none;
		  }
		
		.sign:hover  {
		  background-color: #2EE59D;
		  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
		  color: #fff;
		  transform: translateY(-7px);
		}
		
				
	</style>
</head>
<body>
	
	<main>
      <h1><a href="#">NULLNULL BOOKS</a></h1>
      <p>책이 필요한 순간, 언제나 어디에서나.</p>
    </main>
    
    <div class="wrap">
        <button class="log"><a href="member/login">Log In</a></button>
      <button class="sign"><a href="member/memberReg">Sign Up</a></button>
    </div>

</body>
</html>
