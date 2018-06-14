<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>	

	$(document).ready(function(){
		
		$('#loginForm').submit(function(){
			
			var uId = $('#member_id').val();
			var pw = $('#password').val();
			
			// 아이디 값이 있는지 확인
			if(uId.length < 1){
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			// 비밀번호값이 입력되었는지 확인
			if(pw.legth < 1){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
		});
					
	})

</script>
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
  background: #38c5b9;       
}

.log-box {
  position: absolute;
  width: 320px;
  left:50%;
  top:50%;
  margin-left: -160px;
  margin-top: -160px;
}

.log-box {
  position: relative;
  width: 320px;
  float: left;
  background:#FFFFFF;
  border-radius: 10px;
  transition: all 0.5s;
}

.ul_tabs > li { 
  position: relative;
  float: left;
  width: 50%;
  text-align: center;
  font-family: Helvetica;
  font-size: 30px;
  color: #FF8383;
  line-height: 14px;
  padding: 30px ;
  display: block;
}

.cont_text_inputs {
  position: relative;
  float: left;
  width: 100%;
  margin-top: 20px;
}

.input_form_sign {
  position: relative;
  float: left;
  width: 90%;
  border: none;
  border-bottom: 1px solid #B0BEC5 ;
  background-color: transparent;
  font-size: 14px;
  outline: none;
  transition: all 0.5s;
  height: 0px;
  margin: 0px;
  padding: 0px;  
  opacity: 0;
  display: none;
}

.active_inp {
  margin: 5% 5% ;  
  padding: 10px 0px;
  opacity: 1;
  height: 5px;
}

.input_form_sign:focus {
  border-bottom: 1px solid #FF8383 ;}

.link_forgot_pass {
  position: relative;
  margin-left: 30%;
  text-decoration: none;
  color: #999;
  font-size: 13px;
  display: none;
  float: left;
  transition: all 0.5s;
}

.cont_btn {
  position: relative;
  float: left;
}

.btn_sign {
  background: rgba(255,64,88,0.74);
  box-shadow: 0px 2px 20px 2px rgba(255,114,132,0.50);
  border-radius: 8px;
  padding: 15px 30px;
  border: none;
  color: #fff;
  font-size: 14px;
  position: relative;  
  float: left;
  margin-left: 100px;
  margin-top: 20px;
  margin-bottom: 20px;
  cursor: pointer;
}

.terms_and_cons {
  width: 70%;  
  color: #999;
  font-size: 13px;
  transition: all 0.5s;
}

.d_none {
  display: none;
}

.d_block {
  display: block;
}

.cont_text_inputs > input:nth-child(1){
  transition-delay: 0.2s;
}

.cont_text_inputs > input:nth-child(2){
  transition-delay: 0.4s;
}
.cont_text_inputs > input:nth-child(3){
  transition-delay: 0.6s;
}
.cont_text_inputs > input:nth-child(4){
  transition-delay: 0.8s;
}
</style>
</head>
<body>

<div class="back">

        <div class="log-box">
            <div class="cont_login">
                <form id="loginForm" action="/book/damso" method="post">
                    
                    <div class="cont_tabs_login">
                        <ul class='ul_tabs'>
                            <li class="active">Log In -
                        </ul>
                    </div>
                  
                    <div class="cont_text_inputs">
                  
                    <input type="text" id="member_id" class="input_form_sign d_block active_inp" placeholder="EMAIL" name="member_id" />
                        
                    <input type="password" id="password" class="input_form_sign d_block  active_inp" placeholder="PASSWORD" name="password" />  

                  <!-- <a class="link_forgot_pass d_block" onclick="location.href='http://localhost:8080/book/member/forgetpw" >Forgot Password ?</a>  -->   
					<!-- <button onclick="location.href='http://localhost:8080/book/member/forgetpw">button</button> -->
					<a class="link_forgot_pass d_block" href="http://localhost:8080/book/member/forgetpw" onclick="window.open(this.href,'_blanck','width=600, height=400'); return false">Forgot Password ?</a>
                  </div>
                  
                  <div class="cont_btn">
                     <button class="btn_sign">LOG IN</button>
                  </div> 

                </form>
            </div>
        </div>
    </div>

</body>
</html>