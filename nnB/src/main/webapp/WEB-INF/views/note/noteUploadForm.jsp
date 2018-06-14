<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서노트 작성</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

         <script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
      $('#summernote').summernote({
        height: 400,
        minHeight: null,
        maxHeight: null,
        focus: true,
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
      });
    });
  
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
            background-color: white;
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
            font-size : 17px;
        }
        
        .container{
        
            border : 1px solid black;
            background-color: #f0f0f0;
            margin-bottom : 40px;
            margin : auto;
            border-radius: 10px;
            width:40%;
        }

        .con_item{
            border : 1px solid black;
            padding:10px;
            width:98%;
            margin-top:10px;
            margin-left:10px;
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
            font-size:17px;
       
        }
        
        #b_contents{
        	margin-left : 20px;
        }
        
        #b_description{
            margin-top : 10px;
        }
        
        img{
            width:auto;
            height:190px;
            border-radius: 6%;
        }
        
        .button_de{
           text-align:center;
        }
        
        footer{
            margin-top:80px;
            line-height: 50px; 
            text-align: center;
        }
        
    </style>	
</head>

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
    <div class="bookInfo">
        <div id="b_imag"><img src="${book.imag }"></div>
        <div id="b_contents">
            <div id="b_title"><h3 >${book.title }</h3></div>
            <div id="b_author"> | ${book.author } | ${book.publisher } | ${book.pubdate }</div>
             <div id="b_description">
            <label for="Name">줄거리</label>
            <p>${book.description}</p>
        </div>
        </div>
    </div>
</div>
    <br>

<form method="post">

<input type="hidden" name="isbn" value="${book.isbn}">
		<input type="hidden" name="member_num" value="${session.member_num }">
		<input type="hidden" name="member_name" value="${session.member_name }">
		<input type="hidden" name="member_photo" value="${session.member_photo }">
		<input type="hidden" name="like" value="0">
		<input type="hidden" name="b_title" value="${book.title}">
		<input type="hidden" name="b_imag" value="${book.imag}">
		<input type="hidden" name="b_author" value="${book.author}">
		<input type="hidden" name="b_publisher" value="${book.publisher}">
		<input type="hidden" name="b_pubdate" value="${book.pubdate}">
		<input type="hidden" name="b_description" value="${book.description }">
		
  <div class="form-group">
    <label for="Name">제목</label>
    <input type="text" class="form-control" id="note_title" name="note_title" placeholder="Name">
  </div>
    <div class="form-group">
    <label for="Name">내용</label>
     <textarea class="form-control" id="summernote" name="note_contents" ></textarea>
  </div>
  
  
  <div class="checkbox">
    <label>
      <input id="pub_priv" type="checkbox" name="pub_priv" ondblclick="this.checked=false" value="1"> 비공개
    </label>
  </div>
    
    <div class="button_de">
  <input type="submit" class="btn btn-info" style=" background-color: green;" value="저장">
        </div>
</form>
    </div>    
</div>
	 <footer>

				<div id="footer_de">
					<p class="text-muted small mb-4 mb-lg-0">&copy; 책이 필요한 순간, 담소.</p>
				</div>
	</footer>
	
</body>



</html>