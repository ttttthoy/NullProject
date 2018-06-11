<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>널널북</title>
     
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/landing-page.min.css" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
   <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" /> "></script>
   <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" /> "></script>
   <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" /> "></script>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js" /> "></script>
    <script src="<c:url value="/resources/js/plugins.js" /> "></script>
    <script src="<c:url value="/resources/js/main.js" /> "></script>
   
  
     <script>
      function check(){
	  if($.trim($("#keyword").val())==""){
	 	  alert("키워드를 입력하세요!");
	  	 return false;
	  } 
	  return true;
}
                  
	</script>
	
  </head>


  <body>
  
      <!-- 사이드 메뉴 -->


    <!-- Navigation -->
    <nav class="navbar navbar-light bg-light static-top">
      <div class="container">
        <a class="navbar-brand" href="#">담소</a>
        <img src="/book/resources/profileImg/${member.member_photo }" alt="프로필사진" width="100px" height="100px">
		${member.member_name} 님
	   <a class="btn btn-primary" href="memberInfo/edit">마이페이지</a> <a href="login"><input type="submit" value="로그아웃 "></a>
      </div>
    </nav>

    <!-- Masthead -->
    <header class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Share your book idea</h1>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
            <form action = "/book/bookSearch" method="post" id="searchF" onSubmit="return check()">
              <div class="form-row">
                <div class="col-12 col-md-9 mb-2 mb-md-0">
                  <input type="text" class="form-control form-control-lg" name="keyword" id="keyword" >
                </div>
                <div class="col-12 col-md-3">
                  <button type="submit" class="btn btn-block btn-lg btn-primary">검색</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </header>
       
   <h1>독서노트 </h1>

<ul>
	<li><a href="../note/noteList">독서노트 리스트</a>
	<li><a href="../note/noteList/${member.member_num}">내 독서노트</a></li>
	<li><a href="../bookcase">책장</a></li>
</ul>

 <!-- Page Content -->
    <div class="container">

 <!-- Page Heading -->
      <h1 class="my-4"><small>최신 독서노트</small>
      </h1>
      
      <div class="row">
      <c:forEach var="note" items="${notes }" begin="0" end="7" step="1" varStatus="status">
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${note.b_imag }" alt="독서노트사진"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">${note.note_title }</a>
              </h4>
              <p class="card-text">${note.note_contents }</p>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
      <!-- /.row -->

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
    <!-- /.container -->


   
    <!-- Footer -->
    <footer class="footer bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
            <ul class="list-inline mb-2">
              <li class="list-inline-item">
                <a href="#">About</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Contact</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
              <li class="list-inline-item">&sdot;</li>
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
            </ul>
            <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2018. All Rights Reserved.</p>
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
            <ul class="list-inline mb-0">
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-facebook fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-twitter fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram fa-2x fa-fw"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>

  </body>

</html>
