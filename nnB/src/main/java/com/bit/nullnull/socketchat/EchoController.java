package com.bit.nullnull.socketchat;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EchoController {
@RequestMapping(value = "/echo", method = RequestMethod.GET)
public String chat(Locale locale, Model model) {
	return("/chatroom/echo");
}

}
