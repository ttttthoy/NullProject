<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>독서노트 작성</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notemain.css">
    
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    
    <script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>




<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></scxript>

<style>

</style>

<script type="text/javascript">
    $(document).ready(function() {
      $('#summernote').summernote({
        height: 300,
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
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/image',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
</script>

</head>
<body class="totalbody">

 <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1">
            <a class="text-muted" href="#">Subscribe</a>
          </div>
          <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="#">DAMSO</a>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
            <a class="text-muted" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mx-3"><circle cx="10.5" cy="10.5" r="7.5"></circle><line x1="21" y1="21" x2="15.8" y2="15.8"></line></svg>
            </a>
            <a class="btn btn-sm btn-outline-secondary" href="#">Sign up</a>
          </div>
        </div>
      </header>
    

	<div class="limiter">
		<div class="container-in100">
			<div class="wrap-in100">
				<div class="in100-form-title">            
                   <div class="container">
                        <div class="card card-body d-flex flex-column align-items-start pull-right">
                          <h3>
                            <a href="#">${book.title }</a>
                          </h3><br>
                          <h6>저자 | ${book.author }</h6>
                          <h6>출판사 | ${book.publisher }</h6>
                          <h6>출판일 | ${book.pubdate }</h6>
                          <h6>줄거리 | ${book.description}</h6>
                        </div>
                       
                        <img class="book card-img-right flex-auto d-none d-lg-block" img src = "${book.imag }">
                    </div>  
                </div>
            </div>

				<form class="in100-form validate-form" method="post">
                    
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
                    
					<div class="wrap-input100 validate-input m-b-26" data-validate="리뷰 제목을 입력하세요.">
						<span class="label-input100" >제목</span>
						<input class="input100" type="text"  name="note_title" id="note_title" style="background-color:white">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" >
						<span class="review label-input100">리뷰</span>
                        <textarea id="summernote" name="note_contents" ></textarea>
					</div>

					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="pub_priv" type="checkbox" name="pub_priv" ondblclick="this.checked=false" value="1">
							<label class="label-checkbox100" for="pub_priv" >비공개</label>
						</div>

					</div>

					<div class="container-in100-form-btn">
						<input class="in100-form-btn" type="submit" value="저장">
					</div>
				</form>
		</div>
	</div>
	
	<footer class="blog-footer">
      <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
      <p>
        <a href="#">Back to top</a>
      </p>
    </footer>

		<script src="<c:url value="/resources/vendor/jquery/jquery-3.2.1.min.js" />"></script>

	<script src="<c:url value="/resources/vendor/animsition/js/animsition.min.js" />"></script>

	<script src="<c:url value="/resources/vendor/bootstrap/js/popper.js" />"></script>
	<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js" />"></script>

	<script src="<c:url value="/resources/vendor/select2/select2.min.js" />"></script>

	<script src="<c:url value="/resources/vendor/daterangepicker/moment.min.js" />"></script>
	<script src="<c:url value="/resources/vendor/daterangepicker/daterangepicker.js" />"></script>

	<script src="<c:url value="/resources/vendor/countdowntime/countdowntime.js" />"></script>

	<script src="<c:url value="/resources/js/main.js" />"></script>
	
	 <link	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
    <script	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>
    
    <script>
        $(document).ready(function() {
          $('#summernote').summernote();
        });
    </script>    
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