<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">

<!-- 페이스북 meta추가 -->
<meta property="og:title" content="<?=imgsharetitle>"/>
<meta property="og:image" content="<?=imgshareimage>"/>
<meta property="og:description" content="<?=imgsharedescription>"/>
<meta property="og:type" content="website"/>

<title>책정보 페이지</title>


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

 
    // send to SNS
    function toSNS(sns, strTitle, strURL) {
        var snsArray = new Array();
        var strMsg = strTitle + " " + strURL;
        var image = "이미지경로";
 
        snsArray['twitter'] = "http://twitter.com/home?status=" + encodeURIComponent(strTitle) + ' ' + encodeURIComponent(strURL);
        snsArray['facebook'] = "http://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(strURL);
        snsArray['blog'] = "http://blog.naver.com/openapi/share?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
        window.open(snsArray[sns]);
    }
 
    function copy_clip(url) {
        var IE = (document.all) ? true : false;
        if (IE) {
            window.clipboardData.setData("Text", url);
            alert("이 글의 단축url이 클립보드에 복사되었습니다.");
        } else {
            temp = prompt("이 글의 단축url입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
        }
    }
</script>
    <meta property="og:url" content="https://www.your-domain.com/your-page.html" />


</head>

<!-- BootStrap -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
    <!-- Global CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.css">
    <!-- github acitivity css -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/octicons/2.0.2/octicons.min.css">
    
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">

<script src="<c:url value="/resources/js/jquery-1.11.3.min.js" />"></script>

<script>

var starRating = function(){
   var $star = $(".star-input");
    
   var $result = $star.find("output");
   
   $(document).on("focusin", ".star-input>.input", function(){
             $(this).addClass("focus");
       		})
          
        .on("focusout", ".star-input>.input", function(){
          var $this = $(this);
          setTimeout(function(){
               if($this.find(":focus").length === 0){
                   $this.removeClass("focus");
               }
            }, 100);
        })
     
       .on("change", ".star-input :radio", function(){
          $result.text($(this).next().text());
        })
       .on("mouseover", ".star-input label", function(){
          $result.text($(this).text());
       })
       .on("mouseleave", ".star-input>.input", function(){
          var $checked = $star.find(":checked");
             if($checked.length === 0){
                  $result.text("0");
                } else {
                  $result.text($checked.next().text());
             }
        });
   };

</script>

<style>
#main {
   float: left;
   width: 950px;
   height: 600px;
   text-algin: center;
   vertical-algin: middle;
   overflow: auto;
}

#review {
   width: 800px;
   heigh: 600px;
}

.content textarea{
	width : 100%;
	resize : none;
	overflow-y: hidden;
	padding : 1.1em;
	padding-bottom : 0.2em;
	line-height : 1.6;
}
</style>

<!-- 별점 -->

<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
display: inline-block;
vertical-align:middle;
background:url('/book/resources/img/grade_img.png')no-repeat;
}
.star-input{
display:inline-block; 
white-space:nowrap;
width:225px;
height:40px;
padding:25px;
line-height:30px;
}
.star-input>.input{
display:inline-block;
width:150px;
background-size:150px;
height:28px;
white-space:nowrap;
overflow:hidden;
position: relative;
}
.star-input>.input>input{
position:absolute;
width:1px;
height:1px;
opacity:0;
}
star-input>.input.focus{
outline:1px dotted #ddd;
}
.star-input>.input>label{
width:30px;
height:0;
padding:28px 0 0 0;
overflow: hidden;
float:left;
cursor: pointer;
position: absolute;
top: 0;
left: 0;
}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{
background-size: 150px;
background-position: 0 bottom;
}
.star-input>.input>label:hover~label{
background-image: none;
}
.star-input>.input>label[for="p0.5"] {
   width: 15px;
   z-index: 10;
}

.star-input>.input>label[for="p1"] {
   width: 30px;
   z-index: 9;
}

.star-input>.input>label[for="p1.5"] {
   width: 45px;
   z-index: 8;
}

.star-input>.input>label[for="p2"] {
   width: 60px;
   z-index: 7;
}

