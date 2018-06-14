<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

         <script   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서노트 보기</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#like_b').click(function(){
        
        $.ajax({
           url: '<%=request.getContextPath()%>/note/like',
				type : 'post',
				dataType : 'text',
				data : {
					note_id : $('#note_id').val(),
					member_num : $('#member_num').val(),
					status : $('#l_status').val()
				},
				success : function(data) {
				}
			})

			if ($(this).val() == '♡') {
				$(this).val('♥');
			}

			else {
				$(this).val('♡');
			}
		})
		
	$('#follow_b').click(function(){
	        
	        $.ajax({
	           url: '<%=request.getContextPath()%>/member/follow',
					type : 'post',
					dataType : 'text',
					data : {
						follower : $('#session_num').val(),
						following : $('#member_num').val(),
						f_status : $('#f_status').val()
					},
					success : function(data) {
					}
				})

				if ($(this).val() == '팔로우') {
					$(this).val('팔로잉');
				}

				else {
					$(this).val('팔로우');
				}
			})
			
	})
</script>

<style>

        .dropdown {
    position: relative;
    display: inline-block;
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
        
        
        body{
            background-color: #d9d9d9;
        }
        
         header{
            padding:20px 40px 20px 40px;
            background-color: #f0f0f0;
            height:80px;
            display:flex;
        }
        
        form{
            margin-bottom: 20px;
        }
        
        
        #menu li{
            float: left;
            list-style: none;
            margin-top:10px;
            margin-right: 20px;
        }
        
    
        .container{
            background-color: #f0f0f0;
            margin-top : 40px;
            margin-bottom : 40px;
            margin : auto;
            border-radius: 10px;
            width:40%;
        }

        .con_item{
            
            padding:10px;
            width:98%;
            margin-top:10px;
            margin-left:10px;
        }
                
         .note_title{
            display: flex;
        }


        .bookInfo{
            background-color:white;
            border-radius : 15px;
            padding:20px;
            height:240px;
            display: flex;
        }
        
        .bookInfo h3{
            font-weight: bold;
        }
        
                
        #home_but{
            width:auto;
            height:40px;;
        }
        
        #follow_b{
            padding-left : 10px;
            padding-right : 10px;
            margin : 5px;
            width:auto;
            height : 35px;
            background-color: #00ebff;
            color : white;
            border-radius: 5px;
        }
        
        #like_b{
            width:40px;
            height : 40px;
            background-color : white;
            color : red;
            font-size : 20px;
            border : 2px solid red;
            border-radius: 50px;
            
        }
        
        #follow_b:hover{
            box-shadow: 0 5px 5px 0 rgba(0,0,0,0.24);
        }

        #like_b:hover{
            box-shadow: 0 5px 5px 0 rgba(0,0,0,0.24);
        }
        
        #b_contents{
        	padding-left : 7px;
        }
        
        #item{
            flex-grow: 1;
        }
        
        #mem_photo{
           width:50px;
            height:50px;
            margin-right: 10px;
            border-radius: 50%;
            border : 3px solid green;
        }
        
        #mem_name{        
            display: inline-block;
            font-size:13px;
       
        }
        
        #nm_imag{
            width:auto;
            height:45px;
            margin-right: 10px;
            border-radius: 50%;
            border : 3px solid yellow;
        }
        
        #nm_name{
            font-weight: bold;
            margin-top:15px;
        }
        
         #note_mem_name{     
            margin-top : 10px;
            display: inline-block;
            font-size:13px;
        }
               
        #b_description{
            margin-top : 10px;
        }
        
        img{
            width:auto;
            height:190px;
            border-radius: 6%;
        }
        
        input[type=button] {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        
        .button_de{
           text-align:center;
        }
        
         footer{
              height : 100px;
              background-color : #f0f0f0;
            margin-top:80px;
            line-height: 100px; 
            text-align: center;
        }


</style>


<body>

	<header>
        <img id="home_but" src="${pageContext.request.contextPath}/resources/jspimg/logo.png">
        <div id="menu">
            <ul>
                <li><a href="/book/damso">책방</a></li>
                <li>책장</li>
            </ul>
        </div>
        <div id="item"></div>
        <div class="dropdown">
            <img id=mem_photo src="/book/resources/profileImg/${session.member_photo }"><div id=mem_name>${session.member_name}</div>
            <div class="dropdown-content">
                <a href="/book/member/memberInfo">마이페이지</a>
                <a href="/login">로그아웃</a>
            </div>
        </div>
        
    </header>
    
    <br><br><br>
    
<div class="container">
    
    

<div class="con_item">
    
    <div class="form-group">
    <div class="note_title">
        <div><img id="nm_imag" src="/book/resources/profileImg/${noteMem.member_photo }"></div>
        	<input type="hidden" id="note_id" value="${note.note_id }">
			<input type="hidden" id="member_num" value="${note.member_num }">
			<input type="hidden" id="status" value="${status }">
			<input type="hidden" id="session_num" value="${session.member_num }">
			<input type="hidden" id="f_status" value="${f_status }">
			
            <div id="nm_name">${noteMem.member_name }</div>
            <c:if test="${session.member_num != note.member_num}">
				<c:if test="${f_status}">
					<input type='button' id='follow_b' value='팔로잉' style="">
				</c:if> 
				<c:if test="${!f_status }">
					<input type='button' id='follow_b' value='팔로우' >
				</c:if>
			</c:if>
        <div id="item"></div>
                    
         <div id="nm_like">
           <c:if test="${l_status}">
				<input type='button' id='like_b' value='♥'>
			</c:if> <c:if test="${!l_status }">
				<input type='button' id='like_b' value='♡'>
			</c:if>
        </div>
        </div>
       
    </div>

    

<div class="form-group">
    <div class="bookInfo">
        <div id="b_imag"><img src="${note.b_imag }"></div>
        <div id="b_contents">
            <div id="b_title"><h3 >${book.title }</h3></div>
            <div id="b_author">${note.b_author } | ${note.b_publisher } | ${note.b_pubdate }</div>
             <div id="b_description">
            <label for="Name">줄거리</label>
            <p>${note.b_description } </p>
        </div>
        </div>
    </div>
</div>
    <br>

  <div class="form-group">
    <label for="Name">제목</label>
    <p>${note.note_title }</p>
  </div>
    <div class="form-group">
    <label for="Name">내용</label>
     <p>${note.note_contents }</p>
  </div>
    
    </div>    
</div>
    
    
        <footer>

           <div id="footer_de">
					<p class="text-muted small mb-4 mb-lg-0 r-04">&copy; 책이 필요한 순간, 담소.</p>
				</div>
   </footer>
    
    <script>
        $('#summernote').summernote({
          height: 300,                 
          minHeight: null,             
          maxHeight: null,             
          focus: true                  
        });
    </script>



</body>
</html>