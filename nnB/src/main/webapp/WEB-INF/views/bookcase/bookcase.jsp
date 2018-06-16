<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%-- <% String ContextPath = request.getContextPath(); %> --%>

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


.totalbody{
	margin-top : 50px;
}

.booklist{
	border-top : 50px solid #f0f0f0;
	padding-top : 50px;
}

.search{
	margin-top : -50px;

}

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
          <li> <a class="page-scroll" href="#contact">독서노트</a> </li>
          <li> <a class="page-scroll" href="#portfolio">읽었어요</a> </li>
          <li> <a class="page-scroll" href="#contact2">읽고있어요</a> </li>
          <li> <a class="page-scroll" href="#portfolio2">읽고싶어요</a> </li>    
        </ul>
      </div>
    </div>
  </nav>
</div>
<!-- About Section -->
<div id="contact">
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
<div id="contact2"> <!-- class="text-center -->
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