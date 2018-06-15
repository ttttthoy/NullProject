<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
</head>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>

	$(document).ready(function(){
				
		$(function(){
			$("#photofile").on('change', function(){
				readURL(this);
			});
		});
		
	    $(function(){
	        var $ppc = $('.progress-pie-chart'),
	          percent = parseInt($ppc.data('percent')),
	          deg = 360*percent/100;
	        if (percent > 50) {
	          $ppc.addClass('gt-50');
	        }
	        $('.ppc-progress-fill').css('transform','rotate('+ deg +'deg)');
	        $('.ppc-percents span').html(percent+'권');
	      });
	     
		
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#profileImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	
	
</script>

<!-- Header  -->
 <style>
 
        .dropdown {
    position: relative;
    display: inline-block;
}

.find {
	border: 2px solid pink;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}


        

  nav{
            padding:20px 40px 20px 40px;
            background-color: white;
            height:80px;
            display:flex;
            border-bottom : 3px solid #dc3545;
        }
        
              
        
           #home_but{
            width:auto;
            height:50px;;
            margin-right:50px;
        }
        
        a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}

	
	#menu li{
            float: left;
            list-style: none;
            margin-top:10px;
            margin-right: 30px;
            font-size : 18px;
        }
        
      #mem_photo{
            width:50px;
            height:50px;
            margin-right: 10px;
            border-radius: 50%;
            border : 3px solid #dc3545;
        }
        
        #mem_name{        
            display: inline-block;
            font-size:17px;
       
        }
        
          #item{
            flex-grow: 1;
        }
        
              footer{
              height : 100px;
              background-color : #f0f0f0;
            margin-top:80px;
            line-height: 100px; 
            text-align: center;
        }
        
       </style>
         

<style>
    
    body{
        background-color: #f0f0f0;
    }
    
    .total{
        
        background-color: #f0f0f0;
        display : flex;
    }
    
    .col1{ 
        padding-top:100px;
        padding-left : 500px;
        flex-basis : 1000px;
        
    }
    
    .col2{
        padding-left: 100px;
        flex-basis : 1000px;
        flex-direction : row;
    }
      
    .noteinfo{
        height : 150px;
       margin-top : 50px;
    }
    
    .followinfo{
         margin-top : 100px;
        
    }
    
       
    .f_list {
    display: inline-block;
    height : 195px;
}

.f_list:first-child {
    margin-left: 0;
}

.f_list p {
    margin-bottom: 8px;
    text-indent: 7px;
}

.f_list ul {

    border-radius: 3px;
    width : 350px;
    height: 200px;
    overflow-y: scroll;
    background: #fff;
}

.f_list ul li {
		padding-left : 20px;
		display:flex;
        height:50px;
    }

.f_list ul li a {
    display: block;
    overflow: hidden;
    margin-top: 18px;
    padding: 3px;
    color:black;
    font-size:12px;
    text-decoration:none;
}

#follow_img{
	margin-top : -30px;
	width:40px;
	height :40px;
	border : 2px solid #dc3545;
	border-radius:50%;
}

    </style>
    
  <!--   /* Pie Chart */ -->
    <style>
        
        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);
.progress-pie-chart {
  width:200px;
  height: 200px;
  border-radius: 50%;
  background-color: #E5E5E5;
  position: relative;
}
.progress-pie-chart.gt-50 {
  background-color: #81CE97;
}

.ppc-progress {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 100px);
  top: calc(50% - 100px);
  width: 200px;
  height: 200px;
  clip: rect(0, 200px, 200px, 100px);
}
.ppc-progress .ppc-progress-fill {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 100px);
  top: calc(50% - 100px);
  width: 200px;
  height: 200px;
  clip: rect(0, 100px, 200px, 0);
  background: #81CE97;
  transform: rotate(60deg);
}
.gt-50 .ppc-progress {
  clip: rect(0, 100px, 200px, 0);
}
.gt-50 .ppc-progress .ppc-progress-fill {
  clip: rect(0, 200px, 200px, 100px);
  background: #E5E5E5;
}

