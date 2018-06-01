package com.bit.nullnull.socketchat;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
@Override
public void afterConnectionEstablished(WebSocketSession session) throws Exception {
System.out.println(session.getId()+"> CONNECT!");	
}
@Override
protected void handleTextMessage(WebSocketSession session, TextMessage message ) throws Exception{
	System.out.println(session.getId()+"로 부터 [ " + message.getPayload() + " ] 받았습니다.");
	session.sendMessage(new TextMessage("echo : " + message.getPayload()));
}
@Override
public void afterConnectionClosed(WebSocketSession session, CloseStatus status)throws Exception{
	System.out.println(session.getId() + "DISCONNECT! ");
}
}
