<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHATCHAT</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.js"></script>

<script>
var wsocket;
/* var loc = window.location, new_uri;
if(loc.protocol === "https:"){
	new_uri  = "wss:";
}else {
	new_uri = "ws:";
}new_uri +="//" + loc.host; */
//new_uri += loc.pathname ;//+ "/open/echo";
var new_uri = "ws://localhost:8080";
function connect() {
	
	wsocket = new WebSocket(new_uri + "/open/chat");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
	alert("안녕하세요");
}
function disconnect(){
	wsocket.close();
}
function onOpen(evt){
	appendMessage("연결 완료.");
}
function onMessage(evt){
	var data = evt.data;
	appendMessate(data);
}
function onClose(evt){
	appendMessage("연결 끊음.");
}
function send(){
	var name = $("#chatname").val();
	var msg = $("#message").val();
	alert("안녕하세요11111");
	wsocket.send("msg : 21321321" );
	$("#message").val("");
	alert("안녕하세요2222");
}
function appendMessage(msg){
	$("chatMessageArea").append(msg + "<br>");
	var chatAreaHeight = $("#chatArea").height();
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	$("#chatArea").scrollTop(maxScroll);
}
$(document).ready(function(){
	
	connect();
	
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.whitch);
	if(keycode == '13'){
		send();
	}
	event.stopPropagation();
	});
	$('#sendBtn').click(function(){send();  });
	   $('#enterBtn').click(function() { connect(); });
       $('#exitBtn').click(function() { disconnect(); });
})
</script>
<style type="text/css">
#chatArea {
	width: 800px;
	height: 200px;
	overflow-y: auto;
	border: 1px solid black;
}

.nickname {
	width: 50px;
}

.message {
	width: 700px;
}

.chatArea {
	width: 80%;
}
</style>
</head>

<body>
	<h1>대화 영역</h1>
	<div id="chatArea">
		<div id="chatMessageArea"></div>
	</div>
	<br>
	<input id="chatname" type="text" readonly value=${loginInfo.member_name} >
	<input id="message" class="message" type="text">
	<input type="button" id="sendBtn" value="전송">

</body>
</html>