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

    <title>DAMSO - WRITE YOUR STORY !</title>
     
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
   
       <style>
       
       body{
   background-color : #f0f0f0;
}
        
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
           
  </head>


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
                <a href="/book/member/logout">로그아웃</a>
            </div>
        </div>
        
    </nav>


   <!-- Masthead -->
   <header    class="masthead text-white text-center">
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
                           name="keyword" id="keyword" placeholder="당신의 이야기를 찾아보세요." style="border : 2px solid #dc3545; box-sizing : border-box;">
                     </div>
                     <div class="col-12 col-md-3">
                        <button type="submit" class="btn btn-block btn-lg btn-danger" style="font-family:auto">검색</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </header>

<!--  
<ul>
   <li><a href="/book/note/noteList">독서노트 리스트</a>
   <li><a href="/book/note/noteList/${session.member_num}">내 독서노트</a></li>
   <li><a href="/book/member/follow/${session.member_num }">팔로우 리스트</a>
</ul>
-->
   <!-- Image Showcases -->
   
   <br><br><br><br>
   <section class="showcase">
      <div id="mainbox">
         <%
            Connection conn = null; // null로 초기화 한다.
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
               String url = "jdbc:mysql://bitsender.c9qiqqacyz3e.ap-northeast-2.rds.amazonaws.com/yelioni?characterEncoding=utf8&amp;useSSL=false";
               String id = "*"; // 사용자 계정
               String pw = "*"; // 사용자 계정의 패스워드
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

     <footer>

            <div id="footer_de">
               <p class="text-muted small mb-4 mb-lg-0 r-04">&copy; 책이 필요한 순간, 담소.</p>
            </div>
   </footer>

  </body>

</html>