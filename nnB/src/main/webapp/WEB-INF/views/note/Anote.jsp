<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서노트 보기</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
   $('#like_b').click(function(e){
       
	   e.preventDefault();
	      var stat = $('#like_cnt').text();
	      var num = parseInt(stat,10);
 
        $.ajax({
           url: '<%=request.getContextPath()%>/note/like',
            type : 'post',
            dataType : 'text',
            data : {
               note_id : $('#note_id').val(),
               member_num : $('#member_num').val(),
               l_status : $('#l_status').val()
            },
            success : function(data) {
            }
         })

         if ($(this).val() == '♡') {
        	    num++;
                $('#like_cnt').text(num);

            $(this).val('♥');
         }

         else {
        	  num--;
              $('#like_cnt').text(num);

            $(this).val('♡');
         }
         
      });
      
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
         });
         
   })
</script>

 <script>
      function check(){
     if($.trim($("#keyword").val())==""){
         alert("키워드를 입력하세요!");
         return false;
     } 
     return true;
}
                  
   </script>

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
            font-size : 17px;
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
        
        #like_cnt{
           color : #fc2f51;
           font-size    : 25px;
           font-weight : bold;
           marign-right : 30px;
           padding-top : 10px;
                   
        }
        
              footer{
              height : 100px;
              background-color : #f0f0f0;
            margin-top:200px;
            line-height: 100px; 
            text-align: center;
        }
        
        
        .button_de{
        width:100px;
        height:45px;
        border-radius : 10px;
        background-color : #dc3545;
          padding-top : 14px;
          padding-left:35px;
           float : right;
           margin-bottom : 30px;
           margin-left : 10px;
        }
        
        .button_de a{
        color:white;
        text-align : center;
       font-size : 14px;
       font-weight : bold;
       text-decoration : none;
        }
        
        .button_de a:visited {
        color : white;
        font-size :14px;
        font-weight : bold;
          text-decoration : none; 
        }
        
</style>
   
       <style>
        
        body{
            background-color: #f0f0f0;
        }
        
       
       .container{
           padding-top:50px;
           margin-bottom : 50px;
            background-color: #fde7e7;
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
                
        #nm_imag{
            width:auto;
            height:45px;
            margin-right: 10px;
            border-radius: 50%;
            border : 3px solid pink;
        }
        
         #nm_name{     
            margin-top : 10px;
            display: inline-block;
            font-size:13px;
        }
        
        #b_contents{
           margin-left : 20px;
        }
                
        #b_description{
            margin-top : 15px;
        }
             
        #follow_b:hover{
            box-shadow: 0 5px 5px 0 rgba(0,0,0,0.24);
        }

        #like_b:hover{
            box-shadow: 0 5px 5px 0 rgba(0,0,0,0.24);
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
        
       </style>


<body>

   <nav>
        <img id="home_but" src="${pageContext.request.contextPath}/resources/jspimg/logo.png">
        <div id="menu">
            <ul>
                <li><a href="/book/damso">책방</a></li>
                <li><a href="/book/bookcase/${session.member_num}">책장</a></li>
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
        
    </nav>
    
    <br><br><br>
    
<div class="container">
    
    

<div class="con_item">
    
    <div class="form-group">
    <div class="note_title">
        <div><img id="nm_imag" src="/book/resources/profileImg/${noteMem.member_photo }"></div>
         
            <div id="nm_name">${noteMem.member_name }</div>
            
         <input type="hidden" id="note_id" value="${note.note_id }">
         <input type="hidden" id="member_num" value="${note.member_num }">
         <input type="hidden" id="status" value="${status }">
         <input type="hidden" id="session_num" value="${session.member_num }">
         <input type="hidden" id="f_status" value="${f_status }">
         
            <c:if test="${session.member_num != note.member_num}">
            <c:if test="${f_status}">
               <input type='button' id='follow_b' value='팔로잉' style="padding-left : 10px;
            padding-right : 10px;
            margin : 5px;
            width:auto;
            height : 35px;
            border : 3px solid #0080a7;
            background-color: #00ebff;
            color : white;
            border-radius: 5px;">
            </c:if> 
            <c:if test="${!f_status }">
               <input type='button' id='follow_b' value='팔로우'style="padding-left : 10px;
            padding-right : 10px;
            margin : 5px;
            width:auto;
            height : 35px;
            background-color: #00ebff;
            color : white;
            border-radius: 5px;" >
            </c:if>
         </c:if>
        <div id="item"></div>
         
         <span id="like_cnt">${note.joayo}</span>           
         <div id="nm_like">
           <c:if test="${l_status}">
            <input type='button' id='like_b' value='♥' style="width:40px;
            height : 40px;
            background-color : white;
            color : red;
            font-size : 20px;
            border : 2px solid #dc3545;
            border-radius: 50px;
            margin-left : 20px;">
         </c:if> <c:if test="${!l_status }">
            <input type='button' id='like_b' value='♡' style="width:40px;
            height : 40px;
            background-color : white;
            color : red;
            font-size : 20px;
            border : 2px solid #dc3545;
            border-radius: 50px;
            margin-left : 20px;">
         </c:if>
        </div>
        </div>
        
       
    </div>

    

<div class="form-group">
    <div class="bookInfo">
        <div id="b_imag"><img src="${note.b_imag }"></div>
        <div id="b_contents">
            <div id="b_title"><h3>${note.b_title }</h3></div>
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
  <c:if test="${session.member_num == note.member_num}">
   <div class="button_de">
 <a href="/book/note/${note.note_id }/noteUpdate">수정</a>
        </div>
         <div class="button_de">
<a href="/book/note/${note.note_id}/noteDelete">삭제</a>   
        </div>
        <br><br><br><br>
   </c:if>
    </div>    
</div>
    
<footer>

           <div id="footer_de">
               <p class="text-muted small mb-4 mb-lg-0 r-04">&copy; 책이 필요한 순간, 담소.</p>
            </div>
   </footer>

</body>
</html>