.star-input>.input>label[for="p2.5"] {
   width: 75px;
   z-index: 6;
}

.star-input>.input>label[for="p3"] {
   width: 90px;
   z-index: 5;
}

.star-input>.input>label[for="p3.5"] {
   width: 105px;
   z-index: 4;
}

.star-input>.input>label[for="p4"] {
   width: 120px;
   z-index: 3;
}

.star-input>.input>label[for="p4.5"] {
   width: 135px;
   z-index: 2;
}

.star-input>.input>label[for="p5"] {
   width: 150px;
   z-index: 1;
}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

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
        
        li a:link { color: black; text-decoration: none;}
       li a:visited { color: black; text-decoration: none;}
   
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
        

</style>

<!-- 리뷰 저장 ajax -->

<script>
   $(document).ready(function(){
	   
	   	  starRating();
	   
      $('#r_but').click(function(){
         
         $.ajax({
            url: '<%=request.getContextPath()%>/review/upload',
            type : 'post',
            dataType : 'text',
            data : {
               isbn : $('#isbn').val(),
               r_star : $("input[type=radio][name=star-input]:checked").val(),
               member_num : $('#member_num').val(),
               member_name : $('#member_name').val(),
               member_photo : $('#member_photo').val(),
               r_content : $('#r_content').val()
            },
            success : function(data) {
               location.reload();
               $('#review').val("");
            }
         })

      })
      
      
      //읽었어요
      $('#num0').click(function(){
    	  
    	  //alert(1);
    	  
    		$.ajax({
    			url : '<%=request.getContextPath()%>/storeBook',
    			type : 'post',
    			dataType : 'text',
    			data : {
    				isbn : $('#isbn').val(),
    				member_num : $('#member_num').val(),
    				state_num : 0,	
    				imag : $('#imag').val()
    			},
    			success : function(data){ 
    				alert('읽었어요!');
    			}
    		});	 
    	  
    })
      
    //읽고있어요
      $('#num1').click(function(){
    	  
    	  //alert(1);
    	  
    		$.ajax({
    			url : '<%=request.getContextPath()%>/storeBook',
    			type : 'post',
    			dataType : 'text',
    			data : {
    				isbn : $('#isbn').val(),
    				member_num : $('#member_num').val(),
    				state_num : 1,		
    				imag : $('#imag').val()
    			},
    			success : function(data){ 
    				alert('읽고있어요!');
    			}
    		});	 
    	  
    });
    
    
    //읽고싶어요
      $('#num2').click(function(){
    	  
    	  //alert(1);
    	  
    		$.ajax({
    			url : '<%=request.getContextPath()%>/storeBook',
    			type : 'post',
    			dataType : 'text',
    			data : {
    				isbn : $('#isbn').val(),
    				member_num : $('#member_num').val(),
    				state_num : 2,		
    				imag : $('#imag').val()
    			},
    			success : function(data){ 
    				alert('읽고싶어요!');
    			}
    		});	 
    	  
    });
      

   })
</script>

<!-- 리뷰 삭제 -->

<script>

	function delchk(){
		
		if(confirm("삭제하시겠습니까?")){

			$.ajax({
				url: '<%=request.getContextPath()%>/review/delchk',
				type : 'post',
				dataType : 'text',
				data : {
					r_id : $('#r_id').val()
				},
				sucess : function(data){
					
				}
			})
			
	        return true;
	    } else {
	        return false;
	    }
	
	}

</script>

<!-- 리뷰 더보기 -->

<script>
$(window).on('load', function(){
	load('#js-load', '4');
	$(btn-cta-primary 
			)
})
</script>

<body>
			  <nav>
        <img id="home_but" src="${pageContext.request.contextPath}/resources/jspimg/logo.png">
        <div id="menu">
            <ul>
                <li><a href="/book/damso">책방</a></li>
                <li><a href="/book/bookcase/${member.member_num}">책장</a></li>
            
            </ul>
        </div>
        <div id="item"></div>
        <div class="dropdown">
            <img id=mem_photo src="/book/resources/profileImg/${member.member_photo }"><div id=mem_name>${member.member_name}</div>
            <div class="dropdown-content">
                <a href="/book/member/memberInfo">마이페이지</a>
                <a href="/book/member/logout">로그아웃</a>
            </div>
        </div>
        
    </nav>

