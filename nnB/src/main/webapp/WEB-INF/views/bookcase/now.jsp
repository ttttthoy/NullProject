<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>읽고있어요</title>

<script>
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

</script>


</head>
<body>

	<input type="hidden" name="isbn" id="isbn" value="${b.isbn }">
	<input type="hidden" name="title" id="title" value="${b.title }">
	<input type="hidden" name="imag" id="imag" value="${b.imag }">
	

</body>
</html>