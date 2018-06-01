<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>ECHO</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
$(document).ready(function(){
	$('#sendBtn').click(function(){
	sendMessage();	
	});
});
var wsocket;
function sendMessage(){
wsocket = new WebSocket("ws://localhost:8080/open/echo");
wsocket.onclose = onClose;
wsocket.onopen = onOpen;
}
function onMessage(evt) {
	var data = evt.data;
	alert('서버에서 데이터 받음 : ' + data);
	wsocket.close();
}

function onClose(evt) {
	alert('연결 끊김');
}
function onOpen() {
	wsocket.send($('#message').val());
}
</script>
</head>

<body>
<input type="text" id="message">
<input type="button" id="sendBtn" value="전송	">
</body>
</html>