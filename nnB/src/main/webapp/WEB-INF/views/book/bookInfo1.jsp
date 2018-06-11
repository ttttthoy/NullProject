<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>책정보 페이지</title>

<!-- BootStrap -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'> 
    <!-- Global CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">   
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.css">
    <!-- github acitivity css -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/octicons/2.0.2/octicons.min.css">
    <link rel="stylesheet" href="http://caseyscarborough.github.io/github-activity/github-activity-0.1.0.min.css">
    
    <!-- Theme CSS -->  
    <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">

</head>

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
               r_content : $('#r_content').val()
            },
            success : function(data) {
               location.reload();
               $('#review').val("");
            }
         })

      })

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


<body>
<header class="header">
        <div class="container">                       
            <img class="profile-image img-responsive pull-left" src="${book.imag }" alt="${book.title }" />
            <div class="profile-content pull-left">
                <h1 class="name">${book.title }</h1>
                <h2 class="desc">${book.author }</h2>
                <ul class="social list-inline">
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>                   
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-github-alt"></i></a></li>                  
                    <li class="last-item"><a href="#"><i class="fa fa-hacker-news"></i></a></li>      
                </ul> 
            </div><!--//profile-->
          <a class="btn btn-cta-primary pull-right" href="http://themes.3rdwavemedia.com/" target="_blank"><i class="fa fa-paper-plane"></i> 읽고 싶어요</a>
            <a class="btn btn-cta-primary pull-right" href="http://themes.3rdwavemedia.com/" target="_blank"><i class="fa fa-paper-plane"></i> 읽는 중이에요</a>
            <a class="btn btn-cta-primary pull-right" href="http://themes.3rdwavemedia.com/" target="_blank"><i class="fa fa-paper-plane"></i> 읽었어요</a>
            <a class="btn btn-cta-primary pull-right" href="http://themes.3rdwavemedia.com/" target="_blank"><i class="fa fa-paper-plane"></i> 독서노트</a>           
        </div><!--//container-->
    </header><!--//header-->


	<div>
   	<h1>책 정보 페이지</h1>
   	<br>
   	<table>
	
      	<tr>
         	<td><img src="${book.imag }"> ${book.title }</td>
      	</tr>
      	<tr>
         	<td>저자 | ${book.author }</td>
      	</tr>
      	<tr>
         	<td>출판사 | ${book.publisher }</td>
      	</tr>
      	<tr>
         	<td>출판년도 | ${book.pubdate }</td>
      	</tr>
      	<tr>
	      	<td>줄거리 | ${book.description }</td>
      	</tr>
      	<tr>
      	   <td>별점 | ${avgStar }</td>
      	</tr>
	      <tr>	
     	 	<td>리뷰 수 | ${cntReview }</td>
    	  </tr>
 	  </table>
	</div>


   <h3>리뷰 작성</h3>
   <br>
   
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

   <input type="hidden" name="isbn" id="isbn" value="${book.isbn }">
   <input type="hidden" name="member_num" id="member_num" value="${member.member_num }">
   
   <textarea name="r_content" id="r_content"></textarea>
   <br>
   <input type="button" id="r_but" value='등록'>
   

   <h2>리뷰</h2>

   <table>
      <tr>
         <td>별</td>
         <td>등록날짜</td>
         <td>아이디</td>
         <td>리뷰</td>
      </tr>
      <c:forEach var="review" items="${r_list }" varStatus="status">
         <tr>
            <td>${review.r_star }</td>
            <td>${review.reg_date }</td>
            <td>${review.mem_id }</td>
            <td>${review.r_content }</td>
         

         <c:if test="${member.member_num == review.mem_id }">
         	<input type="hidden" id="r_id" value="${review.r_id }">
           <td> <a href="" onclick="return delchk();">삭제</a> </td>
         </c:if>
			
		</tr>
      </c:forEach>

   </table>
  
   <h3>독서노트 리스트</h3>
   
   <table>

	<tr>
		<td>책</td>
		<td>회원 번호</td>
	</tr>

	<c:forEach var="note" items="${notes}" varStatus="status">
	<tr>
		<td>${note.b_title }</td>
		<td>${note.member_num }</td>
		<td>
			<a href="/book/note/${note.note_id}/Anote">보기</a>
		</td>
	</tr>
	</c:forEach>
</table>
   

</body>
</html>