<header class="header">
        <div class="container">                       
            <img class="profile-image img-responsive pull-left" src="${book.imag }" alt="${book.title }"/>
            <div class="profile-content pull-left">
                <h1 class="name">${book.title }</h1>
                <h2 class="desc">${book.author }</h2>
                <ul class="social list-inline">
					<li><a href="javascript:toSNS('twitter','트위터공유','http://localhost:8080/book/bookInfo/${book.isbn}')" title="트위터로 가져가기"><i class="fa fa-twitter"></i></a></li>                   
                    <%-- <li><a href="javascript:toSNS('facebook','공유제목','http://localhost:8080/book/bookInfo/${book.isbn}')" title="페이스북으로 가져가기"><i class="fa fa-facebook"></i></a></li> --%>   
                    <li><a href="javascript:toSNS('blog','공유제목!','http://localhost:8080/book/bookInfo/${book.isbn}')" title="네이버블로그로 가져가기"><i class="fa fa-facebook"></i></a></li>             
                    <li class="last-item"><a href="#"><i class="fa fa-hacker-news"></i></a></li>      
                </ul> 
            </div><!--//profile-->
			
			
				<!-- <form action="bookStore" method="post" enctype="multipart/form-data"> -->
	
            	<input type="hidden" name="isbn" id="isbn" value="${book.isbn }"> 
				<input type="hidden" name="member_num" id="member_num" value="${member.member_num }">
				<input type="hidden" name="imag" id="imag" value="${book.imag }">
	
				<input type="button" value="읽었어요" id="num0" class="btn btn-cta-primary pull-right"> 
				<input type="button" value="읽고있어요" id="num1" class="btn btn-cta-primary pull-right"> 
				<input type="button" value="읽고싶어요" id="num2" class="btn btn-cta-primary pull-right">
            <a class="btn btn-cta-primary pull-right" href="/book/bookNote/${book.isbn }" target="_blank"><i class="fa fa-paper-plane"></i> 독서노트</a>           
        </div><!--//container-->
    </header><!--//header-->

 <div class="container sections-wrapper">
        <div class="row">
            <div class="primary col-md-8 col-sm-12 col-xs-12">
                <section class="about section">
                    <div class="section-inner">
                        <h2 class="heading">줄거리</h2>
                        <div class="content">
                            <p>${book.description }</p>                   
                        </div><!--//content-->
                    </div><!--//section-inner-->                 
                </section><!--//section-->
    
        
                <section class="projects section">
                    <div class="section-inner">
                        <h2 class="heading">별 나눔</h2>
                        <div class="content">
                            <div class="item">               
                        <span class="star-input">
   	<span class="input">
       <input type="radio" name="star-input" value="0.5" id="p0.5">
          <label for="p0.5">0.5</label>
          <input type="radio" name="star-input" value="1" id="p1">
          <label for="p1">1</label>
          <input type="radio" name="star-input" value="1.5" id="p1.5">
          <label for="p1.5">1.5</label>
          <input type="radio" name="star-input" value="2" id="p2">
          <label for="p2">2</label>
          <input type="radio" name="star-input" value="2.5" id="p2.5">
          <label for="p2.5">2.5</label>
          <input type="radio" name="star-input" value="3" id="p3">
          <label for="p3">3</label>
          <input type="radio" name="star-input" value="3.5" id="p3.5">
          <label for="p3.5">3.5</label>
          <input type="radio" name="star-input" value="4" id="p4">
          <label for="p4">4</label>
             <input type="radio" name="star-input" value="4.5" id="p4.5">
             <label for="p4.5">4.5</label>
             <input type="radio" name="star-input" value="5" id="p5">
          <label for="p5">5</label>
     </span>
          
     <output for="star-input"><b>0</b></output>                  
