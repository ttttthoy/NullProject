<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page import="java.sql.*"%>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NULL BOOK - WRITE YOUR STORY !</title>
     
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



	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
<a class="navbar-brand"
				href="http://localhost:8080/book/member/login"><img src="${pageContext.request.contextPath}/resources/jspimg/logo.png" style="width: 70px;"></a>
			<div class="topMenuLi">
				<img class="member"
					src="/book/resources/profileImg/${member.member_photo }">
				<ul class="submenu">
				<li class="name"><a class="submenuLink longLink" style="font-family: 'Nanum Myeongjo', serif; font-size: 15px;">${member.member_name}님.</a></li>
					<hr width =100% color="black" align="center"  size=4/>
					<li><a class="submenuLink longLink" href="">책&nbsp;&nbsp;장</a></li>
					<li><a class="submenuLink longLink" href="http://localhost:8080/book/member/memberInfo">MY
							PAGE</a></li>
					<li><a class="submenuLink longLink" href="/login">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
		
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form action="/book/bookSearch" method="post" id="searchF"
						onSubmit="return check()">
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg"
									name="keyword" id="keyword" placeholder="당신의 이야기를 찾아보세요.">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary">SEARCH</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>

	<!-- Image Showcases -->
	<section class="showcase">
		<div id="mainbox">
			<%
				Connection conn = null; // null로 초기화 한다.
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				try {
					String url = "jdbc:mysql://bitsender.c9qiqqacyz3e.ap-northeast-2.rds.amazonaws.com/yelioni?characterEncoding=utf8&amp;useSSL=false";
					String id = "yelioni"; // 사용자 계정
					String pw = "dnjs1ghk"; // 사용자 계정의 패스워드
					Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
					conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
					String sql = "select* from booknotes order by upload_date desc"; // sql 쿼리
					pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.pstmt.setString(1,"test");
					rs = pstmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
					while (rs.next()) { // 결과를 한 행씩 돌아가면서 가져온다.
						String imag = rs.getString("b_imag");
						String title = rs.getString("b_title");
						String isbn = rs.getString("isbn");
						String ntitle = rs.getString("note_title");
						String ncontents = rs.getString("note_contents");
			%>

			<div class="card ">
				<a href="http://localhost:8080/book/bookInfo/<%=isbn%>"> <img
					class="bookimg" src="<%=imag%>" alt="Avatar"></a> <a
					href="http://localhost:8080/book/bookInfo/<%=isbn%>"><h6>
						<strong><%=ntitle%></strong>
					</h6></a>
			</div>
			<%
				}
				} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
					e.printStackTrace();
					out.println("member 테이블 호출에 실패했습니다.");
				}
			%>
		</div>
	</section>
	<!-- Call to Action -->

	<!-- Footer -->
	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="#">About</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Contact</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2018. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</footer>

  </body>

</html>
