<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	
$('#num0').click(function(){
	  
	  //alert(1);
	 
		$.ajax({
			url : '<%=request.getContextPath()%>/storeBookList',
			type : 'post',
			dataType : 'text',
			data : {

				isbn : $('#isbn').val(),
				member_num : $('#member_num').val(),
				state_num : 0,
				imag : $('#imag').val(),
			},
			success : function(data) {
				//window.location.replace("already.jsp");
				alert(num0);
			}
		});

	})
	
	
     $('#num1').click(function(){
    	  
    	  //alert(1);
    	  

    		$.ajax({
    			url : '<%=request.getContextPath()%>/storeBookList',
    			type : 'post',
    			dataType : 'text',
    			data : {
    				isbn : $('#isbn').val(),
    				member_num : $('#member_num').val(),
    				state_num : 1,		
    				imag : $('#imag').val()
    			},
    			success : function(data){ 
    			

    			}
    		});	 
    	  
    });
    
    
    
$('#num2').click(function(){
	  
	  //alert(1);
	  

		$.ajax({
			url : '<%=request.getContextPath()%>/storeBookList',
			type : 'post',
			dataType : 'text',
			data : {
				isbn : $('#isbn').val(),
				member_num : $('#member_num').val(),
				state_num : 2,		
				imag : $('#imag').val()
			},
			success : function(data){ 
				

			}
		});	 
	  
});
	
	
	
	
</script>

</head>
<body>

<!-- 	<div id="wrapper">

		<div id="left">
			<a href="javascript:menuClick('/a.jsp');">a link</a><br /> <a
				href="javascript:menuClick('/b.jsp');">b link</a>
		</div> -->
		

		<div class="total">
		
			<input type="button" value="읽었어요" id="num0"> 
			<input type="button" value="읽고있어요" id="num1">
			<input type="button" value="읽고싶어요" id="num2">

		</div>
		
		
	



<!-- 	</div> -->

</body>
</html>