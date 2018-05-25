package com.bit.nullnull.book.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.bit.nullnull.book.model.Book;

public class bookSearchService {
	public String getBookAllData(String keyword) throws Exception {

		String clientID = "pJTnBGUfEbBEjsxDg2oc";
		String clientSecret = "Vtm74Y51nd";
		System.out.println(keyword);
		String text = URLEncoder.encode(keyword, "UTF-8");
		
		URL url = new URL("https://openapi.naver.com/v1/search/book.xml?query=" + text);

		URLConnection urlConn = url.openConnection(); // openConnection 해당 요청에 대해서 쓸 수 있는 connection 객체

		urlConn.setRequestProperty("X-Naver-Client-ID", clientID);
		urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));

		String data = "";
		String msg = null;
				
		while ((msg = br.readLine()) != null) {
			// System.out.println(msg);
			data += msg;
		}

		return data;
	}

	public List<Book> getBookList(String data) throws XmlPullParserException, IOException {

		List<Book> list = null; // 결과데이터 담을 리스트
		// System.out.println(data); //응답받은 xml문서 xml문서로부터 내가 원하는 값 탐색하기(xml 파싱)
		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(data));
		int eventType = parser.getEventType();
		Book b = null;
		while (eventType != XmlPullParser.END_DOCUMENT) {
			switch (eventType) {
			case XmlPullParser.END_DOCUMENT:// 문서의 끝
				break;
			case XmlPullParser.START_DOCUMENT:
				list = new ArrayList<Book>();
				break;
			case XmlPullParser.END_TAG: {
				String tag = parser.getName();
				if (tag.equals("item")) {
					list.add(b);
					b = null;
				}
			}

			case XmlPullParser.START_TAG: { // 무조건 시작하면 만남
				String tag = parser.getName();
				switch (tag) {
				case "item": // item가 열렸다는것은 새로운 책이 나온다는것
					b = new Book();
					break;
				case "title":
					if (b != null)
						b.setTitle(parser.nextText());
					break;
				case "link":
					if (b != null)
						b.setLink(parser.nextText());
					break;
				case "image":
					if (b != null)
						b.setImag(parser.nextText());
					break;
				case "author":
					if (b != null)
						b.setAuthor(parser.nextText());
					break;
				case "publisher":
					if (b != null)
						b.setPublisher(parser.nextText());
					break;
				case "pubdate":
					if (b != null)
						b.setPubdate(parser.nextText());
					break;
				case "isbn":
					if (b != null)
						b.setIsbn(parser.nextText());
					break;
				case "description":
					if (b != null)
						b.setDescription(parser.nextText());
					break;
				}
				break;
			}
			}
			eventType = parser.next();

		}

		for (Book book : list) {
			System.out.println(book);
		}

		return list;
	}

	public Book getABook(String data) throws XmlPullParserException, IOException {

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser parser = factory.newPullParser(); // 연결하는거 담고
		parser.setInput(new StringReader(data));
		int eventType = parser.getEventType();
		Book b = null;
		while (eventType != XmlPullParser.END_DOCUMENT) {
			switch (eventType) {
			case XmlPullParser.START_TAG: { // 무조건 시작하면 만남
				String tag = parser.getName();
				switch (tag) {
				case "item": // item가 열렸다는것은 새로운 책이 나온다는것
					b = new Book();
					break;
				case "title":
					if (b != null)
						b.setTitle(parser.nextText());
					break;
				case "link":
					if (b != null)
						b.setLink(parser.nextText());
					break;
				case "image":
					if (b != null)
						b.setImag(parser.nextText());
					break;
				case "author":
					if (b != null)
						b.setAuthor(parser.nextText());
					break;
				case "publisher":
					if (b != null)
						b.setPublisher(parser.nextText());
					break;
				case "pubdate":
					if (b != null)
						b.setPubdate(parser.nextText());
					break;
				case "isbn":
					if (b != null)
						b.setIsbn(parser.nextText());
					break;
				case "description":
					if (b != null)
						b.setDescription(parser.nextText());
					break;
				}
				break;
			}
			}
			eventType = parser.next();

		}


		return b;
	}

}
