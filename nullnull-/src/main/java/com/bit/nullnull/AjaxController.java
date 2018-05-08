package com.bit.nullnull;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxController {

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	@ResponseBody
	public String getProduct() {

		return "good product";
	}

	@RequestMapping(value = "/product", method = RequestMethod.POST)
	@ResponseBody
	public String postProduct(
			@RequestParam("name") String pname, 
			@RequestParam("price") String price) {

		return pname + " : " + price;
	}

}
	
	
	
	