<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sign up</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
		$(document).ready(function(){
			
			var chk=0;
			
			
			$('#regForm').submit(function(){
				
				
				if(chk == 1){
					alert('처리중입니다');
					return false;	
				}	
				
				var userId = $('#member_id').val();
				var pw = $('#member_pw').val();
				var pc = $('#passcheck').val();
				var userName = $('#member_name').val();
				
				
				if(userId.length < 1){
					alert('아이디를 입력해주세요.');
					$('#member_id').focus();
					return false;
				}
				if(pw.length < 1){
					alert('비밀번호를 입력해주세요.');
					$('#member_pw').focus();
					return false;
				}
				if(pc.length < 1){
					alert('비밀번호 확인을 입력해주세요.');
					$('#passcheck').focus();
					return false;
				}
				if (pw != pc){
					alert('비밀번호가 일치하지 않습니다. ');
					return false;
				}
				if(userName.length < 1 ){
					alert('이름을 입력해주세요.');
					$('#member_name').focus();
					return false;
				}
				if($('#idchk').val() != "Y"){
					alert('아이디 중복 여부를 확인해주세요.');
					$('#member_id').focus();
					return false;
				}
				
				chk = 1;
				
			});
			
			$('#member_id').focusout(function(){
				
				var memberId = $(this).val();
				
				if(memberId.length > 5){
					
					$.ajax({
						url : '<%= request.getContextPath()%>/member/idchk',
						type : 'post',
						dataType : 'text',
						data : {
							userid : memberId
						},
						success : function(data){
							if(data == "Y"){
								$('#idChkMsg').text('사용가능한 아이디입니다.');
								$('#idChkMsg').css('color', 'blue');
								$('#idchk').prop("checked", true);
							} else if(data == 'N') {
								$('#idChkMsg').text('이미 사용중인 아이디입니다.');
								$('#idChkMsg').css('color', 'red');
							}
						}					
					});
					
					
				} else {
					$('#idChkMsg').text('아이디는 6자 이상이어야 합니다.');
				}				
			});
						
			$('#member_id').focusin(function(){
				$('#idchk').prop("checked", false);		
				$('#idChkMsg').text('');
				$('#idChkMsg').css('color', 'black');
			});
			
	
		});

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

.sing-box {
  position: absolute;
  width: 320px;
  left:50%;
  top:40%;
  margin-left: -160px;
  margin-top: -160px;
}

.sing-box {
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
  margin-left: 80px;
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
#idChkMsg{
    font-size: 10px;
    margin-left: 20px;
}
	</style>
</head>
<body>

	<div class="back">

        <div class="sing-box">
            <div class="cont_sing">
                
                <form action="memberReg" id="regForm" method="post" enctype="multipart/form-data">
                    
                    <div class="cont_tabs_sign">
                        <ul class='ul_tabs'>
                            <li class="active">Sign Up -
                        </ul>
                    </div>
                  
                    <div class="cont_text_inputs">
                  
                    <input type="text" id="member_name" class="input_form_sign d_block active_inp" placeholder="USERNAME" name="member_name" />
                    
                    <input type="checkbox" id="idchk" value="Y" hidden="hidden">
                    <input type="text" id="member_id" class="input_form_sign d_block  active_inp" placeholder="EMAIL" name="member_id" />  
                    <span id="idChkMsg"></span>
                        
                    <input type="password" id="member_pw" class="input_form_sign d_block  active_inp" placeholder="PASSWORD" name="member_pw" />  

                    <input type="password" id="passcheck" class="input_form_sign d_block active_inp" placeholder="CONFIRM PASSWORD" name="passcheck" />
                  
                  </div>
                  
                  <div class="cont_btn">
                     <button class="btn_sign">CREATE ACCOUNT</button>
                  </div> 

                </form>
            </div>
        </div>
    </div>
    
</body>
</html>