package com.controller.phone;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxController {

	@RequestMapping("/calc")
	public String calc() {
		return "calc";
	}
	@RequestMapping("/calc1")
	public String cal1c() {
		return "calc1";
	}
	@RequestMapping("/calc2")
	public String calc2() {
		return "calc2";
	}
	
}
