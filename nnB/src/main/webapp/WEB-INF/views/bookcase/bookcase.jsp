<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%-- <% String ContextPath = request.getContextPath(); %> --%>

<!-- 	<table>
		<tr>
			<td>
				<a href="/book/bookcase/already">읽었어요</a>
				<a href="/book/bookcase/now">읽고있어요</a>
				<a href="/book/bookcase/willread">읽고싶어요</a>
			</td>
		</tr>
	</table> -->
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Magnum</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/styless.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nivo-lightbox/nivo-lightbox.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nivo-lightbox/default.css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>

   <!--스크롤추가-->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/slick/slick.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/slick/slick-theme.css">
  <style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {
        width: 100%;
        height: 100%
     /*    margin: auto; */
    }

    .slick-slide {
      margin: 0px 20px;
    }

    .slick-slide img {
      width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    
    .slick-active {
      opacity: .5;
    }

    .slick-current {
      opacity: 1;
    }
  </style>    
    </head>

<body>


<header id="header">
  <div class="intro">
    <div class="container">
      <div class="row">
        <div class="intro-text">
          <h1>책장</h1>
          <hr>
          <p>책이 필요한 순간.</p>
          <a href="#about" class="btn btn-default btn-lg page-scroll">Learn More</a> </div>
      </div>
    </div>
  </div>
</header>
<!-- Navigation -->
<div id="nav">
  <nav class="navbar navbar-custom">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"> <i class="fa fa-bars"></i> </button>
      </div>
      
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-main-collapse">
        <ul class="nav navbar-nav">
          <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
          <li class="hidden"> <a href="#page-top"></a> </li>
          <li> <a class="page-scroll" href="#about">독서노트</a> </li>
          <li> <a class="page-scroll" href="#portfolio">읽었어요</a> </li>
          <li> <a class="page-scroll" href="#contact">읽고있어요</a> </li>
          <li> <a class="page-scroll" href="#portfolio2">읽고싶어요</a> </li>    
        </ul>
      </div>
    </div>
  </nav>
</div>
<!-- About Section -->
<div id="about">
  <div class="container">
    <div class="section-title text-center">
      <p style="font-size: 40px;">독서노트</p>
      <hr>
    </div>
    
      <div class="row">
   
   <section class="center slider">
	<c:forEach var="note" items="${note}" varStatus="status">
		<div>
			<img onclick="javascript:location.href='/book/note/${note.note_id}/Anote';" src="${note.b_imag}"
				 style="box-shadow: 15px 15px 15px 1px #a7a7a7;">
		</div>
    </c:forEach>

   </section>
        
      </div>
    </div>
</div>


<div id="portfolio">
  <div class="container">
    <div class="section-title text-center">
       <p style="font-size: 40px;">읽었어요</p>
      <hr>
    </div>
 
    <div class="row">
   <section class="center slider">
   	<c:forEach var="bookread" items="${readbook0}" varStatus="status">
		<div>
			<img onclick="javascript:location.href='/book/bookInfo/${bookread.isbn}';" src="${bookread.imag }"
				style="box-shadow: 15px 15px 15px 1px #a7a7a7;">
		</div>
    </c:forEach>
  
  </section>
        
     </div>
  </div>
</div>


<!-- Contact Section -->
<div id="contact"> <!-- class="text-center -->
  <div class="container">
    <div class="section-title text-center">
       <p style="font-size: 40px;">읽고있어요</p>
      <hr>
    </div>
<div class="row">
   <section class="center slider">
 	<c:forEach var="bookread" items="${readbook1}" varStatus="status">
		<div>
			<img onclick="javascript:location.href='/book/bookInfo/${bookread.isbn}';" src="${bookread.imag }"
					style="box-shadow: 15px 15px 15px 1px #a7a7a7;">
		</div>
    </c:forEach>
   
  </section>
        
     </div>
  </div>
</div>
    
    
    
<div id="portfolio2">
  <div class="container">
    <div class="section-title text-center">
       <p style="font-size: 40px;">읽고싶어요</p>
      <hr>
    </div>
 
<div class="row">
   <section class="center slider">
 	<c:forEach var="bookread" items="${readbook2}" varStatus="status">
		<div>
			<img onclick="javascript:location.href='/book/bookInfo/${bookread.isbn}';" src="${bookread.imag }"
					style="box-shadow: 15px 15px 15px 1px #a7a7a7;">
		</div>
    </c:forEach>
 
  </section>
        
      </div>
  </div>
</div>
    
    
    
<div id="footer">
  <div class="container text-center">
    <div class="fnav">
      <p>Copyright &copy; 2016 Magnum. Designed by <a href="http://www.templatewire.com" rel="nofollow">TemplateWire</a></p>
    </div>
  </div>
</div>
    
    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.1.11.1.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/SmoothScroll.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/nivo-lightbox.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.isotope.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>

  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function() {

      $(".center").slick({
        dots: true,
        infinite: true,
        centerMode: true,
        slidesToShow: 5,
        slidesToScroll: 3
      });
 
    });
</script>
    
    </body>
</html>