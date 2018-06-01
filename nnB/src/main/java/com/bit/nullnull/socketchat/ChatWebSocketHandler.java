package com.bit.nullnull.socketchat;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	private Map<String, WebSocketSession> member = new ConcurrentHashMap<String, WebSocketSession>();
	@Override
	public void afterConnectionEstablished(WebSocketSession session ) throws Exception{
		System.out.println(session.getId() + " 연결 성공.");
		member.put(session.getId(), session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println(session.getId() + "로 부터 메세지 수신 : " + message.getPayload());
		for(WebSocketSession so : member.values()) {
			so.sendMessage(message);
			System.out.println(so.getId() + "에 메세지 발송 :: " + message.getPayload());
		}
	}
	@Override 
	public void handleTransportError(WebSocketSession session, Throwable exception)throws Exception{
		System.out.println(session.getId() + " 익셉션 발생 : " +exception.getMessage());
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println(session.getId() + "연결 종료.");
		member.remove(session.getId());
	}
}
