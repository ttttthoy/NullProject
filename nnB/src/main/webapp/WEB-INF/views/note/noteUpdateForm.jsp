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
        
        body{
            background-color: #d9d9d9;
        }
        
        form{
            margin-bottom: 100px;
        }
                
        .container{
            background-color: #f0f0f0;
            margin-top : 40px;
            margin-bottom : 40px;
            margin : auto;
            width:40%;
        }

        .con_item{
            
            padding:10px;
            width:98%;
            margin-top:200px;
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
        
        #b_imag{
            margin:5px;
            text-align: right;
           display: inline-block;
        }
        
        #b_contents{
            margin-left: 15px;            
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
        
        .button_de{
           text-align:center;
        }
        
    </style>

</head>
<body>

<nav class="navbar navbar-light bg-light static-top" style="position: fixed;">
		<div class="container">
			<a class="navbar-brand"
				href="http://localhost:8080/book/member/login"><img src="${pageContext.request.contextPath}/resources/jspimg/logo.png" style="width: 70px;"></a>
			<div class="topMenuLi">
				<img class="member"
					src="/book/resources/profileImg/${loginInfo.member_photo}">
				<ul class="submenu">
				<li class="name"><a class="submenuLink longLink" style="font-family: 'Nanum Myeongjo', serif; font-size: 15px;">${loginInfo.member_name}님.</a></li>
					<hr width =100% color="black" align="center"  size=4/>
					<li><a class="submenuLink longLink" href="">책&nbsp;&nbsp;장</a></li>
					<li><a class="submenuLink longLink" href="http://localhost:8080/book/member/memberInfo">MY
							PAGE</a></li>
					<li><a class="submenuLink longLink" href="/login">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>

<div class="container">

<div class="con_item">
<div class="form-group"><h3>독서노트</h3></div>
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
  <input type="submit" class="btn btn-info" style=" background-color: green;" value="저장">
        </div>
</form>
    </div>    
</div>
	
</body>

</html>