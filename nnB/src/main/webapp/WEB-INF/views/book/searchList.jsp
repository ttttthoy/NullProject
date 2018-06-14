<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/searchlist.css" rel="stylesheet">
 <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<script>

function bookInfo(){
	
	var f = document.formName;
	f.action = 'bookInfo';
	f.encoding = "multipart/form-data";
	f.submit();
	
}

function bookNote(){
	
	var f=document.formName;
	f.action = "note/noteUploadForm";
	f.submit();
}

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
	border-top : 50px solid white;
	padding-top : 50px;
}

.search{
	margin-top : -50px;

}

  header{
            padding:20px 40px 20px 40px;
            background-color: #f0f0f0;
            height:80px;
            display:flex;
        }
        
        
           #home_but{
            width:auto;
            height:40px;;
            margin-right:15px;
        }
        
        a:link { color: black; text-decoration: none;}
 		a:visited { color: black; text-decoration: none;}

	
	#menu li{
            float: left;
            list-style: none;
            margin-top:10px;
            margin-right: 20px;
            font-size : 17px;
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
        
        table{
        	width : 90%;
        	margin : auto;
        	text-align : center;
        	
        }
        
		th{
			text-align : center;
			height : 50px;
		}
</style>

<body>

<header>
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
        
    </header>

<div class="totalbody">
	<center>
	<div class="search col-md-8 col-lg-8 col-xl-7 mx-auto" >
					<form action="/book/bookSearch" method="post" id="searchF"
						onSubmit="return check()">
						<div class="form-row" style="margin-bottom: 50px; margin-top: 70px; margin-left: 60px;">
							<div class="col-10 col-md-7 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg"
									name="keyword" id="keyword" placeholder="당신의 이야기를 찾아보세요.">
							</div>
		
							<div class="col-8 col-md-3">
								
								<input  TYPE="IMAGE" src="${pageContext.request.contextPath}/resources/jspimg/search.png" name="Submit" value="Submit"  align="absmiddle"
								style="height:50px">
							</div>
						</div>
					</form>
				</div>
		</center>
		<div class="booklist">
		<table>
		<thead>
			<tr>	
				<th style="width : 10%;">&emsp;&emsp;&emsp;&emsp;책</th>
				<th style="width : 70%;">제목</th>
				<th style="width : 10%;" >저자</th>
				<th style="width : 10%;">독서노트</th>
			</tr>
			</thead>
		</table>
		<hr>
		<table>
		
			<c:forEach items="${bookList}" var="b">
			<input type="hidden" name="isbn" id = "isbn" value="${b.isbn }">
			<input type="hidden" name="title" id = "title" value="${b.title }">
			<input type="hidden" name="imag" id = "imag" value="${b.imag }">
			<input type="hidden" name="author" id="author" value="${b.author }">
			<input type="hidden" name="publisher" id="publisher" value="${b.publisher }">
			<input type="hidden" name="pubdate" id="pubdate" value="${b.pubdate }">
			<input type="hidden" name="description" id="description" value="${b.description }">
			<input type="hidden" name="isbn" value=%{b.isbn} />

				<tr>
					<td rowspan="1"><a href="bookInfo/${b.isbn}"><img src="${b.imag}" style="margin-left: 30px; margin-bottom: 30px; width: 50px;"></a></td>
					<td rowspan="2" width="300">${b.title}</td>
					<td width="100">${b.author}</td>
					<td><a href="bookNote/${b.isbn}"><img src="${pageContext.request.contextPath}/resources/jspimg/booknoteicon.png" style="width: 30px;"></a></td>
				</tr>
<%-- 				<tr>
					<td width="200">link : ${b.link }</td>
					<td width="200">출판사 : ${b.publisher }</td>
					<td width="200">출판일 : ${b.pubdate }</td>
					<td width="200">ISBN : ${b.isbn }</td>

				</tr>
				<tr>
					<td colspan="7">${b.description}</td>
				</tr>
 --%>		
				</div>
				<tr>
					<td colspan="7" width="100%" bgcolor="pink"></td>
				</tr>
			</c:forEach>
	
		</table>
		</div>
		</div>
		
		<footer>

				<div id="footer_de">
					<p class="text-muted small mb-4 mb-lg-0 r-04">&copy; 책이 필요한 순간, 담소.</p>
				</div>
	</footer>
</body>
</html>