.ppc-percents {
  content: "";
  position: absolute;
  border-radius: 50%;
  left: calc(50% - 173.91304px/2);
  top: calc(50% - 173.91304px/2);
  width: 173.91304px;
  height: 173.91304px;
  background: #fff;
  text-align: center;
  display: table;
}
.ppc-percents span {
  display: block;
  font-size: 2.6em;
  font-weight: bold;
  color: #81CE97;
}

.pcc-percents-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.progress-pie-chart {
  margin: 50px auto 0;
}
    </style>

</style>

<nav>
        <img id="home_but" src="${pageContext.request.contextPath}/resources/jspimg/logo.png">
        <div id="menu">
            <ul>
                <li><a href="/book/damso">책방</a></li>
                <li><a href="/book/bookcase">책장</a></li>
            </ul>
        </div>
        <div id="item"></div>
        <div class="dropdown">
            <img id=mem_photo src="/book/resources/profileImg/${session.member_photo }"><div id=mem_name>${session.member_name}</div>
            <div class="dropdown-content">
                <a href="/book/member/memberInfo">마이페이지</a>
                <a href="member/logout">로그아웃</a>
            </div>
        </div>
        
    </nav>


<body>

<div class="total">
	
	<div class="col1">
			<div class="wrap-login100 p-t-85 p-b-20">
				<form class="login100-form validate-form" action="/book/member/memberInfo" id="myPageForm" method="post" enctype="multipart/form-data">
					<span class="login100-form-title p-b-50">
				    마이 페이지
					</span>
					<span class="login100-form-avatar">
						<img id="profileImg" name="profileImg" 
		src="/book/resources/profileImg/${session.member_photo}" alt="프로필사진">
					</span>
                    <br>
                    <br>                   
						<input class="input100" type="file" name="photofile" id="photofile">
					<div class="wrap-input100 validate-input m-t-55 m-b-35" data-validate = "Enter username">
						닉네임
                        <input class="input100" type="text" name="member_name" id="member_name" value="${session.member_name}">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
						비밀번호
                        <input class="input100" type="password" name="member_pw" id="member_pw" value="${session.member_pw}">
						<span class="focus-input100" ></span>
					</div>

<input type="hidden" name="member_id" id="member_id" value="${session.member_id }"> 
				<input type="hidden" name="member_num" id="member_num" value="${session.member_num }">
				<input type="hidden" name="member_photo" id="member_photo" value="${session.member_photo }">
				
					<div class="container-login100-form-btn">
						<div class="login100-form-btn"><input class="login100-form-btn" type="submit" value="수정"></div>
					</div>
				</form>
			</div>
	</div>
    <div class="col2">
        <div class="followinfo">
			<div class="wrap-login100 p-t-85 p-b-0">
				<span class="login100-form-title p-b-20">
						팔로우
				</span>
                <div class = f_list>
                    <ul>
                    <c:forEach var="followers" items="${follower_l}" varStatus="status">
					<li class="f_mem">
					<img id="follow_img" src="/book/resources/profileImg/${followers.member_photo }" style="margin:10px;"> <a href="/book/bookcase/${followers.member_num}">${followers.member_name }</a>
					</li> 
					</c:forEach>
                    </ul>      
                </div>
			</div>
    </div>
    <div class="noteinfo">
			<div class="wrap-login100 p-t-85 p-b-20">
				<span class="login100-form-title">
						독서 노트
				</span>      
                <div class="progress-pie-chart" data-percent=${note_cnt }><!--Pie Chart -->
                    <div class="ppc-progress">
                        <div class="ppc-progress-fill"></div>
                    </div>
                    <div class="ppc-percents">
                    <div class="pcc-percents-wrapper">
                        <span style="font-size : 30px">${note_cnt }권</span>
                    </div>
                    </div>
                </div><!--End Chart -->
			</div>
	</div>
    </div>
	</div>
	
	<footer>

				<div id="footer_de">
					<p class="text-muted small mb-4 mb-lg-0 r-04">&copy; 책이 필요한 순간, 담소.</p>
				</div>
	</footer>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/bootstrap/js/popper.js"/>"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/daterangepicker/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor/countdowntime/countdowntime.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/js/main.js"/>"></script>

</body>
</html>
