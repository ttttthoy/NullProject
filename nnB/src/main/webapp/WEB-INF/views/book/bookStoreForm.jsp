<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책저장폼</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script>
	$(document).ready(function(){
		
		$('#booklike').submit(function(){
			var read1 = $('#num0').val();
			var read2 = $('#num1').val();
			var read3 = $('#num2').val();
	
			
				$("#num0").on("click", function(){
				
				var Num0 = $(this).val();
				
				if(Num0 != null){
					
					$.ajax({
						url : '<%= request.getContextPath()%>/views/booklike',
						type : 'post',
						dataType : 'text',
						data : {
							read1 : num0
						},
						success : function(data){
							if(data == "num0"){
								$('#sucread').alert('읽었어요!');
								$('#sread').prop("read",true);
							}else if(data == null){
								
							
							}
						}
					});
					
				}else {
					
					
				}
					
				});
				
				
				////////////////
				$("#num1").on("click", function(){
					
					var Num1 = $(this).val();
					
					if(Num1 != null){
						
						$.ajax({
							url : '<%= request.getContextPath()%>/views/booklike',
							type : 'post',
							dataType : 'text',
							data : {
								read2 : num1
							},
							success : function(data){
								if(data == "num1"){
									$('#sucread').alert('읽고있어요!');
									$('#sread').prop("read",true);
								}else if(data == null){
									
								
								}
							}
						});
						
					}else {
						
						
					}
						
					});
				
				
				//////////////////
				$("#num2").on("click", function(){
					
					var Num2 = $(this).val();
					
					if(Num2 != null){
						
						$.ajax({
							url : '<%= request.getContextPath()%>/views/booklike',
							type : 'post',
							dataType : 'text',
							data : {
								read3 : num2
							},
							success : function(data){
								if(data == "num2"){
									$('#sucread').alert('읽고싶어요!');
									$('#sread').prop("read",true);
								}else if(data == null){
									
								
								}
							}
						});
						
					}else {
						
						
					}
						
					});

				
				
			});
	});		

</script>

</head>
<body>
	
	<form action="bookStore" id="storeForm" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>
				<input type="submit" value="읽었어요">
				<input type="submit" value="읽고있어요">
				<input type="submit" value="읽고싶어요">
			</td>	
		</tr>
	</table>
	</form>

</body>
</html>