</span>
                            </div>
                            <div class="item">
                            
                             <input type="hidden" name="isbn" id="isbn" value="${book.isbn }">
  							 <input type="hidden" name="member_num" id="member_num" value="${member.member_num }">
   							 <input type="hidden" name="member_name" id="member_name" value="${member.member_name }">
   							 <input type="hidden" name="member_photo" id="member_photo" value="${member.member_photo }">
  
                                 
   							<div class="content"><textarea name="r_content" id="r_content" rows="5" ></textarea></div>
   							<br> 
   							 <input type="button" id="r_but" value='등록' class="btn btn-cta-secondary pull-right">
                            </div><!--//item-->
                           
                           <c:forEach var="review" items="${r_list }" varStatus="status">
                            <div class="item js-load" >
                                <h3 class="title"><a class="pull-left" href="#">
                               <img class="media-object img-circle img-comments" src="/book/resources/profileImg/${review.member_photo }" width="35px" height="35px" />
                                                    </a>${review.member_name }</h3>
                                <p class="summary">${review.r_content }
                        
                                <c:if test="${member.member_num == review.mem_id }">
         	<input type="hidden" id="r_id" value="${review.r_id }">
           <td> <a href="" onclick="return delchk();">삭제</a> </td>
         </c:if>
         </p>
                               
                            </div><!--//item-->
                            </c:forEach>
                                                        
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </section><!--//section-->
                
                <section class="experience section">
                    <div class="section-inner">
                        <h2 class="heading">독서 노트</h2>
                        <div class="content">
                                   
                      <!-- First Member -->
                      <c:forEach var="note" items="${notes }" varStatus="status">
                      <div class="desc">
                         <div class="thumb">
                            <img class="img-circle" src="/book/resources/profileImg/${note.member_photo }" width="35px" height="35px" align="">
                         </div>
                         <div class="details">
                            <p><a href="#">${note.member_name }</a> <muted>${note.note_title }</muted><a href="/book/note/${note.note_id}/Anote">보기</a>
                            </p>
                         </div>
                      </div>
                      </c:forEach>
                     
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </section><!--//section-->
              
            </div><!--//primary-->
            <div class="secondary col-md-4 col-sm-12 col-xs-12">
                 <aside class="info aside section">
                    <div class="section-inner">
                        <h2 class="heading sr-only">more book Information</h2>
                        <div class="content">
                            <ul class="list-unstyled">
                                <li><i class="fa fa-map-marker"></i><span class="sr-only">Location:</span>평균 별점  :  ${avgStar }</li>
                                <li><i class="fa fa-envelope-o"></i><span class="sr-only">Email:</span><a href="#">담은 사람 수</a></li>
                                <li><i class="fa fa-link"></i><span class="sr-only">Website:</span><a href="${book.link}">구매 링크</a></li>
                            </ul>
                        </div><!--//content-->  
                    </div><!--//section-inner-->                 
                </aside><!--//aside-->
                            
                <aside class="blog aside section">
                    <div class="section-inner">
                        <h2 class="heading">채팅창</h2>
  						<iframe src="http://localhost:3000/chat?id=${loginInfo.member_name}" width="400" height="650" frameborder="0" ></iframe>

                        <div id="rss-feeds" class="content">

                        </div><!--//content-->
                    </div><!--//section-inner-->
                </aside><!--//section-->
            
            </div><!--//secondary-->    
        </div><!--//row-->
    </div><!--//masonry-->
    
    <!-- ******FOOTER****** --> 
    <footer class="footer">
        <div class="container text-center">
                <small class="copyright">@DamSo</small>
        </div><!--//container-->
    </footer><!--//footer-->
 
    <!-- Javascript -->          
    <script type="text/javascript" src="<c:url value="/resources/plugins/jquery-1.11.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/plugins/jquery-migrate-1.2.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js"/>"></script>    
    <script type="text/javascript" src="<c:url value="/resources/plugins/jquery-rss/dist/jquery.rss.min.js"/>"></script> 
    <!-- github activity plugin -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js">
    <script type="text/javascript" src="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.js"></script>
    <!-- custom js -->
    <script type="text/javascript" src="assets/js/main.js"></script>
    

</body>
</html>