<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript"
 src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
  background: #F0F0F0;       
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
  text-align: left;
  font-family: 'Open Sans', sans-serif;
  font-size: 30px;
  color: #FE8095;
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
  background: #FE8095;
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



 div.box {
 
  border: 0px;
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
                            <li class="active">Log In . 
                        </ul>
                    </div>
                  
                    <div class="cont_text_inputs">
                  
                    <input type="text" id="member_id" class="input_form_sign d_block active_inp" placeholder="EMAIL" name="member_id" />
                        
                    <input type="password" id="password" class="input_form_sign d_block  active_inp" placeholder="PASSWORD" name="password" />  

                 	<a class="link_forgot_pass d_block" href="http://localhost:8080/book/member/forgetpw" onclick="window.open(this.href,'_blanck','width=450, height=278 left=100 top=150' ); return false">Forgot Password ?</a>
                  </div>
                  
                  <div class="cont_btn">
                     <button class="btn_sign">LOG IN</button>
                  </div> 

                </form>
            </div>
        </div>
        
        
  <div class="box">
  <a id="kakao-login-btn"></a> 
  <a href="http://developers.kakao.com/logout"></a>
  <script type='text/javascript'>
   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('6e9f5152f36c7e383cbef5e44c5f4e74');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     size:'large',
         success: function(authObj) {
           // 로그인 성공시, API를 호출합니다.
           Kakao.API.request({
             url: '/v1/user/me',
             success: function(res) {
/*                alert(JSON.stringify(res)); */
               var jsonval = JSON.parse(JSON.stringify(res));
/*                alert(jsonval); */
               alert(jsonval.kaccount_email);
               alert(jsonval.properties.thumbnail_image);
               alert(jsonval.properties.nickname);   
               
               
               // 내부 서버로 데이터를 넘겨 세션을 만들어준다. 내부서버에는 해당 데이터들을 받아 처리할 controller 필요.
              $.ajax({
                type : "POST",
                data : "kakaoEmail="+jsonval.kaccount_email+
                "&kaccount_email_verified="+jsonval.kaccount_email_verified+
                "&id="+jsonval.id+
                "&profile_image="+jsonval.properties.profile_image+
                "&nickname="+jsonval.properties.nickname+
                "&thumbnail_image="+jsonval.properties.thumbnail_image,
                url : "oauth/kakao",
                success : function(){
                 alert("카카오 로그인에 성공하였습니다.");
                 /* window.location = "mypage/main?type=kakao"; */
                 location.href="./damso";
                 }
                });
             },
             fail: function(error) {
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
        
        
    </div>
    
   
    

</body>
</html>