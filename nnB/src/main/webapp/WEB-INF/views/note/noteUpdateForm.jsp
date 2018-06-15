<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서노트 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

         <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

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
        
    
        
        form{
            margin-bottom: 20px;
        }
        
        
        .container{
        	padding-top:50px;
        	padding-bottom : 20px;
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
        
    </style>

</head>
<body>

<nav>
        <img id="home_but" src="${pageContext.request.contextPath}/resources/jspimg/logo.png">
        <div id="menu">
            <ul>
                <li><a href="/book/damso">책방</a></li>
                <li><a href="#">책장</a></li>
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

<br><br><br>
<div class="container">

<div class="con_item">
<div class="form-group">
    <div class="bookInfo">
        <div id="b_imag"><img src="${note.b_imag }"></div>
        <div id="b_contents">
            <div id="b_title"><h3 >${note.b_title }</h3></div>
            <div id="b_author"> | ${note.b_author } | ${note.b_publisher } | ${note.b_pubdate }</div>
             <div id="b_description">
            <label for="Name">줄거리</label>
            <p>${note.b_description}</p>
        </div>
        </div>
    </div>
</div>
    <br>

<form method="post">

<input type="hidden" name="note_id" value="${note.note_id }">
		<input type="hidden" name="isbn" value="${note.isbn }">
		<input type="hidden" name="member_num" value="${note.member_num }">
		<input type="hidden" name="joayo" value="${note.joayo }">
		<input type="hidden" name="b_title" value="${note.b_title}">
		<input type="hidden" name="b_imag" value="${note.b_imag}">
		<input type="hidden" name="b_author" value="${note.b_author}">
		<input type="hidden" name="b_publisher" value="${note.b_publisher}">
		<input type="hidden" name="b_pubdate" value="${note.b_pubdate}">
		<input type="hidden" name="b_description" value="${note.b_description }">
		
  <div class="form-group">
    <label for="Name">제목</label>
    <input type="text" class="form-control" id="note_title" name="note_title" value="${note.note_title }">
  </div>
    <div class="form-group">
    <label for="Name">내용</label>
     <textarea class="form-control" id="summernote" name="note_contents" >${note.note_contents }</textarea>
  </div>
  
  
  <div class="checkbox">
    <label>
      <input id="pub_priv" type="checkbox" name="pub_priv" ondblclick="this.checked=false" value="${note.pub_priv }"> 비공개
    </label>
  </div>
    
    <div class="button_de">
  <input type="submit"class="btn btn-info btn-danger" style="width:100px; height : 45px" value="수정">
        </div>
</form>
    </div>    
</div>


 	 <footer>

				<div id="footer_de">
					<p class="text-muted small mb-4 mb-lg-0 r-04">&copy; 책이 필요한 순간, 담소.</p>
				</div>
	</footer>
	
</body>

</html>